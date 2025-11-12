<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 회원가입에 사용될 자바 클래스 설정 :
	 dto.User => 입력받은 폼 데이터 저장을 위한 클래스
	 dao.UserDAO => users 테이블 관련 sql 쿼리 실행을 위한 클래스
-->
<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>

<%
	// 인코딩
    request.setCharacterEncoding("UTF-8");

    // 넘어온 회원가입 정보 가져오기 (이름, 아이디, 비밀번호, 이메일)
    String nickName = request.getParameter("name");
    String username = request.getParameter("id");
    String password = request.getParameter("passwd");
    String email = request.getParameter("email");

    // 회원가입을 위한 User 객체 생성 및 데이터 입력 => UserDAO에서 User객체를 통해서 sql 쿼리문 실행
    User user = new User();
    // User클래스의 setter를 이용해서 데이터 입력
    user.setNickName(nickName);
    user.setUserName(username);
    user.setUserPasswd(password);
    user.setUserEmail(email);

    // UserDAO객체 생성(회원가입 쳐리를 위한 sql쿼리 등, 실행을 위한 클래스)
    UserDAO uDao = UserDAO.getInstance();
    // UserDAO의 joinUser메서드(회원가입 처리을 위한 sql 쿼리)
    int result = uDao.joinUser(user);
    // 처리 결과 성공 시 1, 실패 시 0
	
 	// 회원가입 성공 시
    if (result > 0) {
%>
	<!-- 성공 시, 성공 메세지 출력 및 로그인 페이지로 이동 -->
   		<script>
			alert("회원가입에 성공했습니다. 로그인 페이지로 이동합니다.");
        	location.href = "login.jsp"; // 로그인 페이지로 이동
		</script>
<%
    }
    else 
    {   
%>
	<!-- 실패 시, 실패 메세지 출력 및 이전 페이지로 이동 -->
		<script>
      		alert("회원가입에 실패했습니다. 다시 시도해주세요.");
         	history.back(); // 이전 페이지로 돌아감
      	</script>
<%
    }
%>