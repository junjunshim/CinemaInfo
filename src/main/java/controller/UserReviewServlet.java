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
		
		// 현재 사용자 리뷰 페이지 위치를 가져온다. (get방식으로 저장되어있다.)
		String pageStr = request.getParameter("page");
		// page의 값이 없으면 1로 초기화하는 과정
        int currentPage = (pageStr == null) ? 1 : Integer.parseInt(pageStr);
        // 페이지당 보여줄 리뷰의 갯수
        int reviewsPerPage = 5;
        
        // 사용자, 리뷰 관련 쿼리 실행을 위한 dao객체 가져오기
		UserDAO uDao = UserDAO.getInstance();
        ReviewDAO rDao = ReviewDAO.getInstance();
        
        // selectUserByUsername() => 사용자 아이디로 사용자 정보 가져오기
        // selectReviewsByUserId() => 사용자 아이디, 현재 페이지 위치, 페이지당 리뷰 개수를 통해서 리뷰들 가져오기
        User user = uDao.selectUserByUsername(username);
        List<Review> reviewList = rDao.selectReviewsByUserId(user.getUser_id(), currentPage, reviewsPerPage);
        
        // getReviewCountByUserId => 사용자가 작성한 리뷰의 총개수 가져오기
        int totalReviews = rDao.getReviewCountByUserId(user.getUser_id());
        // 총 리뷰 개수를 통해서 구성해야될 총 페이지 수 구하기 ex) 77 / 5 => 15.4 를 소수점 자리 절삭하여 15
        int totalPages = (int) Math.ceil((double) totalReviews / reviewsPerPage);
        
        // dao를 통해서 가져온 정보들을 저장한다.
        request.setAttribute("userInfo", user);
        request.setAttribute("reviewList", reviewList);
        
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        
        // 최종적으로 보여줄 페이지=> user_review.jsp
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
