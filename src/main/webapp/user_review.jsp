<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List, dto.User, dto.Review"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
User userInfo = (User) request.getAttribute("userInfo");
List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");

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