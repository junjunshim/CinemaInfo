<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>

<%
    //인코딩
    request.setCharacterEncoding("UTF-8");
	
    // 변경할 프로필 정보 가져오기
    String username = (String)session.getAttribute("id");
    String newNickname = request.getParameter("newNickname");
    String oldPasswd = request.getParameter("oldPasswd");
    String newPasswd = request.getParameter("newPasswd");

    // 메소드 호출을 위한 DAO 객체 생성 및 로그인 메소드 호출
    UserDAO uDao = UserDAO.getInstance();
	
    
    // 실패 시 null 반환
    if (uDao.checkPassword(username, oldPasswd)) {
    	if(uDao.updateProfile(username, newNickname, newPasswd) == 1){
    		//프로필 변경 성공 시, 세션에 닉네임 값 재설정
            session.setAttribute("nickName", newNickname);
            
            //사용자 페이지 이동
            String contextPath = request.getContextPath();
            response.sendRedirect(contextPath + "/userPage.do");

    	}
    	else{
    	%>
            <script>
                alert("프로필 변경에 실패하였습니다.");
                history.back(); // 이전 페이지로 돌아감
            </script>
    	<%
    	}
    }
    else {
%>
        <script>
            alert("사용자의 비밀번호가 일치하지 않습니다.");
            history.back(); // 이전 페이지로 돌아감
        </script>
<%
    }
%>