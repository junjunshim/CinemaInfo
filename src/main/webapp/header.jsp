<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("id");
%>
<header class="header">
    <div class="logo-nav">
        <nav class="nav-menu-left">
        	<img src="images/logo.png" alt="MovieIntro 로고" class="logo">
            <a href="index.jsp">홈</a>
            <a href="movies.jsp">카테고리</a>
        </nav>
        <nav class="nav-menu-right">
        	<%
        	if(userId == null){
        	%>
        	
        	<a href="login.jsp">로그인</a>
        	<a href="signUp.jsp">회원가입</a>
        	
        	<%
        	}
        	else{        	
        	%>
        	
        	<a href="mypage.jsp"><%=userId %>님</a>
        	<a href="logout.jsp">로그아웃</a>
        	
        	<%
        	}
        	%>
        	
        </nav>
    </div>
</header>
