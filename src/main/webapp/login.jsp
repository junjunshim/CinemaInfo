<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPEhtml>
<html>
<meta charset="UTF-8">
<head>
<title>로그인</title>
<!-- css 링크 -->
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<!-- include 액션 태그로 header.jsp 포함 -->
	<jsp:include page="header.jsp" />
	<div class="container py-4">
		<div class="box">
		<!-- 로그인에 사용될 폼 데이터 입력 부분 :
			 폼 데이터 처리 부분 : login_process.jsp
			 폼 데이터 전송 방식 : post
		-->
			<form action="login_process.jsp" id="myform" name="loform" method="post">
				<div class="login-form">
					<h1 style="font-size: 35px">로 그 인</h1>
					<div class="textbox">
						<p>
							<!-- 사용자 아이디 입력 부분 -->
							<input id="userinput" name="username" placeholder="아이디" class="login_button">
							<!-- 유효성 검사 처리 후, 오류 메세지 표시 부분 -->
							<div id="id-error" class="error-message"></div>
						<p>
							<!-- 사용자 비밀번호 입력 부분 -->
							<input id="passwd" name="passwd" type="password" placeholder="비밀번호" class="login_button">
							<!-- 유효성 검사 처리 후, 오류 메세지 표시 부분 -->
							<div id="passwd-error" class="error-message"></div>
					</div>
					<p>
						<!-- 폼 데이터 전송 버튼 -->
						<input type="submit" value="로그인" class="m_button">
						<br>
					<p>
						<!-- 회원 가입 페이지 이동 -->
						계정이 없으신가요? &nbsp; <a href="join.jsp">가입하러 가기</a>
						<br>
				</div>
			</form>
		</div>
		<script>
			window.addEventListener("DOMContentLoaded", function() {
				const form = document.getElementById("myform");
				const userinput = document.getElementById("userinput");
				const passwd = document.getElementById("passwd");
				const idError = document.getElementById("id-error");
				const passwdError = document.getElementById("passwd-error");

				form.addEventListener("submit", function(e) {
					e.preventDefault();

					let valid = true;

					if (userinput.value.trim() === "") {
						idError.textContent = "아이디를 입력해주세요.";
						valid = false;
					} else {
						idError.textContent = "";
					}

					if (passwd.value.trim() === "") {
						passwdError.textContent = "비밀번호를 입력해주세요.";
						valid = false;
					} else {
						passwdError.textContent = "";
					}

					if (valid) {
						console.log("로그인 시도");
						myform.submit();
					}
				});
			});
		</script>
	</div>
	<!-- include 액션 태그로 footer.jsp 포함 -->
	<jsp:include page="footer.jsp" />
</body>
</html>