<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- detail.jsp에서 사용될 자바 클래스 설정
	 java.util.List => 영화의 리뷰들을 리스트 형태로 관리하기 위한 List 클래스
	 dto.Movie => 영화의 정보를 담는 클래스
	 dto.Review => 리뷰의 정보를 담는 클래스
-->
<%@ page import="java.util.List, dto.Movie, dto.Review" %>
<%
	// 영화의 정보를 담고있는 Movie객체 가져오기
	Movie movie = (Movie)request.getAttribute("movie");
	// 영화의 리뷰들을 리스트 형태로 가져오기
	List<Review> reviewList = (List<Review>)request.getAttribute("reviewList");
	// 영화의 예고편 주소를 담는 변수
	String trailerUrl = "";
	// Moives 테이블에 저장되는 영화들의 예고편은 유튜브 링크
	// 해당 주소를 임베디드용 주소로 변환이 필수 (iframe 태크를 사용하기 때문이다)
	// ex) https://www.youtube.com/watch?v=dQw4w9WgXcQ => https://www.youtube.com/embed/dQw4w9WgXcQ
	if (movie != null && movie.getVideo_path() != null && !movie.getVideo_path().isEmpty()) {
        String originalUrl = movie.getVideo_path();
        // 1. "watch?v=" 형태인 경우 -> "embed/" 로 변환
        if (originalUrl.contains("watch?v=")) {
            trailerUrl = originalUrl.replace("watch?v=", "embed/");
        } 
        // 2. "youtu.be/" (공유 링크) 형태인 경우 -> "www.youtube.com/embed/" 로 변환
        else if (originalUrl.contains("youtu.be/")) {
            trailerUrl = originalUrl.replace("youtu.be/", "www.youtube.com/embed/");
        } 
        // 3. 이미 embed 주소라면 그대로 사용
        else {
            trailerUrl = originalUrl;
        }
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 리뷰 상세</title>
  <!-- css 링크 -->
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/detail.css">
  <link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<!-- include 액션 태그로 header.jsp 포함 -->
  	<%@ include file="header.jsp" %>
	<%
		// 영화 객체에 값이 없으면 표시
		if (movie == null) {
	%>
	<div class="note note-warn container">
    	현재 선택된 영화 데이터가 없습니다. 메인에서 영화를 선택해 주세요.
 	</div>
	<%
		}
	%>
	<!-- 영화 상세 정보 출력 부분 
		 1. 삼항 연산자로 movie에 멤버들의 값이 있으면 출력, 없으면 예외 값 출력
		 2. 카테고리와 배우 같이 '|'으로 구별된 문자열은 sqlit()를 통해서 배열로 변환 뒤 출력
	-->
	<section class="hero">
  		<div class="container">
    		<div class="hero-inner">
      			<div>
        			<h1 class="movie-title <%=!movie.getMovie_title().isEmpty() ? "" : "placeholder" %>">
          				<%=!movie.getMovie_title().isEmpty() ? movie.getMovie_title() : "제목 정보 없음" %>
        			</h1>
       				<dl style="padding: 0px 0px 50px 30px;" class="meta">
          				<dt>개봉</dt><dd><%=movie.getRelease_date() %></dd>
				        <dt>시간</dt><dd><%=movie.getDuration()+"분" %></dd>
				        <%
				        	String[] categorys = movie.getCategory().split("\\|"); 
				        %>
				        <dt>장르</dt><dd>
				        				<%	
				        					for(int i = 0; i < categorys.length; i++){
				        				%>
				        					<span><%=categorys[i] %></span>
				        				<%
				        					}
				        				%>
				        			</dd>
				        <dt>국가</dt><dd><%=movie.getCountry() %></dd>
				        <dt>등급</dt><dd><%=movie.getFilm_rating() %></dd>
				        <dt>감독</dt><dd><%=movie.getDirector() %></dd>
				        <%
				        	String[] actors = movie.getMain_actor().split("\\|");
				        %>
				        <dt>주연</dt><dd>
										<%
											for(int i = 0; i < actors.length; i++){
										%>
											<span><%=actors[i] %></span>
										<%
											}
										%>				        			
				        			</dd>
			        </dl>
      			</div>
      			<!-- 영화 포스터
      				 request.getContextPath() + %=movie.getImg_path() %>main.png => 프로젝트 경로 + 영화의 메인포스터 경로
      			-->
      			<img class="poster" src="<%=request.getContextPath() %><%=movie.getImg_path() %>main.png" alt="<%=movie.getMovie_title() %> 포스터">
    		</div>
  		</div>
	</section>
	<!-- 영화의 시놉시스 부분 -->
	<div class="container section">
  		<h3>&nbsp;시놉시스</h3>
  		<!-- 삼항 연산자로 영화 상세내용이 있는지 확인 후 값 출력 -->
  		<p class="synopsis"><%=!movie.getDescription().isEmpty() ?  movie.getDescription() : "줄거리 준비중입니다." %></p>
	</div>
	<!-- 영화 사진 부분 -->
	<div class="container section">
		<!-- detail 서블릿 파일에서 가져온 서브 이미지들 가져오기 -->
		<%
		List<String> subImages = (List<String>) request.getAttribute("subImages");
		%>
		<h3>&nbsp;사진(<%=subImages.size() %>)</h3>
		<div class="gallery-container">
		<!-- 서브 이미지가 있는지 확인 -->
        <% 
        if (subImages != null && !subImages.isEmpty()) { 
            for (String imgPath : subImages) { 
        %>	
        	<!-- 서브 이미지 클릭 시, imgModal 태그에 사진 출력 -->
            <div class="gallery-item" onclick="openModal('<%= request.getContextPath() %><%= imgPath %>')">
                <img src="<%= request.getContextPath() %><%= imgPath %>" alt="스틸컷">
                <div class="overlay">🔍</div> </div>
        <% 
            }
        // 서브 이미지가 없을 경우 출력
        } else { 
        %>
            <p class="no-data">등록된 스틸컷이 없습니다.</p>
        <% } %>
    </div>
	</div>
	<!-- 영화 영상 부분 -->
	<div class="container section">
		<h3>&nbsp;영상</h3>
		<!-- 앞서 변환한 임베디드 주소로 영상 구성 => trailerUrl-->
		<% if (!trailerUrl.isEmpty()) { %>
        <div class="video-container">
        	<!-- iframe 속성
        		 src => 영상 주소(임베디드 주소)
        		 frameborder => 테두리 두께
        		 allow => 기능 허용 리스트, ex) autoplay => 자동 재생
        		 allowfullscreen => 전체 화면 보기 활성화
        	-->
            <iframe 
                src="<%= trailerUrl %>" 
                title="YouTube video player" 
                frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
            </iframe>
        </div>
    	<% }
		// 영상이 없을 경우 출력
		else { %>
        <p class="no-data">등록된 예고편이 없습니다.</p>
    	<% } %>
	</div>
	<!-- 리뷰 부분 -->
	<div class="container section" id="reviews">
  		<h3>&nbsp;리뷰 작성</h3>
  		<!-- 리뷰 작성 방식
  			 1. post 발생 시, 서블릿 doPost()함수 호출 (action 속성이 없을 경우) 
  			 2. doPost() 함수에서 action파라미터 의 값이 add면 리뷰 작성, delete면 리뷰 삭제
  			 3. 넘어간 폼 데이터를 doPost() 함수 내부에서 처리 후 , dao 객체를 통해서 데이터베이스에 저장
  		-->
  		<!-- movie 객체의 getter를 통해서 movie의 멤버 값을 출력 --> 
		<form action="" method="post" class="review-form">
			<input type="hidden" name="action" value="add">
        	<input type="hidden" name="id" value="<%= movie.getMovie_id() %>">
			<div class="star-picker">
      			<div class="bg">★★★★★</div>
      			<div class="fill" id="starFill">★★★★★</div>
    		</div>
    		<input id="ratingRange" class="rating-range" type="range" name="rating" min="0.5" max="10" step="0.5" value="3">
    		<span class="rating-text"><span id="ratingValue">3.0</span> / 10</span>
    		<input type="text" name="content" maxlength="30" placeholder="짧은 리뷰 (30자 이내)" required class="review-input wide">
    		<button type="submit" class="btn-primary">등록</button>
  		</form>
  		<div class="review-summary">
	    	<strong>평균</strong> <span class="avg-star">★</span>
	    	<span class="avg-num"><%=movie.getAvg_rating() %></span>
	    	
 		</div>
		<ul class="review-list">
			<!-- 영화의 리뷰 리스트를 통해서 list 사이즈를 만큼 반복하여 출력 
				 Revie 객체에 하나씩 저장하여 출력
			-->
    		<%
    			if(reviewList != null && !reviewList.isEmpty()){
	    			for (int i = 0; i < reviewList.size(); i++) {
	    				Review review = reviewList.get(i);
    		%>
    		<li class="review-item">
        		<div class="left">
          			<div class="stars" style="--w:<%= (review.getRating()/10.0*100) %>%">
            			<span class="bg">★★★★★</span>
            			<span class="fill">★★★★★</span>
          			</div>
          			<span class="score"><%= String.format("%.1f", review.getRating()) %></span>
        		</div>
        		<div class="body">
          			<div class="meta">
            			<span class="nick"><%=review.getUserName() %></span>
            			<span class="time"><%=review.getReview_date() %></span>
          			</div>
          			<div class="content"><%=review.getReview_comment() %></div>
        		</div>
        		<div class="right">
        		<!-- 리뷰의 작성자 id가 사용자 id와 같다면 삭제 버튼 출력 -->
          			<% if (review.getUserName().equals(userId)) { %>
            		<form action="" method="post" onsubmit="return confirm('삭제할까요?');">
	              		<input type="hidden" name="action" value="delete">
	              		<input type="hidden" name="id" value="<%=userId %>">
	              		<input type="hidden" name="rid" value="<%=review.getReview_id() %>">
	              		<button type="submit" class="btn-danger">삭제</button>
            		</form>
          			<% } %>
        		</div>
			</li>
    		<% 
    				}
    			}
    		%>
  		</ul>
  	</div>
	

<script>
  function updateStars(v){
    const pct = (parseFloat(v) / 10) * 100;
    document.getElementById('starFill').style.width = pct + '%';
    document.getElementById('ratingValue').textContent = parseFloat(v).toFixed(1);
  }
  window.addEventListener('DOMContentLoaded', function(){
    const el = document.getElementById('ratingRange');
    updateStars(el.value);
    el.addEventListener('input', e => updateStars(e.target.value));
  });
</script>
<div id="imageModal" class="modal" onclick="closeModal()">
        <span class="close">&times;</span>
        <img class="modal-content" id="modalImg">
</div>
<script>
    // 모달 요소를 가져옵니다.
    const modal = document.getElementById("imageModal");
    const modalImg = document.getElementById("modalImg");

    // 이미지를 클릭했을 때 실행되는 함수
    function openModal(imageSrc) {
        modal.style.display = "block"; // 모달 보이기
        modalImg.src = imageSrc;       // 클릭한 이미지 경로를 모달 이미지에 설정
        document.body.style.overflow = "hidden"; // 배경 스크롤 막기
    }

    // 모달을 닫는 함수
    function closeModal() {
        modal.style.display = "none";
        document.body.style.overflow = "auto"; // 배경 스크롤 다시 허용
    }

    // ESC 키를 누르면 모달 닫기 (사용자 편의성)
    document.addEventListener('keydown', function(event) {
        if (event.key === "Escape") {
            closeModal();
        }
    });
</script>
<jsp:include page="footer.jsp" />
</body>
</html>
