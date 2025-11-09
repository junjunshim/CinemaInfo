<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List, dto.User, dto.Review"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
User userInfo = (User) request.getAttribute("userInfo");
List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");

int currentPage = (Integer) request.getAttribute("currentPage");
int totalPages = (Integer) request.getAttribute("totalPages");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="profile-box">
		<h4><%=userInfo.getNickName()%>님의 리뷰 목록</h4>
		<p>아이디 : <%=userInfo.getUserName()%> | 가입일 : <%=sdf.format(userInfo.getJoin_date())%></p>
		<hr>
		<br>
		<%
		if (userInfo != null) {
		%>
		<section class="review-history-card">
			<div class="my-review-list">
				<%
				if (reviewList != null && !reviewList.isEmpty()) {
					for (int i = 0; i < reviewList.size(); i++) {
						Review review = reviewList.get(i);
				%>
				<div class="review-item">
					<h3 class="review-movie-title">
						<a href="<%=request.getContextPath()%>/detail.do?id=<%=review.getMovie_id()%>"><%=review.getMovie_title()%></a>
					</h3>
					<p class="review-content"><%=review.getReview_comment()%></p>
					<div class="review-meta">
						<span class="review-rating">⭐ <%=review.getRating()%></span>
						<span class="review-date"><%=sdf.format(review.getReview_date())%></span>
					</div>
				</div>
				<%
				} // for문 종료
				} else {
				%>
				<%-- 리뷰가 하나도 없을 경우 --%>
				<div class="no-reviews">
					<p>아직 작성한 리뷰가 없습니다.</p>
				</div>
				<%
				}
				%>
			</div>
		</section>
		<div class="pagination">
                <%-- '이전' 버튼: 1페이지보다 클 때만 표시 --%>
                <% if (currentPage > 1) { %>
                    <a href="userReview.do?page=<%= currentPage - 1 %>">&laquo;</a>
                <% } %>

                <%-- 페이지 번호 링크: 1부터 totalPages까지 반복 --%>
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <% if (i == currentPage) { %>
                        <%-- 현재 페이지는 링크 없이 강조만 --%>
                        <a href="#" class="active"><%= i %></a> 
                    <% } else { %>
                        <%-- 다른 페이지는 링크 부여 --%>
                        <a href="userReview.do?page=<%= i %>"><%= i %></a>
                    <% } %>
                <% } %>

                <%-- '다음' 버튼: 마지막 페이지보다 작을 때만 표시 --%>
                <% if (currentPage < totalPages) { %>
                    <a href="userReview.do?page=<%= currentPage + 1 %>">&raquo;</a>
                <% } %>
            </div>
		<%
		} else {
		%>
		<div class="no-reviews">
			<p>사용자 정보를 불러오는 데 실패했습니다.</p>
		</div>
		<%
		}
		%>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>