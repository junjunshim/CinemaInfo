<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPEhtml>
<html>
<meta charset="UTF-8">
<head>
<title>로그인</title>
<style>
  a{color : grey;}
  .login-form{
	text-align :center;
	width : 500px;
	margin : 100px auto;
	height : 600px;
	padding : 30px;
	margin-top : 30px;
	/*border : 0.2px solid rgba(0, 0, 0, 0.2);*/
	border-radius : 20px;
	font-size : 16px;
	display: flex;
    flex-direction: column;
    align-items: center;
    background-color : white;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
  }
  body{
  	background-color : rgba(188, 188, 188, 0.1);
  }
  input{
  	height : 55px;
  	width : 400px;
  	margin : 2px;
  	font-size : 17px;
  	border : 0.1px solid rgba(0, 0, 0, 0.4);
  	border-radius : 5px;
  	color : grey;
  	background-color :rgba(128, 128, 128, 0.1) ;
  }
  .m_button{
  	background-color : black;
  	color : white;
  	
  }
  .login_button{
  	padding : 2px;
	margin-bottom : 0.2px;  
  }
  .textbox{
  	  padding : 10px;
  	  
	  margin-bottom : 4px; 
  }
  .error-message{
		color : red;
		text-align : left;
		font-size : 0.8em;
		height: 18px; 
    	line-height: 1.2;
	}
	.box{
		margin-top : 10px;
	}
</style>
</head>

<body>
<div class = "container py-4">
	<div class = "box">
	<form action = "index.jsp" id = "myform" name = "loform" method = "post">
		<div class = "login-form">
			<h1 style = "font-size : 35px">로 그 인</h1>
			<div class = "textbox">			
				<p><input id = "userinput" placeholder = "아이디" class = "login_button">
				 <div id="id-error" class="error-message"></div>
				<p><input id = "passwd" type = "password" placeholder = "비밀번호" class = "login_button">
				 <div id="passwd-error" class="error-message"></div>
				
			</div>
			<p><input type = "submit" value = "로그인"class = "m_button"> <br>
			
			<p>계정이 없으신가요? &nbsp; <a href = "join.jsp">가입하러 가기</a><br>
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
</body>
</html>