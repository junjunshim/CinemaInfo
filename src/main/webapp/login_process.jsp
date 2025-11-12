<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 로그인에 사용될 자바 클래스 설정
	 dto.User => 입력받은 폼 데이터 저장을 위한 클래스
	 dao.UserDAO => users 테이블 관련 sql 쿼리 실행을 위한 클래스
-->
<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>

<%
    // 인코딩
    request.setCharacterEncoding("UTF-8");

    // 넘어온 로그인 유저 정보 가져오기 (아이디, 비밀번호)
    String username = request.getParameter("username");
    String password = request.getParameter("passwd");

    // 로그인 메소드 호출을 위한 DAO 객체 생성
    UserDAO uDao = UserDAO.getInstance();
    // UserDAO의 loginUser메서드(로그인 처리를 위한 sql 쿼리)
    User loginUser = uDao.loginUser(username, password);

    // 실패 시 null 반환
    if (loginUser != null) {
        // 로그인 성공 시, 세션에 id값 설정 및 닉네임값 설정
        session.setAttribute("id", loginUser.getUserName());
        session.setAttribute("nickName", loginUser.getNickName());
        // 세션 값 설정으로 header.jsp의 사용자 페이지 활성화
        
        // 메인 페이지 이동
        // request.getContextPath() => 프로젝트 경로 ex) /CinemaInfo
        String contextPath = request.getContextPath();
        // response.sendRedirect() => 메인 페이지로 페이지 이동(리다이렉션)
        // /main.do는 메인 페이지 서블릿 경로
        response.sendRedirect(contextPath + "/main.do");
    }
    else {
%>
		<!-- 로그인 실패 시, 실패 메세지 표시 및 이전 페이지 이동-->
        <script>
            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            history.back(); // 이전 페이지로 돌아감
        </script>
<%
    }
%>