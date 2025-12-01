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
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/category.do")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 인코딩 변경, 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// 넘어온 카테고리의 값을 가져온다. (get방식으로 저장되어있다.)
		String category = request.getParameter("category");
		
		// 카테고리 값이 없으면 메인보내기
		if (category == null || category.trim().isEmpty()) {
			response.sendRedirect("main.do");
			return;
		}
		
		// 영화, 리뷰 관련 쿼리 실행을 위한 dao객체 가져오기
		MovieDAO mDao = MovieDAO.getInstance();
		List<Movie> movieList = mDao.selectMoviesByCategory(category, 100);
		
		// dao를 통해서 가져온 정보들을 저장한다.
		request.setAttribute("movieList", movieList);
		request.setAttribute("selectedCategory", category); // 화면 타이틀용
		
		// 최종적으로 보여줄 페이지=> category.jsp
		String url = "/category.jsp"; 
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
