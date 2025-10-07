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
 * Servlet implementation class MovieListServlet
 */
@WebServlet("/main.do")
public class MovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MovieDAO mDao = MovieDAO.getInstance();
		ReviewDAO rDao = ReviewDAO.getInstance();
		
		// 전체 영화 목록 가져오기
        List<Movie> movieList = mDao.selectAllMovies();
        request.setAttribute("movieList", movieList);
        
        // 화제의 영화 가져오기
        Movie topMovie = mDao.selectTopRatedMovieFromRecent(1000);
        if(topMovie != null) {
        	List<Review> reviewList = rDao.selectReviewsByMovieId(topMovie.getMovie_id());
        	
        	request.setAttribute("topMovie", topMovie);
        	request.setAttribute("reviewList", reviewList);
        }
        
        // 카테고리별 영화 가져오기
        List<Movie> actionMovies = mDao.selectMoviesByCategory("액션", 4);
        List<Movie> dramaMovies = mDao.selectMoviesByCategory("드라마", 4);
        List<Movie> comedyMovies = mDao.selectMoviesByCategory("코미디", 4);
        List<Movie> mysteryMovies = mDao.selectMoviesByCategory("미스터리", 4);
        List<Movie> animationMovies = mDao.selectMoviesByCategory("애니메이션", 4);
        
        request.setAttribute("actionMovies", actionMovies);
        request.setAttribute("dramaMovies", dramaMovies);
        request.setAttribute("comedyMovies", comedyMovies);        
        request.setAttribute("mysteryMovies", mysteryMovies);
        request.setAttribute("animationMovies", animationMovies);
        
        // 최종적으로 보여줄 페이지=> index.jsp
        String url = "/index.jsp"; 
        
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
