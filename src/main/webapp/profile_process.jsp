<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 사용자 프로필 변경에 사용될 자바 클래스 설정
	 dao.UserDAO => users 테이블 관련 sql 쿼리 실행을 위한 클래스
 -->
<%@ page import="dao.UserDAO" %>

<%
    //인코딩
    request.setCharacterEncoding("UTF-8");
	
    // 변경할 프로필 정보 가져오기 (아이디, 새 이름, 이전 비밀번호, 새 비밀번호)
    String username = (String)session.getAttribute("id");
    String newNickname = request.getParameter("newNickname");
    String oldPasswd = request.getParameter("oldPasswd");
    String newPasswd = request.getParameter("newPasswd");

    // 프로필 변경 호출을 위한 DAO 객체 생성
    UserDAO uDao = UserDAO.getInstance();
	
    // 프로필 변경 과정
    // 1. 사용자 체크 메서드 checkPassword() 호출 => 비밀번호 변경 전, id 와 passwd이 데이터베이스의 값과 같은 지 확인
    // => 결과 값, 성공 시 true, 실패 시 false
    if (uDao.checkPassword(username, oldPasswd)) {
    	// 2. 입력한 사용자 정보로 UPDATE 하는 updateProfile() 호출
    	// 입력 매개 변수 => id, 새 이름, 새 비밀번호
    	if(uDao.updateProfile(username, newNickname, newPasswd) == 1){
    		// 프로필 변경 성공 시, 세션에 닉네임 값 재설정
    		// id는 변경 필요 X
            session.setAttribute("nickName", newNickname);
            
            // 사용자 페이지 이동
            // request.getContextPath() => 프로젝트 경로 ex) /CinemaInfo
            String contextPath = request.getContextPath();
         	// response.sendRedirect() => 사용자 페이지로 페이지 이동(리다이렉션)
            // /main.do는 사용자 페이지 서블릿 경로
            response.sendRedirect(contextPath + "/userPage.do");

    	}
    	else{
    	%>
    	<!-- 프로필 변경 실패 시, 실패 메세지 표시 및 이전 페이지 이동 -->
            <script>
                alert("프로필 변경에 실패하였습니다.");
                history.back(); // 이전 페이지로 돌아감
            </script>
    	<%
    	}
    }
    else {
	%>
		<!-- 사용자 입력 비밀번호가 일치하지 않을때 메세지 표시 및 이전 페이지 이동 -->
        <script>
            alert("사용자의 비밀번호가 일치하지 않습니다.");
            history.back(); // 이전 페이지로 돌아감
        </script>
	<%
    }
%>