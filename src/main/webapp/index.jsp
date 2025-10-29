<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dto.Movie, dto.Review" %>

<%
	List<Movie> movieList = (List<Movie>)request.getAttribute("movieList");

	Movie topMovie = (Movie)request.getAttribute("topMovie");
	List<Review> reviewList = (List<Review>)request.getAttribute("reviewList");
	
	List<Movie> actionMovies = (List<Movie>)request.getAttribute("actionMovies");
    List<Movie> dramaMovies = (List<Movie>)request.getAttribute("dramaMovies");
    List<Movie> comedyMovies = (List<Movie>)request.getAttribute("comedyMovies");
    List<Movie> mysteryMovies = (List<Movie>)request.getAttribute("mysteryMovies");
    List<Movie> animationMovies = (List<Movie>)request.getAttribute("animationMovies");
    
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MovieIntro</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
    <!-- header include -->
    <jsp:include page="header.jsp" />

    <!-- main -->
    <main>
    <!-- movie-grid : 랜덤 3개 영화 추천 -->
        <div class="movie-grid">
        <%
	    	if(movieList != null && !movieList.isEmpty()){
	    		for(int i = 0; i < 3; i++){
	    			Movie movie = movieList.get(i);
   		%>
            <div class="movie-card">
                <img src="<%=request.getContextPath() %><%=movie.getImg_path() %>main.png" alt="<%=movie.getMovie_title() %> 포스터">
                <h2><%=movie.getMovie_title() %></h2>	
                <p><%=movie.getDescription() %></p>
                <a href="detail.do?id=<%=movie.getMovie_id()%>">자세히 보기</a>
            </div>
       	<%
    			}
    		}
   		%>
        </div>
   
        <!-- top-movie : 화제의 영화 소개(영화 이미지, 리뷰)  -->
       <div class="top-movie">
       <%
       		if(topMovie != null){
       %>
    	<!-- 영화 기본 정보 -->
    		<div class="top-movie-content">
        		<div>
            		<img class="top-movie-img" src="<%=request.getContextPath() %><%=topMovie.getImg_path() %>main.png" alt="<%=topMovie.getMovie_title() %> 포스터">
        		</div>
        		<div class="top-movie-title">
            		<h2><%=topMovie.getMovie_title() %></h2>
        		</div>
    		</div>
		<!-- 리뷰 영역 -->
    		<div class="top-movie-review">
        		<div class="top-review-title">
           			<h3>'<%=topMovie.getMovie_title() %>'의 리뷰들</h3>
        		</div>
        		<div class="top-review-content">
        		<%
        			if(reviewList != null && !reviewList.isEmpty()){
        				for(int i = 0; i < 4; i++){
        					Review review = reviewList.get(i);
        		%>
            		<div class="review-item">
                		<div class="top-review-score">⭐ <%=review.getRating() %></div>
               			<div class="top-review-text"><%=review.getReview_comment() %></div>
            		</div>
           		<%
        				}
        			}
        			else{
           		%>
           			<p>아직 등록된 리뷰가 없습니다.</p>
           		<%
        			}
           		%>
    			</div>
    		</div>
    		<%
	       		}
	       		else{
    		%>
    		<p>화제의 영화가 없습니다.</p>
    		<%
  				}
  			%>
		</div>

        
        <!-- category-movie : 카테로리 별 영화 세부사이트 란 : 카테고리 별로 여러개 생성 -->
        <!-- 액션 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">액션</div>
		        <a href="category.do?category=액션" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		    <%
		    	if(actionMovies != null && !actionMovies.isEmpty()){
		    		for(int i = 0; i < 5; i++){
		    			Movie actionMovie = actionMovies.get(i);
		    %>
		        <div class="category-movie-img"><a href="detail.do?id=<%=actionMovie.getMovie_id()%>"><img src="<%=request.getContextPath() %><%=actionMovie.getImg_path() %>main.png" alt="<%=actionMovie.getMovie_title() %> 포스터"></a></div>
		        <%
		        	}
		        %>
		    </div>
		    <%
		    	}
		    %>
		</div>
		
		<!-- 드라마 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">드라마</div>
		        <a href="category.do?category=드라마" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		    <%
		    	if(dramaMovies != null && !dramaMovies.isEmpty()){
		    		for(int i = 0; i < 5; i++){
		    			Movie dramaMovie = dramaMovies.get(i);
		    %>
		        <div class="category-movie-img"><a href="detail.do?id=<%=dramaMovie.getMovie_id()%>"><img src="<%=request.getContextPath() %><%=dramaMovie.getImg_path() %>main.png" alt="<%=dramaMovie.getMovie_title() %> 포스터"></a></div>
		        <%
		        	}
		        %>
		    </div>
		    <%
		    	}
		    %>
		</div>
		
		<!-- 코미디 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">코미디</div>
		        <a href="category.do?category=코미디" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		    <%
		    	if(comedyMovies != null && !comedyMovies.isEmpty()){
		    		for(int i = 0; i < 5; i++){
		    			Movie comedyMovie = comedyMovies.get(i);
		    %>
		        <div class="category-movie-img"><a href="detail.do?id=<%=comedyMovie.getMovie_id()%>"><img src="<%=request.getContextPath() %><%=comedyMovie.getImg_path() %>main.png" alt="<%=comedyMovie.getMovie_title() %> 포스터"></a></div>
		        <%
		        	}
		        %>
		    </div>
		    <%
		    	}
		    %>
		</div>
		
		<!-- 미스터리 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">미스터리</div>
		        <a href="category.do?category=미스터리" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		    <%
		    	if(mysteryMovies != null && !mysteryMovies.isEmpty()){
		    		for(int i = 0; i < 5; i++){
		    			Movie mysteryMovie = mysteryMovies.get(i);
		    %>
		        <div class="category-movie-img"><a href="detail.do?id=<%=mysteryMovie.getMovie_id()%>"><img src="<%=request.getContextPath() %><%=mysteryMovie.getImg_path() %>main.png" alt="<%=mysteryMovie.getMovie_title() %> 포스터"></a></div>
		        <%
		        	}
		        %>
		    </div>
		    <%
		    	}
		    %>
		</div>
		
		<!-- 애니메이션 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">애니메이션</div>
		        <a href="category.do?category=애니메이션" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		    <%
		    	if(mysteryMovies != null && !mysteryMovies.isEmpty()){
		    		for(int i = 0; i < 5; i++){
		    			Movie animationMovie = animationMovies.get(i);
		    %>
		        <div class="category-movie-img"><a href="detail.do?id=<%=animationMovie.getMovie_id()%>"><img src="<%=request.getContextPath() %><%=animationMovie.getImg_path() %>main.png" alt="<%=animationMovie.getMovie_title() %> 포스터"></a></div>
		        <%
		        	}
		        %>
		    </div>
		    <%
		    	}
		    %>
		</div>
    </main>

    <!-- footer include -->
    <jsp:include page="footer.jsp" />
</body>
</html>
