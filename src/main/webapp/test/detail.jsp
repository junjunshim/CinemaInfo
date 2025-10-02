<%@ page contentType="text/html; charset=UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 리뷰 상세</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <%@ include file="header.jsp" %>

<%
  // 서블릿(app.web.MovieDetailServlet)이 넘겨준 데이터
  app.model.Movie m = (app.model.Movie) request.getAttribute("movie");
  String err = (String) request.getAttribute("error");
%>

<% if (m == null) { %>
  <div class="container">
    <h2><%= (err==null ? "영화를 찾을 수 없습니다." : err) %></h2>
    <p><a class="title-link" href="<%=request.getContextPath()%>/index.jsp">메인으로 돌아가기</a></p>
  </div>
<% } else { 
     // 사진 목록
     String rawPhotos = m.getPhotos();
     String[] photos = (rawPhotos==null || rawPhotos.isBlank()) ? new String[0] : rawPhotos.split("\\s*;\\s*");

     // 유튜브 watch 링크면 embed로 치환
     String trailer = m.getTrailerUrl()==null ? "" : m.getTrailerUrl();
     if (trailer.contains("watch?v=")) {
       trailer = "https://www.youtube.com/embed/" + trailer.substring(trailer.indexOf("watch?v=")+8).split("&")[0];
     }

     // 리뷰 관련 (경고 없는 안전 캐스팅)
     List<?> reviewsAny = (List<?>) request.getAttribute("reviews");
     Double avg = (Double) request.getAttribute("avgRating");
     Integer reviewCount = (Integer) request.getAttribute("reviewCount");

     if (reviewsAny == null) reviewsAny = Collections.emptyList();
     if (reviewCount == null) reviewCount = reviewsAny.size();
%>

  <!-- 상단: 정보(좌) + 포스터(우) -->
  <section class="hero">
    <div class="container">
      <div class="hero-inner">
        <div>
          <h1 class="title-ko"><a class="title-link" href="<%=request.getContextPath()%>/index.jsp">영화리뷰</a></h1>
          <h2 class="title-ko"><%= m.getTitleKo()==null? "" : m.getTitleKo() %></h2>
          <div class="title-en"><%= m.getTitleEn()==null? "" : m.getTitleEn() %></div>

          <dl class="meta">
            <dt>개봉</dt><dd><%= m.getReleaseDate()==null ? "" : m.getReleaseDate() %></dd>
            <dt>시간</dt><dd><%= m.getRuntimeMin()==null? "" : (m.getRuntimeMin()+"분") %></dd>
            <dt>장르</dt><dd><%= m.getGenre()==null? "" : m.getGenre() %></dd>
            <dt>국가</dt><dd><%= m.getCountry()==null? "" : m.getCountry() %></dd>
            <dt>등급</dt><dd><%= m.getRating()==null? "" : m.getRating() %></dd>
            <dt>감독</dt><dd><%= m.getDirector()==null? "" : m.getDirector() %></dd>
          </dl>
        </div>

        <img class="poster" src="<%= m.getPosterUrl()==null? "" : m.getPosterUrl() %>" alt="포스터">
      </div>
    </div>
  </section>

  <!-- 줄거리 -->
  <div class="container section">
    <h3>줄거리</h3>
    <p class="synopsis">
      <%= (m.getOverview()==null || m.getOverview().isBlank()) ? "줄거리 준비중입니다." : m.getOverview() %>
    </p>
  </div>

  <!-- 사진 · 영상 -->
  <div class="container section">
    <h3>사진 · 영상</h3>

    <% if (trailer != null && !trailer.isBlank()) { %>
      <div class="video-16x9" style="margin-bottom:14px;">
        <%
          // Eclipse HTML validator 경고 피하려고 문자열로 iframe 출력
          String iframe = "<iframe src=\\\"" + trailer + "\\\""
                        + " title=\\\"Teaser/Trailer\\\""
                        + " allow=\\\"fullscreen; picture-in-picture\\\" allowfullscreen"
                        + "></iframe>";
          out.write(iframe);
        %>
      </div>
    <% } %>

    <div class="media-grid">
      <% for (String p : photos) {
           if (p==null || p.isBlank()) continue; %>
        <img src="<%= p %>" alt="스틸컷">
      <% } %>
    </div>
  </div>

  <!-- 리뷰 -->
  <div class="container section" id="reviews">
    <h3>리뷰 작성</h3>

    <%
      String msg = (String) session.getAttribute("review_error");
      if (msg != null) { session.removeAttribute("review_error"); %>
        <p style="color:#ff6b6b; margin:6px 0;"><%= msg %></p>
    <% } %>

    <!-- 리뷰 작성 폼 -->
    <form action="<%=request.getContextPath()%>/reviews" method="post" class="review-form">
      <input type="hidden" name="action" value="add">
      <input type="hidden" name="movieId" value="<%= m.getId() %>">

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

    <!-- 평균 -->
    <div class="review-summary">
      <strong>평균</strong> <span class="avg-star">★</span>
      <span class="avg-num"><%= (avg==null ? "0.0" : String.format("%.1f", avg)) %></span>
      <span class="cnt">(<%= reviewCount %>명)</span>
    </div>

    <!-- 리뷰 목록 -->
    <ul class="review-list">
      <%
        String me = (String) session.getAttribute("userId");
        for (Object o : reviewsAny) {
          app.model.Review r = (app.model.Review) o;
      %>
        <li class="review-item">
          <div class="left">
            <div class="stars" style="--w:<%= (r.getRating()/5.0*100) %>%">
              <span class="bg">★★★★★</span>
              <span class="fill">★★★★★</span>
            </div>
            <span class="score"><%= String.format("%.1f", r.getRating()) %></span>
          </div>
          <div class="body">
            <div class="meta">
              <span class="nick"><%= r.getNickname() %></span>
              <span class="time"><%= r.getCreatedAt() %></span>
            </div>
            <div class="content"><%= r.getContent() %></div>
          </div>
          <div class="right">
            <% if (me != null && me.equals(r.getUserId())) { %>
              <form action="<%=request.getContextPath()%>/reviews" method="post" onsubmit="return confirm('삭제할까요?');">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="movieId" value="<%= m.getId() %>">
                <input type="hidden" name="id" value="<%= r.getId() %>">
                <button type="submit" class="btn-danger">삭제</button>
              </form>
            <% } %>
          </div>
        </li>
      <% } %>
    </ul>
  </div>

<% } %>

<!-- 별점 슬라이더 -->
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


