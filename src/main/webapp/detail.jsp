<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dto.Movie, dto.Review" %>

<%
	Movie movie = (Movie)request.getAttribute("movie");
	List<Review> reviewList = (List<Review>)request.getAttribute("reviewList");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 리뷰 상세</title>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/detail.css">
  <link rel="stylesheet" href="css/footer.css">
</head>
<body>
  <%@ include file="header.jsp" %>
	<!-- ======= 화면 ======= -->

	<%
		if (movie == null) {
	%>
	<div class="note note-warn container">
    	현재 선택된 영화 데이터가 없습니다. 메인에서 영화를 선택해 주세요.
 	</div>
	<%
		}
	%>

	<section class="hero">
  		<div class="container">
    		<div class="hero-inner">
      			<div>
        			<h1 class="movie-title <%=!movie.getMovie_title().isEmpty() ? "" : "placeholder" %>">
          				<%=!movie.getMovie_title().isEmpty() ? movie.getMovie_title() : "제목 정보 없음" %>
        			</h1>
       				<dl class="meta">
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
      			<img class="poster" src="<%=request.getContextPath() %><%=movie.getImg_path() %>" alt="<%=movie.getMovie_title() %> 포스터">
    		</div>
  		</div>
	</section>
	<div class="container section">
  		<h3>줄거리</h3>
  		<p class="synopsis"><%=!movie.getDescription().isEmpty() ?  movie.getDescription() : "줄거리 준비중입니다." %></p>
	</div>
	<!-- 사진 영상 부분 -->
	<div class="container section" id="reviews">
  		<h3>리뷰 작성</h3>
		<form action="" method="post" class="review-form">
    		<input type="hidden" name="action" value="add">
    		<input type="hidden" name="id" value="<%=movie.getMovie_id() %>">
			<div class="star-picker">
      			<div class="bg">★★★★★</div>
      			<div class="fill" id="starFill">★★★★★</div>
    		</div>
    		<input id="ratingRange" class="rating-range" type="range" name="rating" min="0.5" max="10" step="0.5" value="3">
    		<span class="rating-text"><span id="ratingValue">3.0</span> / 10</span>
			<input type="text" name="nick" placeholder="닉네임(선택)" class="review-input">
    		<input type="text" name="content" maxlength="30" placeholder="짧은 리뷰 (30자 이내)" required class="review-input wide">
    		<button type="submit" class="btn-primary">등록</button>
  		</form>
  		<div class="review-summary">
	    	<strong>평균</strong> <span class="avg-star">★</span>
	    	<span class="avg-num"><%=movie.getAvg_rating() %></span>
	    	
 		</div>
		<ul class="review-list">
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

</body>
</html>
