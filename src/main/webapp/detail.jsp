<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.util.*,java.util.concurrent.*,java.util.Iterator" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 리뷰 상세</title>
  <!-- 팀 공용 헤더 + 상세 전용 CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail.css">
</head>
<body>

  <%@ include file="header.jsp" %>
  <div class="header-spacer"></div>

<%
  /* ============== 1) 메인 → 상세 파라미터 수신 ============== */
  String id          = request.getParameter("id");
  String titleKo     = request.getParameter("titleKo");
  String titleEn     = request.getParameter("titleEn");
  String releaseDate = request.getParameter("releaseDate");
  String runtimeMin  = request.getParameter("runtimeMin");
  String genre       = request.getParameter("genre");
  String country     = request.getParameter("country");
  String rating      = request.getParameter("rating");
  String director    = request.getParameter("director");
  String posterUrl   = request.getParameter("posterUrl");
  String overview    = request.getParameter("overview");
  String trailerUrl  = request.getParameter("trailerUrl");
  String photosRaw   = request.getParameter("photos"); // url1;url2;...

  /* ============== 2) 세션 캐시(한 번만 풀 데이터 받아도 유지) ============== */
  if (id == null || id.isBlank()) id = (String) session.getAttribute("lastMovieId");
  if (id == null || id.isBlank()) id = "unknown";

  String cacheKey = "movie." + id;
  @SuppressWarnings("unchecked")
  Map<String,String> cached = (Map<String,String>) session.getAttribute(cacheKey);

  boolean hasFullData = (titleKo!=null) || (posterUrl!=null) || (overview!=null);
  if (hasFullData) {
      Map<String,String> mv = new HashMap<>();
      mv.put("id", id);
      mv.put("titleKo",     titleKo);
      mv.put("titleEn",     titleEn);
      mv.put("releaseDate", releaseDate);
      mv.put("runtimeMin",  runtimeMin);
      mv.put("genre",       genre);
      mv.put("country",     country);
      mv.put("rating",      rating);
      mv.put("director",    director);
      mv.put("posterUrl",   posterUrl);
      mv.put("overview",    overview);
      mv.put("trailerUrl",  trailerUrl);
      mv.put("photos",      photosRaw);
      cached = mv;
      session.setAttribute(cacheKey, cached);
      session.setAttribute("lastMovieId", id);
  } else if (cached == null) {
      cached = new HashMap<>();
  }

  titleKo     = cached.getOrDefault("titleKo", "");
  titleEn     = cached.getOrDefault("titleEn", "");
  releaseDate = cached.getOrDefault("releaseDate", "");
  runtimeMin  = cached.getOrDefault("runtimeMin", "");
  genre       = cached.getOrDefault("genre", "");
  country     = cached.getOrDefault("country", "");
  rating      = cached.getOrDefault("rating", "");
  director    = cached.getOrDefault("director", "");
  posterUrl   = cached.getOrDefault("posterUrl", "");
  overview    = cached.getOrDefault("overview", "");
  trailerUrl  = cached.getOrDefault("trailerUrl", "");
  photosRaw   = cached.getOrDefault("photos", "");

  /* ============== 3) 사진/영상 전처리 ============== */
  String trailer = trailerUrl==null ? "" : trailerUrl;
  if (trailer.contains("watch?v=")) {
    trailer = "https://www.youtube.com/embed/" + trailer.substring(trailer.indexOf("watch?v=")+8).split("&")[0];
  }
  String[] photos = (photosRaw==null || photosRaw.isBlank()) ? new String[0] : photosRaw.split("\\s*;\\s*");

  /* 제목/데이터 상태 플래그 */
  boolean hasTitle = (titleKo != null && !titleKo.isBlank());
  boolean hasMovieData = hasTitle || (posterUrl!=null && !posterUrl.isBlank()) || (overview!=null && !overview.isBlank());

  /* ============== 4) 리뷰 저장소(application) ============== */
  @SuppressWarnings("unchecked")
  ConcurrentHashMap<String, List<Map<String,Object>>> store =
    (ConcurrentHashMap<String, List<Map<String,Object>>>) application.getAttribute("REVIEWS_STORE");
  if (store == null) {
      store = new ConcurrentHashMap<>();
      application.setAttribute("REVIEWS_STORE", store);
  }

  String me = (String) session.getAttribute("userId");
  if (me == null) { me = "u-" + session.getId(); session.setAttribute("userId", me); }
  final String meId = me;

  /* ============== 5) 액션 처리(add/delete) ============== */
  String action = request.getParameter("action");

  if ("add".equals(action)) {
      String content = Optional.ofNullable(request.getParameter("content")).orElse("").trim();
      if (content.length() > 30) content = content.substring(0,30);

      double r = 0.0; try { r = Double.parseDouble(request.getParameter("rating")); } catch(Exception ignore){}
      r = Math.max(0.5, Math.min(5.0, Math.round(r*2)/2.0));
      String nick = request.getParameter("nick"); if (nick==null || nick.isBlank()) nick="익명";

      if (content.isEmpty()) {
          session.setAttribute("review_error", "리뷰를 입력하세요 (30자 이내).");
      } else {
          Map<String,Object> rv = new HashMap<>();
          rv.put("id", System.currentTimeMillis());
          rv.put("movieId", id);
          rv.put("userId", meId);
          rv.put("nickname", nick);
          rv.put("rating", r);
          rv.put("content", content);
          rv.put("createdAt", new java.sql.Timestamp(System.currentTimeMillis()));

          List<Map<String,Object>> list = store.get(id);
          if (list == null) {
              list = Collections.synchronizedList(new ArrayList<Map<String,Object>>());
              store.put(id, list);
          }
          synchronized(list){ list.add(0, rv); }
      }

  } else if ("delete".equals(action)) {
      String rid = request.getParameter("rid");
      if (rid != null) {
          long key = 0L; try { key = Long.parseLong(rid); } catch(Exception ignore){}
          List<Map<String,Object>> list = store.get(id);
          if (list != null) {
              synchronized(list){
                  for (Iterator<Map<String,Object>> it = list.iterator(); it.hasNext();) {
                      Map<String,Object> mv = it.next();
                      long mid = ((Number)mv.get("id")).longValue();
                      String uid = String.valueOf(mv.get("userId"));
                      if (key == mid && meId.equals(uid)) {
                          it.remove();
                      }
                  }
              }
          }
      }
  }

  List<Map<String,Object>> reviews = store.getOrDefault(id, Collections.<Map<String,Object>>emptyList());
  double sum = 0.0; for (Map<String,Object> v : reviews) sum += (double)v.get("rating");
  double avg = reviews.isEmpty()? 0.0 : Math.round((sum/reviews.size())*10)/10.0;
%>

<!-- ======= 화면 ======= -->

<% if (!hasMovieData) { %>
  <div class="note note-warn container">
    현재 선택된 영화 데이터가 없습니다. 메인에서 영화를 선택해 주세요.
  </div>
<% } %>

<section class="hero">
  <div class="container">
    <div class="hero-inner">
      <div>
        <h1 class="movie-title <%= hasTitle ? "" : "placeholder" %>">
          <%= hasTitle ? titleKo : "제목 정보 없음" %>
        </h1>
        <% if (titleEn != null && !titleEn.isBlank()) { %>
          <div class="title-en"><%= titleEn %></div>
        <% } %>

        <dl class="meta">
          <dt>개봉</dt><dd><%= releaseDate %></dd>
          <dt>시간</dt><dd><%= (runtimeMin==null||runtimeMin.isBlank()) ? "" : runtimeMin+"분" %></dd>
          <dt>장르</dt><dd><%= genre %></dd>
          <dt>국가</dt><dd><%= country %></dd>
          <dt>등급</dt><dd><%= rating %></dd>
          <dt>감독</dt><dd><%= director %></dd>
        </dl>
      </div>

      <img class="poster" src="<%= posterUrl %>" alt="포스터">
    </div>
  </div>
</section>

<div class="container section">
  <h3>줄거리</h3>
  <p class="synopsis"><%= (overview==null || overview.isBlank()) ? "줄거리 준비중입니다." : overview %></p>
</div>

<div class="container section">
  <h3>사진 · 영상</h3>

  <% if (trailer != null && !trailer.isBlank()) { %>
    <div class="video-16x9" style="margin-bottom:14px;">
      <%
        String iframe = "<iframe src=\\\"" + trailer + "\\\" title=\\\"Teaser/Trailer\\\""
                      + " allow=\\\"fullscreen; picture-in-picture\\\" allowfullscreen></iframe>";
        out.write(iframe);
      %>
    </div>
  <% } %>

  <div class="media-grid">
    <% for (String p : photos) { if (p==null || p.isBlank()) continue; %>
      <img src="<%= p %>" alt="스틸컷">
    <% } %>
  </div>
</div>

<div class="container section" id="reviews">
  <h3>리뷰 작성</h3>

  <%
    String msg = (String) session.getAttribute("review_error");
    if (msg != null) { session.removeAttribute("review_error"); %>
      <p style="color:#ff6b6b; margin:6px 0;"><%= msg %></p>
  <% } %>

  <form action="" method="post" class="review-form">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="id" value="<%= id %>">

    <div class="star-picker">
      <div class="bg">★★★★★</div>
      <div class="fill" id="starFill">★★★★★</div>
    </div>
    <input id="ratingRange" class="rating-range" type="range" name="rating" min="0.5" max="5" step="0.5" value="3">
    <span class="rating-text"><span id="ratingValue">3.0</span> / 5</span>

    <input type="text" name="nick" placeholder="닉네임(선택)" class="review-input">
    <input type="text" name="content" maxlength="30" placeholder="짧은 리뷰 (30자 이내)" required class="review-input wide">
    <button type="submit" class="btn-primary">등록</button>
  </form>

  <div class="review-summary">
    <strong>평균</strong> <span class="avg-star">★</span>
    <span class="avg-num"><%= String.format("%.1f", avg) %></span>
    <span class="cnt">(<%= reviews.size() %>명)</span>
  </div>

  <ul class="review-list">
    <% for (Map<String,Object> r : reviews) { %>
      <li class="review-item">
        <div class="left">
          <div class="stars" style="--w:<%= (((double)r.get("rating"))/5.0*100) %>%">
            <span class="bg">★★★★★</span>
            <span class="fill">★★★★★</span>
          </div>
          <span class="score"><%= String.format("%.1f", (double)r.get("rating")) %></span>
        </div>
        <div class="body">
          <div class="meta">
            <span class="nick"><%= (String)r.get("nickname") %></span>
            <span class="time"><%= r.get("createdAt") %></span>
          </div>
          <div class="content"><%= (String)r.get("content") %></div>
        </div>
        <div class="right">
          <% if (String.valueOf(r.get("userId")).equals(meId)) { %>
            <form action="" method="post" onsubmit="return confirm('삭제할까요?');">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="id" value="<%= id %>">
              <input type="hidden" name="rid" value="<%= r.get("id") %>">
              <button type="submit" class="btn-danger">삭제</button>
            </form>
          <% } %>
        </div>
      </li>
    <% } %>
  </ul>
</div>

<script>
  function updateStars(v){
    const pct = (parseFloat(v) / 5) * 100;
    document.getElementById('starFill').style.width = pct + '%';
    document.getElementById('ratingValue').textContent = parseFloat(v).toFixed(1);
  }
  window.addEventListener('DOMContentLoaded', function(){
    const el = document.getElementById('ratingRange');
    updateStars(el.value);
    el.addEventListener('input', e => updateStars(e.target.value));
  });
</script>

</body>
</html>
