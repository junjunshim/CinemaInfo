<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPEhtml>
<html>
<meta charset="UTF-8">
<head>
<title>로그인</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="container py-4">
		<div class="box">
			<form action="index.jsp" id="myform" name="loform" method="post">
				<div class="login-form">
					<h1 style="font-size: 35px">로 그 인</h1>
					<div class="textbox">
						<p>
							<input id="userinput" placeholder="아이디" class="login_button">
						<div id="id-error" class="error-message"></div>
						<p>
							<input id="passwd" type="password" placeholder="비밀번호"
								class="login_button">
						<div id="passwd-error" class="error-message"></div>

					</div>
					<p>
						<input type="submit" value="로그인" class="m_button"> <br>
					<p>
						계정이 없으신가요? &nbsp; <a href="join.jsp">가입하러 가기</a><br>
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
	<jsp:include page="footer.jsp" />
</body>
</html>