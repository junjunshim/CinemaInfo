<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>

<%
    //인코딩
    request.setCharacterEncoding("UTF-8");

    // 로그인 유저 정보 가져오기
    String username = request.getParameter("username");
    String password = request.getParameter("passwd");

    // 메소드 호출을 위한 DAO 객체 생성 및 로그인 메소드 호출
    UserDAO uDao = UserDAO.getInstance();
    User loginUser = uDao.loginUser(username, password);

    // 실패 시 null 반환
    if (loginUser != null) {
        //로그인 성공 시, 세션에 id값 설정 및 닉네임값 설정
        session.setAttribute("id", loginUser.getUserName());
        session.setAttribute("nickName", loginUser.getNickName());
        
        //메인 페이지 이동
        String contextPath = request.getContextPath();
        response.sendRedirect(contextPath + "/main.do");

    }
    else {
%>
        <script>
            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            history.back(); // 이전 페이지로 돌아감
        </script>
<%
    }
%>