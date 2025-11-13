<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 사용자 페이지에서 사용될 자바 클래스 설정
	 java.util.List => 리뷰를 리스트 형태로 받아오기 위한 클래스
	 java.text.SimpleDateFormat => 사용자의 가입일을 출력하기 위한 date포맷 클래스
	 dto.User => User의 객체를 담기 위한 클래스
-->
<%@ page import="java.util.List, dto.User" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	// 사용자 정보를 담고 있는 User객체 가져오기
	User userInfo = (User)request.getAttribute("userInfo");
	// 사용자 가입일 출력을 위한 date 포맷 형식 생성
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
		<h4><%=userInfo.getNickName() %>님</h4>
		<!-- 
			sdf.format(userInfo.getJoin_date()) => 지정한 date형식(sdf)의 포맷으로 사용자 가입일 출력 
		-->
		<p>아이디 : <%=userInfo.getUserName() %> | 가입일 : <%=sdf.format(userInfo.getJoin_date()) %></p>
		<hr>
		<br>
		<!-- 사용자 페이지 기능들 표시 및 이동 :
			 button을 통해서 해당 페이지로 이동 => onclick 사용
			 이동 경로 => request.getContextPath() + /userReview.do, /userMovie.do 등, 해당 페이지용 서블릿 링크 
		-->
		<form name="form-1" method="post">
			<div>
				<!-- 사용자 리뷰 확인 기능 -->
				<div class="btnbox">
					<button type="button" class="bt"
						onclick="location.href = '<%= request.getContextPath() %>/userReview.do'">작성한 리뷰</button>
				</div>
				<!-- 사용자가 좋아요 표시한 영화 확인 기능 -->
				<div class="btnbox">
				<button type="button" class="bt"
						onclick="location.href = '<%= request.getContextPath() %>/userMovie.do'">보고싶어요한 영화</button>
				</div>
				<!-- 사용자 정보 변경 기능 -->
				<div class="btnbox">
					<button type="button" class="bt"
						onclick="location.href = '<%=request.getContextPath() %>/profile.do'">프로필 수정</button>
				</div>
				<!-- 로그아웃 기능 -->
				<button type="button" class="btn" id="logout" onclick="location.href = 'logout.jsp'">로그아웃</button>
			</div>
		</form>
	</div>
	<!-- include 액션 태그로 footer.jsp 포함 -->
	<jsp:include page="footer.jsp" />
</body>
</html>