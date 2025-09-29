<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<meta charset="UTF-8">
<html>
<head>
    <title>마이페이지</title>
    <style>
        body {
            background-color: #f5f5f5;
   
            text-align: center;
        }
        
       .profile-box
        {
            width: 500px;
            height : 700px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .user{
       margin-right : 300px;  
		border-radius : 300px;
		width : 110px;
		height : 110px;
		float:none;
		margin-top : 10px;
		margin-bottom : 20px;
		
		
	}

	
     .btn{
    		width : 180px;
     		padding: 10px 20px;
           margin-top:10px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
     }   
     .bt{
   		width : 450px;
   		height : 55px;
   		background-color: white;
   		border : solid 0.1px rgba(0, 0, 0, 0.1);
   		border-radius : 5px;
   		margin : 3px; 
   		 align-items: left;
   }
   .error-message{
  	color : red;
  	text-align: left;
	font-size : 12px;
	margin-left : 25px; 
	 height: 18px; 
    line-height: 1.2;
  }
  .checkbox{
  	margin-top: 50px;
  }
  .checkbutton{
  	color : white;
  	background-color: black;
  	border-radius : 5px;
  	width : 450px; 
  	height : 55px;
  	font-size: 12px;
  }
    </style>
</head>
<body>
    <div class="profile-box">
        
 
		<form action ="user.jsp" name = "profileform" id="profileform" method = "post">
			<img src = "user.png" alt = "userimage" class= "user">
			
			
			
				<div class = "btnbox">
				<h5 style = " margin-right:370px; margin-left:5px; ">-</h5>
				
				<h5 style = " margin-right:400px; margin-bottom:5px; ">이름 변경</h5>
				<input type = "text" class = "bt" id = "name">
				<div id = "name-error" class = "error-message"></div>
				<h5 style = " margin-right:370px; margin-bottom:5px; ">비밀번호 변경</h5>
				<input type = "password" class = "bt" placeholder = "이전 비밀번호">
				<div class= "error-message"></div>
					<input type = "password" id = "passwd" class = "bt" placeholder = "변경할 비밀번호">
					<div id="passwd-error" class="error-message"></div>
					<input type = "password" id="pass" class = "bt" placeholder = "비밀번호 확인">
					<div id="pass-error" class="error-message"></div>
					<div class = "checkbox">
						<input type = "submit" value = "확인" class = "checkbutton">
					</div>
					
			  </div>
			  
       </form>
 
    </div>
<script>
    window.addEventListener("DOMContentLoaded", function() {
      const form = document.getElementById("profileform");
      const name = document.getElementById("name");
      const passwd = document.getElementById("passwd");
      const pass = document.getElementById("pass");
      const nameError = document.getElementById("name-error");
      const passwdError = document.getElementById("passwd-error");
      const passError = document.getElementById("pass-error");
      form.addEventListener("submit", function(e) {
        e.preventDefault();

        const nametrim = name.value.trim();
		const passwdtrim = passwd.value.trim();
		const passtrim = pass.value.trim();
		
        let valid = true;
       
        if(nametrim !== "")
        {
        	if(!/^[가-힣]+$/.test(nametrim)){
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
        }
		
       if(passwdtrim !== "")
    	{
    	   if(!/(?=.*[a-zA-Z])(?=.*[0-9])^[a-zA-Z0-9]+$/.test(passwdtrim)){
           	passwdError.textContent = "비밀번호는 영문과 숫자를 포함해야 합니다.";
           }
           else if (passwdtrim.length < 8 || passwdtrim.length > 12){
           	passwdError.textContent = "비밀번호는 8자 이상 12자 이하여야 합니다.";
           	valid = false;
           }
           else {
           	
             passwdError.textContent = "";
           }
    	}
       
        
		if(passtrim != passwdtrim){
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
</body>
</html>