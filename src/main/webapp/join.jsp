<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPEhtml>
<html>
<head>
<title>로그인</title>
<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<form action="join_process.jsp" id="join-form" name="join-form" method="post">
		<div class="joinform">
			<h1>회원가입</h1>
			가입하고 다양한 혜택을 누리세요!
			<div class="textbox">
				<p>
					<input type="text" id="name" name="name" placeholder="이름">
				<div id="name-error" class="error-message"></div>

				<p>
					<input type="text" id="id" name="id" placeholder="아이디 입력(영문)">
				<div id="id-error" class="error-message"></div>

				<p>
					<input type="password" id="passwd" name="passwd" placeholder="비밀번호(8~12자의 영문, 숫자)">
				<div id="passwd-error" class="error-message"></div>

				<p>
					<input type="password" id="pass" placeholder="비밀번호 확인">
				<div id="pass-error" class="error-message"></div>
				
				<p>
                	<input type="email" id="email" name="email" placeholder="이메일">
            	<div id="email-error" class="error-message"></div>
			</div>
			<p>
				<input type="submit" value="가입하기" class="j_button">
		</div>
	</form>
	<script>
    window.addEventListener("DOMContentLoaded", function() {
      const form = document.getElementById("join-form");
      const name = document.getElementById("name");
      const id = document.getElementById("id");
      const passwd = document.getElementById("passwd");
      const pass = document.getElementById("pass");
      const nameError = document.getElementById("name-error");
      const idError = document.getElementById("id-error");
      const passwdError = document.getElementById("passwd-error");
      const passError = document.getElementById("pass-error");

      form.addEventListener("submit", function(e) {
        e.preventDefault();

        const nametrim = name.value.trim();
        const idtrim = id.value.trim();
		const passwdtrim = passwd.value.trim();
		const passtrim = pass.value.trim();
		
        let valid = true;
        
		if(nametrim === ""){
			nameError.textContent = "이름을 입력해주세요.";
			valid = false;
		}
		else if(!/^[가-힣]+$/.test(nametrim)){
			nameError.textContent = "이름은 한글만 입력가능합니다.";
			valid = false;
		}
		else if(nametrim.length < 2){
			nameError.textContent = "이름은 2자 이상 입력해주세요.";
			valid = false;
		}
		else {
				nameError.textContent = "";
	        }
		
		
		
        if (idtrim === "") {
          idError.textContent = "아이디를 입력해주세요.";
          valid = false;
        }
        
        else if(!/^[a-zA-Z]+$/.test(idtrim)){
        	idError.textContent = "아이디는 영문만 가능합니다.";
        	valid = false;
        }
        else if (idtrim.length > 11){
        	idError.textContent = "아이디는 10자를 넘을 수 없습니다.";
        	valid = false;
        }
        else {
        	
          idError.textContent = "";
        }

        if(passwdtrim === ""){
        	passwdError.textContent = "비밀번호를 입력해주세요.";
        	valid = false;
        }
        else if(!/(?=.*[a-zA-Z])(?=.*[0-9])^[a-zA-Z0-9]+$/.test(passwdtrim)){
        	passwdError.textContent = "비밀번호는 영문과 숫자를 포함해야 합니다.";
        }
        else if (passwdtrim.length < 8 || passwdtrim.length > 12){
        	passwdError.textContent = "비밀번호는 8자 이상 12자 이하여야 합니다.";
        	valid = false;
        }
        else {
        	
          passwdError.textContent = "";
        }
        
        
       if(passtrim === ""){
    	   passError.textContent = "비밀번호를 입력해주세요.";
    	   valid = false;
       }
       else if(passtrim != passwdtrim){
    	   passError.textContent = "비밀번호가 맞지 않습니다.";
    	   valid = false;
       }
       else{
    	   passError.textContent = "";
       }
        
        if (valid) {
          console.log("로그인 시도");
          form.submit();
        }
      });
    });
  </script>
	<jsp:include page="footer.jsp" />
</body>
</html>