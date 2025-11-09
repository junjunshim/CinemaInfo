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
import dao.ReviewDAO;
import dto.User;
import dto.Review;

/**
 * Servlet implementation class UserPageServlet
 */
@WebServlet("/userPage.do")
public class UserPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 세션에서 사용자 아이디 가져오기
		HttpSession session = request.getSession();
        String username = (String) session.getAttribute("id");
        
        // 아이디 없을 시, 로그인 페이지로 이동
        if (username == null || username.isEmpty()) {
            String contextPath = request.getContextPath();
            response.sendRedirect(contextPath + "/login.jsp");
            return;
        }
        
        UserDAO uDao = UserDAO.getInstance();
        ReviewDAO rDao = ReviewDAO.getInstance();
        
        // 아이디로 사용자 상세 정보 조회
        User user = uDao.selectUserByUsername(username);
         
        request.setAttribute("userInfo", user);
        
        // 최종적으로 보여줄 페이지=> user.jsp
        String url = "/user.jsp"; 
        
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
