<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>

<%
	//인코딩
    request.setCharacterEncoding("UTF-8");

    //넘어온 회원가입 정보 가져오기
    String username = request.getParameter("id");
    String password = request.getParameter("passwd");
    String email = request.getParameter("email");

    // 회원가입을 위한 User 객체 생성 및 데이터 입력 
    User user = new User();
    user.setUserName(username);
    user.setUserPasswd(password);
    user.setUserEmail(email);

    // 회원가입 메소드
    UserDAO uDao = UserDAO.getInstance();
    int result = uDao.joinUser(user);
	
 	// 회원가입 성공 시
    if (result > 0) {
        
%>
   	<script>
		alert("회원가입에 성공했습니다. 로그인 페이지로 이동합니다.");
        location.href = "login.jsp"; // 로그인 페이지로 이동
	</script>
<%
    }
	//회원가입 실패 시
    else {   
%>
        <script>
            alert("회원가입에 실패했습니다. 다시 시도해주세요.");
            history.back(); // 이전 페이지로 돌아감
        </script>
<%
    }
%>