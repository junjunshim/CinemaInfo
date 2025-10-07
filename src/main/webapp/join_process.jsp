<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>

<%
    // 1. 클라이언트가 보낸 데이터의 인코딩 설정 (한글 깨짐 방지)
    request.setCharacterEncoding("UTF-8");

    // 2. join.jsp의 form에서 전송된 파라미터(name 속성값)들을 받습니다.
    String username = request.getParameter("id");
    String password = request.getParameter("passwd");
    String email = request.getParameter("email");

    // 3. 받은 파라미터들을 UserDTO 객체에 저장합니다.
    User user = new User();
    user.setUserName(username);
    user.setUserPasswd(password);
    user.setUserEmail(email);

    // 4. UserDAO 인스턴스를 가져와서 회원가입 메소드를 호출합니다.
    UserDAO uDao = UserDAO.getInstance();
    int result = uDao.joinUser(user);

    // 5. 결과에 따라 페이지를 이동시키거나 알림을 띄웁니다.
    if (result > 0) {
        // 회원가입 성공 시
%>
        <script>
            alert("회원가입에 성공했습니다. 로그인 페이지로 이동합니다.");
            location.href = "login.jsp"; // 로그인 페이지로 이동
        </script>
<%
    } else {
        // 회원가입 실패 시 (예: DB 오류, 아이디 중복 등)
%>
        <script>
            alert("회원가입에 실패했습니다. 다시 시도해주세요.");
            history.back(); // 이전 페이지(회원가입 폼)로 돌아감
        </script>
<%
    }
%>