<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String id = request.getParameter("id");
        if (id != null && !id.trim().isEmpty()) {
            session.setAttribute("id", id);
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form method="post" action="login.jsp">
        <label for="id">아이디:</label>
        <input type="text" name="id" id="id" required>
        <button type="submit">로그인</button>
    </form>
</body>
</html>
