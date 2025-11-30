<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	// login 성공 시, 설정 되는 세션 값 가져오기(아이디, 이름)
	String userId = (String)session.getAttribute("id");
	String nickName = (String)session.getAttribute("nickName");
%>
<header class="header">
    <div class="logo-nav">
        <nav class="nav-menu-left">
        	<!-- 프로젝트 메인 로고 -->
        	<img src="images/logo.png" alt="MovieIntro 로고" class="logo">
        	<!-- 페인 페이지 경로 :
        		request.getContextPath() + /main.do => 메인 페이지 서블릿 이동 경로
        	 -->
            <a href="<%=request.getContextPath() %>/main.do">홈</a>
        </nav>
        <div class="search-bar">
            <form action="<%=request.getContextPath() %>/search.do" method="get">
                <input type="text" name="keyword" placeholder="영화 제목을 입력하세요" required>
                <button type="submit">🔍</button>
            </form>
        </div>
        <nav class="nav-menu-right">
        	<%
        	// 로그인 성공 시, 설정되는 세션 값이 있는 확인
        	if(userId == null){
        	%>
        	<!-- 세션 값 미설정 시, 로그인 과 회원가입 페이지 표시 
        		 로그인 과 회원가입은 페이지는 데이터 베이스 연결이 필요없어, 서블릿 사용 X
        	-->
        	<a href="login.jsp">로그인</a>
        	<a href="join.jsp">회원가입</a>
        	<%
        	}
        	else{        	
        	%>
        	<!-- 사용자 페이지 이동 부분 
        		 request.getContextPath() + /userPage.do => 사용자 페이지 이동 서블릿 경로
        	-->
        	<a href="<%=request.getContextPath() %>/userPage.do"><%=nickName %>님</a>
        	<!-- 로그아웃 처리를 위한 jsp파일  -->
        	<a href="logout.jsp">로그아웃</a>
        	<%
        	}
        	%>
        </nav>
    </div>
</header>