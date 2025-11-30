package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.UserDAO;
import dto.User;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile.do")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 현재 세션을 가져온다
		HttpSession session = request.getSession();
		// 세션에 저장된 id의 값을 가져온다.
		String username = (String) session.getAttribute("id");
		
		// 아이디 없을 시, 로그인 페이지로 이동
		if(username == null || username.isEmpty()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/login.jsp");
			return;
		}
		
		// 사용자 관련 쿼리 실행을 위한 dao객체 가져오기
		UserDAO uDao = UserDAO.getInstance();
		
		// selectUserByUsername() => 사용자 아이디로 사용자 정보 가져오기
		User user = uDao.selectUserByUsername(username);
		
		// dao를 통해서 가져온 정보들을 저장한다.
		request.setAttribute("userInfo", user);
		
		// 최종적으로 보여줄 페이지=> profile.jsp
		String url = "/profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
