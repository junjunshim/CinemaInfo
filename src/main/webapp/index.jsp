<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- index.jsp에서 사용될 자바 클래스 설정
	 java.util.List => 영화들을 리스트 형태로 관리하기 위한 List 클래스
	 dto.Movie => 영화의 정보를 담는 클래스
	 dto.Review => 리뷰의 정보를 담는 클래스
-->
<%@ page import="java.util.List, dto.Movie, dto.Review" %>

<%
	// 전체 영화 리스트 가져오기
	List<Movie> movieList = (List<Movie>)request.getAttribute("movieList");
	
	// 화제의 영화 가져오기
	Movie topMovie = (Movie)request.getAttribute("topMovie");
	// 화제의 영화의 리부 가녀오기(전체) 
	List<Review> reviewList = (List<Review>)request.getAttribute("reviewList");
	
	// 카테고리 별 영화 리스트 가져오기 (액션, 드라마, 코미디, 미스테리, 애니메이션)
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
    <!-- css 링크 -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
    <!-- include 액션 태그로 header.jsp 포함 -->
    <jsp:include page="header.jsp" />
    <main>
    <!-- movie-grid : 랜덤 3개 영화 추천 -->
        <div class="movie-grid">
        <%
        	// 리스트에 내용이 있을 때만, 표시
	    	if(movieList != null && !movieList.isEmpty()){
	    		for(int i = 0; i < 3; i++){
	    			// 리스트에서 영화 하나 가져오기
	    			Movie movie = movieList.get(i);
   		%>
            <div class="movie-card">
            	<!-- 영화 표시 부분 :
            		request.getContextPath() => 프로젝트의 path(경로), ex) /CinemaInfo
            		movie.getImg_path(), getMovie_title() 등등, => Movie 클래스의 getter ex) 가져온 영화의 이미지 경로, 제목, 상세 정보등 가져온다
            	 -->
                <img src="<%=request.getContextPath() %><%=movie.getImg_path() %>main.png" alt="<%=movie.getMovie_title() %> 포스터">
                <h2><%=movie.getMovie_title() %></h2>	
                <p><%=movie.getDescription() %></p>
                <!-- 해당 영화의 상세 페이지로 이동 :
                	detail.do => 상세 페이지 이동을 위한 서블릿 이동 경로
                	?id=movie.getMovie_id => 어떤 영화의 상세 페이지인지 식별용(Get방식)
                -->
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
       		// 화제 영화을 받아 왔을 때만 표시
    		if(topMovie != null){
       %>
    	<!-- 영화 기본 정보 -->
    		<div class="top-movie-content">
        		<div>
        			<!-- request.getContextPath()로 프로젝트 경로 가저오기
        				 src: topMovie.getImg_path + /main.png => 메인 포스터 전체 경로
        				 alt: topMove.getMovie_title + 포스터 => 이미지 설명(영화 제목)
        			-->
            		<img class="top-movie-img" src="<%=request.getContextPath() %><%=topMovie.getImg_path() %>main.png" alt="<%=topMovie.getMovie_title() %> 포스터">
        		</div>
        		<div class="top-movie-title">
        			<!-- 영화 제목 표시
        				topMovie.getMovie_title() => 영화 제목 가져오기
        			 -->
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
        			// 영화의 리뷰 리스트가 있을 때만, 표시
        			if(reviewList != null && !reviewList.isEmpty()){
        				for(int i = 0; i < 5; i++){
        					// 리스트에서 하나의 리뷰 가져오기
        					Review review = reviewList.get(i);
        		%>
            		<div class="review-item">
            			<!-- 영화 리뷰 표시
            				review.getRating() => 리뷰의 평점
            				review.getReview_comment() => 리뷰 내용
            			 -->
                		<div class="top-review-score">⭐ <%=review.getRating() %></div>
               			<div class="top-review-text"><%=review.getReview_comment() %></div>
            		</div>
           		<%
        				}
        			}
        			// 리뷰가 없을때, 나오는 부분
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
       			// 화제 영화를 가져오지 못했을 때, 나오는 부분
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
		    	// 카테고리 영화가 있을 때만, 표시
		    	if(actionMovies != null && !actionMovies.isEmpty()){
		    		// 카테고리 별로 영화를 5개 표시
		    		for(int i = 0; i < 5; i++){
		    			// 카테고리 영화 리스트에서 영화 하나 가져오기
		    			Movie actionMovie = actionMovies.get(i);
		    %>	
		    	<!-- 포스터 표시 및 포스터 클릭 시, 상세 페이지로 이동 -->
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

    <!-- include 액션 태그로 footer.jsp 포함 -->
    <jsp:include page="footer.jsp" />
</body>
</html>
