<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
			<img src="" alt="userimage" class="user"> <label
				class="name-label">-</label>
			<hr>
			<br>
			<div>
				<div class="btnbox">
					<button class="bt">작성한 리뷰</button>
				</div>
				<div class="btnbox">
					<button type="button" onclick="" class="bt">리뷰쓰기</button>
				</div>
				<div class="btnbox">
					<button class="bt">보고싶어요한 영화</button>
				</div>
				<div class="btnbox">
					<button type="button" class="bt"
						onclick="location.href = 'profile.jsp'">프로필 수정</button>
				</div>
				<button type="submit" class="btn" id="logout" onclick="">로그아웃</button>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>