<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 사용자 리뷰 페이지에 사용될 자바 클래스 설정
	 java.util.List => 사용자 리뷰들을 리스트 형태로 관리하기 위한 List 클래스
	 dto.User => 사용자 정보를 담는 클래스
	 dto.Review => 사용자 리뷰를 담기 위한 클래스
	 java.text.SimpleDateFormat => 사용자 가입일 및 리뷰 작성일을 출력하기 위한 date포맷 클래스
 -->
<%@ page import="java.util.List, dto.User, dto.Review"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!-- user_review.jsp의 로직
	 GET방식으로 page 번호 지정, ex> /userReview.do?page=2
	 page 별로 5개의 리뷰 (리뷰는 최신순 으로 검색)
	 하단 버튼으로 page이동 가능
 -->
<%
	// 사용자 정보를 담고 있는 User객체 가져오기
	User userInfo = (User) request.getAttribute("userInfo");
	// 사용자 리뷰들이 담긴 List 가져오기(한 페이지에 5개)
	List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
	
	// 현재 페이지 값
	int currentPage = (Integer) request.getAttribute("currentPage");
	// 전체 페이지 값
	// ex) 리뷰가 72개 => 72 / 5 == 14
	int totalPages = (Integer) request.getAttribute("totalPages");
	
	// 사용자 가입일 출력을 위한 date 포맷 형식 생성
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
<!-- css 링크 -->
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<!-- include 액션 태그로 header.jsp 포함 -->
	<jsp:include page="header.jsp" />
	<div class="profile-box">
		<!-- 사용자 정보 출력 부분 (이름, 아이디, 가입일) 
		 	 사용자 정보 객체 => userInfo
		 	 사용자 이름 => userInfo.getNickName()
		 	 사용자 가입일 (date포맷 형식) => sdg.format(userInfo.getJoin_date()) 
		-->
		<h4><%=userInfo.getNickName()%>님의 리뷰 목록</h4>
		<!-- 
			sdf.format(userInfo.getJoin_date()) => 지정한 date형식(sdf)의 포맷으로 사용자 가입일 출력 
		-->
		<p>아이디 : <%=userInfo.getUserName()%> | 가입일 : <%=sdf.format(userInfo.getJoin_date())%></p>
		<hr>
		<section class="review-history-card">
		<!-- 사용자 리뷰 표시 영역(5개) -->
			<div class="my-review-list">
				<%
				// 사용자 리뷰가 없는 지 확인
				if (reviewList != null && !reviewList.isEmpty()) {
					for (int i = 0; i < reviewList.size(); i++) {
						// 리뷰 리스트에서 한개의 리뷰 가져오기
						Review review = reviewList.get(i);
				%>
				<!-- 사용자 리뷰 출력
					 영화 제목 => a태그로 해당 영화 상세 페이지로 이동, 
					 request.getContextPath() + /detail.do?id= + review.getMovie_id() => 영화 상세페이지 서블릿 링크 와 해당 영화 id값
					 리뷰 내용 => review.getReview_comment()
					 리뷰 평점 => review.getRating()
					 리뷰 작성일 => sdf.format(review.getReview_date())
				 -->
				<div class="review-item">
					<h3 class="review-movie-title">
						<a href="<%=request.getContextPath()%>/detail.do?id=<%=review.getMovie_id()%>"><%=review.getMovie_title()%></a>
					</h3>
					<p class="review-content"><%=review.getReview_comment()%></p>
					<div class="review-meta">
						<span>평점 </span><span class="review-rating">★</span><span><%=review.getRating()%> | </span>
						<span class="review-date">리뷰 작성일 : <%=sdf.format(review.getReview_date())%></span>
					</div>
				</div>
				<hr>
				<%
					} 
				} else {
				%>
				<!-- 리뷰 리스트가 비어 있으면 작성 리뷰 없음 표시 -->
				<div class="no-reviews">
					<p>아직 작성한 리뷰가 없습니다.</p>
				</div>
				<%
				}
				%>
			</div>
		</section>
		<br>
		<!-- 페이지네이션 부분 로직
		     1. 이전 페이지 이동이 가능할 경우 이전 버튼 활성화
			 2. 페이지 이동 버튼을 최대 5개 => 현재 페이지 - 2 부터 현재 페이지 + 2까지 표시 AND 현재 페이지가 중앙에 배치되게 표시
		 	 3. 다음 페이지 이동이 가능할 경우 다음 버튼 활성화
		 -->
		<div class="pagination">
        <% 
        // 현재 페이지가 1인지 확인하여, 이전 페이지 이동 버튼 활성화
        if (currentPage > 1) { 
        %>
        	<a href="userReview.do?page=<%= currentPage - 1 %>">&laquo;</a>
        <% 
        } 
        %>
        <%
        // 5개의 페이지 버튼 중 처음 버튼의 값 지정
       	int start_page;
        // 현재 페이지가 중앙에 배치될 수 있도록 시작 버튼의 값 지정
       	if ((currentPage - 2) <= 0){
           	start_page = 1;
       	} else if((currentPage + 2) <= totalPages){
       		start_page = currentPage - 2;
       	} else{
       		start_page = totalPages - 4;
       	}
        // 전체 페이지 개수가 5개 미만 일때는 해당 페이지 만큼 출력
        int maxRange = 5;
        if(totalPages < 5){
        	maxRange = totalPages;
        }
        // 버튼 출력 부분
        for (int i = start_page; i < (start_page + maxRange); i++) {	
            // 현재 페이지 버튼에 스타일 지정을 위해 확인
        	if (i == currentPage) 
            { 
        %>
        		<a href="#" class="active"><%= i %></a> 
        	<%
         	} 
            else 
            { 
            %>
            	<a href="userReview.do?page=<%= i %>"><%= i %></a>
            <%
           	} 
            %>
		<%
 		} 
 		%>
		<%
		// 현재 페이지가 마지막 페이지 아닌지 확인하여 다음페이지 이동 버튼 활성화
		if (currentPage < totalPages) 
		{ 
		%>
        	<a href="userReview.do?page=<%= currentPage + 1 %>">&raquo;</a>
        <% 
        } 
        %>
   		</div>
	</div>
	<!-- include 액션 태그로 footer.jsp 포함 -->
	<jsp:include page="footer.jsp" />
</body>
</html>