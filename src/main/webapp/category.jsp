<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- category.jsp에서 사용될 자바 클래스 설정
	 java.util.List => 영화들을 리스트 형태로 관리하기 위한 List 클래스
	 dto.Movie => 영화의 정보를 담는 클래스
	 java.text.SimpleDateFormat => 영화 개봉일을 출력하기 위한 date포맷 클래스
 -->
<%@ page import="java.util.List, dto.Movie" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	// 카테고리 영화들 가져오기
	List<Movie> movieList = (List<Movie>) request.getAttribute("movieList");
	// 카테고리 명
	String category = (String) request.getAttribute("selectedCategory");
	// 영화의 개봉일을 출력하가 위한 date 포맷 형식 생성
	SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>카테고리</title>
	<!-- css 링크 -->
	<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<!-- include 액션 태그로 header.jsp 포함 -->
	<jsp:include page="header.jsp" />
    <main class="category-container">
		<!-- 카테고리 명 및 개수 출력 -->
        <div class="category-header">
            <h1>
                # <%= category %> 
                <!-- 카테고리 명과 리스트 사이즈로 개수 구해서 출력 -->
                <span class="count-badge"><%= (movieList != null) ? movieList.size() : 0 %>편</span>
            </h1>
        </div>
		<!-- 카테고리에 맞는 영화가 있을 때만 출력 -->
        <% if (movieList != null && !movieList.isEmpty()) { %>
        	<!-- 카테고리 영화 출력 부분 
        		 detail.do?id=%=movie.getMovie_id()% => 상세 페이지로 링크
        		 request.getContextPath() movie.getImg_path() main.png => 영화 메인 포스터 경로
        	-->
            <div class="movie-grid">
                <% for (Movie movie : movieList) { %>
                    <a href="detail.do?id=<%=movie.getMovie_id()%>" class="movie-card">
                        <img src="<%= request.getContextPath() %><%= movie.getImg_path() %>main.png" 
                             alt="<%= movie.getMovie_title() %>"
                             onerror="this.src='<%= request.getContextPath() %>/images/no-image.png'">
                        
                        <div class="movie-title"><%= movie.getMovie_title() %></div>
                        
                        <div class="movie-meta">
                        	<!--
                        		 yearFormat.format(movie.getRelease_date()) => 개봉일에서 년도만 출력
                        	 -->
                            <span><%= yearFormat.format(movie.getRelease_date()) %></span>
                            <span class="star-score">★ <%= String.format("%.1f", movie.getAvg_rating()) %></span>
                        </div>
                    </a>
                <% } %>
            </div>
        <!-- 등록된 카테고리가 아닐 경우 -->
        <% } else { %>
            <div class="no-data">
                <p>해당 카테고리의 영화가 아직 등록되지 않았습니다.</p>
            </div>
        <% } %>
    </main>
    <!-- include 액션 태그로 footer.jsp 포함 -->
    <jsp:include page="footer.jsp" />
</body>
</html>