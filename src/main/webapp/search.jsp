<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- search.jsp에서 사용될 자바 클래스 설정
	 java.util.List => 검색결과들을 리스트 형태로 관리하기 위한 List 클래스
	 dto.Movie => 영화의 정보를 담는 클래스
	 java.text.SimpleDateFormat => 영화 개봉일을 출력하기 위한 date포맷 클래스
 -->
<%@ page import="java.util.List, dto.Movie"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	// 검색창으로 입력된 키워드 가져오기
	String keyword = (String)request.getAttribute("keyword");
	// 검색결과를 Movie객체로 리스트로 가져오기
	List<Movie> searchList = (List<Movie>)request.getAttribute("searchList");
	// 영화의 개봉일을 출력하가 위한 date 포맷 형식 생성
	SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Search</title>
	<!-- css 링크 -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<!-- include 액션 태그로 header.jsp 포함 -->
    <jsp:include page="header.jsp" />
    <!-- 검색 결과 창 부분 -->
   	<main class="search-container">
   		<!-- 검색 헤더 
   			 1 => 사용자가 어떤 키워드를 입력했는지 출력
   			 2 => 키워드 검색 결과 수 출력 
   		-->
        <div class="search-header">
        	<h1>
        		'<%=keyword %>' 에 대한 검색 결과
        	</h1>
            <h2>
                영화 검색 결과 <span class="search-result-count">(<%= (searchList != null) ? searchList.size() : 0 %>)</span>
            </h2>
        </div>
        <!-- 검색 결과 출력 부분 -->
        <% if (searchList != null && !searchList.isEmpty()) { %>
            <ul class="search-list">
            	<!-- 검색 결과가 저장된 List의 크기 만큼 반복 -->
                <% for (int i = 0; i < searchList.size(); i++) { 
                	// 리스트에서 하나의 Movie 객체 가져오기
                	Movie movie = searchList.get(i); 
                	// 상세 페이지 링크
                    String detailUrl = "detail.do?id=" + movie.getMovie_id();
                %>
                <li class="search-item">
                	<!-- 영화 포스터 부분
                		 request.getContextPath() => 프로젝트의 path(경로), ex) /CinemaInfo
                		 movie.getImg_path(), getMovie_title() 등등, => Movie 클래스의 getter ex) 가져온 영화의 이미지 경로, 제목, 상세 정보등 가져온다
                	-->
                    <div class="item-poster">
                        <a href="<%= detailUrl %>">
                            <img src="<%=request.getContextPath()%><%=movie.getImg_path()%>main.png" 
                                 alt="<%=movie.getMovie_title()%>"
                                 onerror="this.src='<%=request.getContextPath()%>/images/no-image.png'">
                                 <!-- onerror 속성 => 이미지 에러 발생 시, 
                                 	  this.src(현재 태그의 src 속성)의 값을 
                                 	  no-image.png로 변경
                                 -->
                        </a>
                    </div>
					<!-- 영화 정보 부분 
						 detailUrl => 영화 상세 페이지 주소
						 movie.getMovie_title() => 영화 제목
						 movie.getRelease_date() => 영화 개봉일
					-->
                    <div class="item-info">
                        <a href="<%= detailUrl %>" class="info-title">
                            <%= movie.getMovie_title() %>
                            <span class="info-year">
                            	<!-- yearFormat.format(movie.getRelease_date()) => 영화 개봉일을 date포맷 형식으로 출력 -->
                                <%= (movie.getRelease_date() != null) ? yearFormat.format(movie.getRelease_date()) : "" %>
                            </span>
                        </a>
                        <div class="info-meta">
                        	<!-- 
                        		movie.getCategory().replace("|", ", ") => 영화 카테고리 문자열에서 '|' -> ',' 으로 변경
                        		movie.getCountry() => 제작 국가
								movie.getDuration() => 상영 시간
                        	-->
                            <%= movie.getCategory().replace("|", ", ") %>
                            <span class="separator">|</span>
                            <%= movie.getCountry() %>
                            <span class="separator">|</span>
                            <%= movie.getDuration() %>분
                        </div>
						<!-- 
							movie.getDirector() => 영화 감독
							movie.getMain_actor().replace("|", ", ") => 영화 출연 배우들, '|' -> ',' 변경
						-->
                        <div class="info-people">
                            <span class="label">감독</span> <%= movie.getDirector() %>
                            <span class="separator">|</span>
                            <span class="label">출연</span> <%= movie.getMain_actor().replace("|", ", ") %>
                        </div>
						<!-- String.format("%.1f", movie.getAvg_rating()) => 영화 평점을 소수점 1자리만 출력 -->
                        <div class="info-rating">
                            평점 <span class="star-score">★ <%= String.format("%.1f", movie.getAvg_rating()) %></span>
                        </div>
                    </div>
                </li>
                <% } %>
            </ul>
            <!-- 검색 결과 리스트가 비어있을 경우 -->
        	<% } else { %>
            <div class="no-result">
                <p>'<%=keyword %>'에 대한 검색 결과가 없습니다.</p>
            </div>
        	<% } %>
    </main>
    <!-- include 액션 태그로 footer.jsp 포함 -->
    <jsp:include page="footer.jsp" />
</body>
</html>