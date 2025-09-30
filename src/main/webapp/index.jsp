<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <div class="movie-card">
                <img src="https://via.placeholder.com/200x300" alt="영화 포스터">
                <h2>예시 영화 1</h2>	
                <p>간단한 설명입니다.</p>
                <a href="detail.jsp">자세히 보기</a>
            </div>
            <div class="movie-card">
                <img src="https://via.placeholder.com/200x300" alt="영화 포스터">
                <h2>예시 영화 2</h2>
                <p>간단한 설명입니다.</p>
                <a href="detail.jsp">자세히 보기</a>
            </div>
            <div class="movie-card">
                <img src="https://via.placeholder.com/200x300" alt="영화 포스터">
                <h2>예시 영화 3</h2>
                <p>간단한 설명입니다.</p>
                <a href="detail.jsp">자세히 보기</a>
            </div>
        </div>
        
        <!-- top-movie : 화제의 영화 소개(영화 이미지, 리뷰)  -->
       <div class="top-movie">
    	<!-- 영화 기본 정보 -->
    		<div class="top-movie-content">
        		<div class="top-movie-img">
            		<img src="https://via.placeholder.com/175x250" alt="영화 포스터">
        		</div>
        		<div class="top-movie-title">
            		<h2>예시 영화 제목</h2>
        		</div>
    		</div>
		<!-- 리뷰 영역 -->
    		<div class="top-movie-review">
        		<div class="top-review-title">
           			<h3>‘예시 영화 제목’의 리뷰들</h3>
        		</div>
        		<div class="top-review-content">
            		<div class="review-item">
                		<div class="top-review-score">⭐ 4.5</div>
               			<div class="top-review-text">정말 재미있고 몰입감 있는 영화였어요!</div>
            		</div>
            		<div class="review-item">
                		<div class="top-review-score">⭐ 4.5</div>
                		<div class="top-review-text">정말 재미있고 몰입감 있는 영화였어요!</div>
            		</div>
            		<div class="review-item">
                		<div class="top-review-score">⭐ 4.5</div>
                		<div class="top-review-text">정말 재미있고 몰입감 있는 영화였어요!</div>
            		</div>
            		<div class="review-item">
                		<div class="top-review-score">⭐ 4.5</div>
                		<div class="top-review-text">정말 재미있고 몰입감 있는 영화였어요!</div>
            		</div>
    			</div>
    		</div>
		</div>

        
        <!-- category-movie : 카테로리 별 영화 세부사이트 란 : 카테고리 별로 여러개 생성 -->
        <!-- 액션 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">액션 영화</div>
		        <a href="categoryAction.jsp" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="액션 영화 1"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="액션 영화 2"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="액션 영화 3"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="액션 영화 4"></div>
		    </div>
		</div>
		
		<!-- 드라마 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">드라마 영화</div>
		        <a href="categoryDrama.jsp" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="드라마 영화 1"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="드라마 영화 2"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="드라마 영화 3"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="드라마 영화 4"></div>
		    </div>
		</div>
		
		<!-- 코미디 영화 -->
		<div class="category-movie">
		    <div class="category-upper">
		        <div class="category-title">코미디 영화</div>
		        <a href="categoryComedy.jsp" class="categorypage-link">더보기 &raquo;</a>
		    </div>
		    <div class="category-img-container">
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="코미디 영화 1"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="코미디 영화 2"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="코미디 영화 3"></div>
		        <div class="category-movie-img"><img src="https://via.placeholder.com/250x175" alt="코미디 영화 4"></div>
		    </div>
		</div>
    </main>

    <!-- footer include -->
    <jsp:include page="footer.jsp" />
</body>
</html>
