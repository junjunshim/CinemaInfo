<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 무효화
    session.invalidate();

    //시작페이지로 이동
    String contextPath = request.getContextPath();
    response.sendRedirect(contextPath + "/main.do");
%>