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

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자가 입력한 검색 키워드를 가져온다. (get방식으로 저장되어있다.)
		String keyword = request.getParameter("keyword");
		
		// 영화 관련 쿼리 실행을 위한 dao객체 가져오기
		MovieDAO mDao = MovieDAO.getInstance();
		
		// selectMoviesByKeyword() => 키워드가 포함된 영화들을 리스트로 가져오기
		List<Movie> searchList = mDao.selectMoviesByKeyword(keyword);
		
		// dao를 통해서 가져온 정보들을 저장한다.
		request.setAttribute("searchList", searchList);
		request.setAttribute("keyword", keyword);
		
		// 최종적으로 보여줄 페이지=> search.jsp
		String url = "/search.jsp"; 
				
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
