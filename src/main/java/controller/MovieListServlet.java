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
		// 영화, 리뷰 관련 쿼리 실행을 위한 dao객체 가져오기
		MovieDAO mDao = MovieDAO.getInstance();
		ReviewDAO rDao = ReviewDAO.getInstance();
		
		// selectAllMovies() => 전체 영화 목록 가져오기
        List<Movie> movieList = mDao.selectAllMovies();
        request.setAttribute("movieList", movieList);
        
        // selectTopRatedMovieFromRecent() => 1000이내의 영화 중 , 평점이 높은 영화를 가져오기
        Movie topMovie = mDao.selectTopRatedMovieFromRecent(1000);
        if(topMovie != null) {
        	// selectReviewsByMovieId() => 화제영화의 리뷰 목록 가져오기
        	List<Review> reviewList = rDao.selectReviewsByMovieId(topMovie.getMovie_id());
        	
        	// 화제 영화와 해당 리뷰들을 저장
        	request.setAttribute("topMovie", topMovie);
        	request.setAttribute("reviewList", reviewList);
        }
        
        // 카테고리 별 보여질 개수
        int displayNum = 5;
        // selectMoviesByCategory() => 카테고리별 영화 가져오기
        List<Movie> actionMovies = mDao.selectMoviesByCategory("액션", displayNum);
        List<Movie> dramaMovies = mDao.selectMoviesByCategory("드라마", displayNum);
        List<Movie> comedyMovies = mDao.selectMoviesByCategory("코미디", displayNum);
        List<Movie> mysteryMovies = mDao.selectMoviesByCategory("미스터리", displayNum);
        List<Movie> animationMovies = mDao.selectMoviesByCategory("애니메이션", displayNum);
        
        // 카테고리 영화리스트를 저장
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
