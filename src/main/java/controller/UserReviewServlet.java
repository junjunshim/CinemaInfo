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
 * Servlet implementation class UserReviewServlet
 */
@WebServlet("/userReview.do")
public class UserReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("id");
		
		// 아이디 없을 시, 로그인 페이지로 이동
		if(username == null || username.isEmpty()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/login.jsp");
			return;
		}
		
		String pageStr = request.getParameter("page");
        int currentPage = (pageStr == null) ? 1 : Integer.parseInt(pageStr);
        int reviewsPerPage = 5;
        
		UserDAO uDao = UserDAO.getInstance();
        ReviewDAO rDao = ReviewDAO.getInstance();
        
        User user = uDao.selectUserByUsername(username);
        List<Review> reviewList = rDao.selectReviewsByUserId(user.getUser_id(), currentPage, reviewsPerPage);
        
        int totalReviews = rDao.getReviewCountByUserId(user.getUser_id());
        int totalPages = (int) Math.ceil((double) totalReviews / reviewsPerPage);
        
        request.setAttribute("userInfo", user);
        request.setAttribute("reviewList", reviewList);
        
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        
        String url = "/user_review.jsp"; 
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
