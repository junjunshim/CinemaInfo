<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List, dto.User, dto.Review" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	User userInfo = (User)request.getAttribute("userInfo");
	List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="profile-box">
		<form name="form-1" method="post">
			<h4><%=userInfo.getNickName() %>님</h4>
			<p>아이디 : <%=userInfo.getUserName() %> | 가입일 : <%=sdf.format(userInfo.getJoin_date()) %></p>
			<hr>
			<br>
			<div>
				<div class="btnbox">
					<button type="button" onclick="" class="bt">작성한 리뷰</button>
				</div>
				<div class="btnbox">
					<button type="button" onclick="" class="bt">보고싶어요한 영화</button>
				</div>
				<div class="btnbox">
					<button type="button" class="bt"
						onclick="location.href = '<%=request.getContextPath() %>/profile.do'">프로필 수정</button>
				</div>
				<button type="button" class="btn" id="logout" onclick="location.href = 'logout.jsp'">로그아웃</button>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>