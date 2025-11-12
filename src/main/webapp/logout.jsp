<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 무효화
	// 세션의 id, nickName 무효화
    session.invalidate();
	// 세션 값 비활성화로 header.jsp의 로그인 및 회원가입 페이지 활성화

    // request.getContextPath() => 프로젝트 경로 ex) /CinemaInfo
    String contextPath = request.getContextPath();
 	// response.sendRedirect() => 메인 페이지로 페이지 이동(리다이렉션)
    // /main.do는 메인 페이지 서블릿 경로
    response.sendRedirect(contextPath + "/main.do");
%>