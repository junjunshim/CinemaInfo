<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<meta charset="UTF-8">
<!-- 사용자 프로필 변경 페이지에 사용될 자바 클래스 설정 
	 dto.User => User의 객체를 담기 위한 클래스
	 java.text.SimpleDateFormat => 사용자의 가입일을 출력하기 위한 date포맷 클래스
-->
<%@ page import="dto.User" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	// 사용자의 정보를 담고 있는 User객체 가져오기
	User userInfo = (User)request.getAttribute("userInfo");
	// 사용자 가입일 출력을 위한 date 포맷 형식 생성
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<html>
<head>
<title>프로필 변경</title>
<!-- css 링크 -->
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/header.css">
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
		<p>아이디 : <%=userInfo.getUserName() %> | 가입일 : <%=sdf.format(userInfo.getJoin_date()) %></p>
		<hr>
		<br>
		<!-- 변경할 사용자 정보 입력 부분
			 폼 데이터 처리 부분 => profile_process.jsp
			 변경할 사용자 이름 => newNickname
			 기존 비밀번호 => oldPasswd
			 변결할 비밀번호 => newPasswd
		 -->
		<form action="profile_process.jsp" name="profileform" id="profileform" method="post">
			<div class="btnbox">
	 			<!-- 변경할 사용자 이름 입력 부분 -->
	 			<h5 style="margin-right: 400px; margin-bottom: 5px;">이름 변경</h5>
				<input type="text" class="bt" id="name" name="newNickname">
				<!-- 유효성 검사 이후, 오류 메세지 출력 부분 -->
				<div id="name-error" class="error-message"></div>
				
				<!-- 이전 비밀번호 입력 부분 -->
				<h5 style="margin-right: 370px; margin-bottom: 5px;">비밀번호 변경</h5>
				<input type="password" class="bt" name="oldPasswd" placeholder="이전 비밀번호">
				<!-- 유효성 검사 이후, 오류 메세지 출력 부분 -->
				<div class="error-message"></div>
				
				<!-- 변경할 비밀번호 입력 부분 -->
				<input type="password" id="passwd" class="bt" name="newPasswd" placeholder="변경할 비밀번호">
				<!-- 유효성 검사 이후, 오류 메세지 출력 부분 -->
				<div id="passwd-error" class="error-message"></div>
				
				<!-- 비밀번호 확인 입력 부분 -->
				<input type="password" id="pass" class="bt" placeholder="비밀번호 확인">
				<!-- 유효성 검사 이후, 오류 메세지 출력 부분 -->
				<div id="pass-error" class="error-message"></div>
				
				<!-- 폼 데이터 전송 버튼 -->
				<div class="checkbox">
					<input type="submit" value="확인" class="checkbutton">
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
        	if(!/^[가-힣]+$/.test(nametrim) && !/^[a-zA-Z]+$/.test(nametrim)){
    			nameError.textContent = "이름은 한글 또는 영문만 입력가능합니다.";
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
	<jsp:include page="footer.jsp" />
</body>
</html>
