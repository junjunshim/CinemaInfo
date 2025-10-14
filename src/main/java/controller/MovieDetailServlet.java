package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MovieDAO;
import dto.Movie;
import dao.ReviewDAO;
import dto.Review;

/**
 * Servlet implementation class MovieDetailServlet
 */
@WebServlet("/detail.do")
public class MovieDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String movie_id_str = request.getParameter("id");
        
        if (movie_id_str == null || movie_id_str.isEmpty()) {
        	String contextPath = request.getContextPath();
            response.sendRedirect(contextPath + "/main.do");
            return;
        }
        
        long movie_id = Long.parseLong(movie_id_str);
        
		MovieDAO mDao = MovieDAO.getInstance();
		ReviewDAO rDao = ReviewDAO.getInstance();
		
		Movie movie = mDao.selectMovieById(movie_id);
		
		List<Review> reviewList = rDao.selectReviewsByMovieId(movie_id);
		
		request.setAttribute("movie", movie);
		request.setAttribute("reviewList", reviewList);
		
		// 최종적으로 보여줄 페이지=> detail.jsp
		String url = "/detail.jsp"; 
		
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
