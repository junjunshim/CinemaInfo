package controller;

import java.io.IOException;
import java.util.List;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.MovieDAO;
import dto.Movie;
import dao.ReviewDAO;
import dto.Review;
import dao.UserDAO;
import dto.User;

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
		// 상세페이지의 영화 id를 가져온다. (get방식으로 저장되어있다.)
        String movie_id_str = request.getParameter("id");
        
        // 영화 id 값이 업으면 메인페이지로 이동
        if (movie_id_str == null || movie_id_str.isEmpty()) {
        	String contextPath = request.getContextPath();
            response.sendRedirect(contextPath + "/main.do");
            return;
        }
        
        // 영화 아이디를 long 형태로 변환
        long movie_id = Long.parseLong(movie_id_str);
        
        // 영화, 리뷰 관련 쿼리 실행을 위한 dao객체 가져오기
		MovieDAO mDao = MovieDAO.getInstance();
		ReviewDAO rDao = ReviewDAO.getInstance();
		
		// selectMovieById() => 영화 아이디로 영화 정보 가져오기
		Movie movie = mDao.selectMovieById(movie_id);
		
		// selectReviewsByMovieId() => 영화 id로 영화의 리뷰들을 가져오기
		List<Review> reviewList = rDao.selectReviewsByMovieId(movie_id);
		// getImagesFromFolder() => 영화의 서브 이미지들의 경로를 저장한 리스트 가져오기
		List<String> subImages = getImagesFromFolder(request, movie_id);
		
		// dao를 통해서 가져온 정보들을 저장한다.
		request.setAttribute("movie", movie);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("subImages", subImages);
		
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
		// 1. 한글 깨짐 방지 (리뷰 내용에 한글이 있으므로 필수)
		request.setCharacterEncoding("UTF-8");
		
		// 2. 어떤 동작을 할지 파라미터 확인 (detail.jsp의 hidden input 값)
		// action="add" -> 리뷰 등록, action="delete" -> 리뷰 삭제
		String action = request.getParameter("action");
		
		// 3. 로그인 여부 및 사용자 정보 확인
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("id");
		
		String contextPath = request.getContextPath();
		
		// 로그인이 안 된 상태로 POST 요청이 오면 로그인 페이지 보내기
		if (username == null) {
			response.sendRedirect(contextPath + "/login.jsp");
			return;
		}

		// 4. 현재 영화 ID 받기
		String movieIdStr = request.getParameter("id");
		long movie_id = Long.parseLong(movieIdStr);

		// DAO 객체 준비
		UserDAO uDao = UserDAO.getInstance();
		ReviewDAO rDao = ReviewDAO.getInstance();
		
		// 리뷰 등록 (action이 "add"일 때)
		if ("add".equals(action)) {
			// 1) 현재 로그인한 사용자의 전체 정보를 가져옴
			User user = uDao.selectUserByUsername(username);
			
			// 2) 폼에서 보낸 데이터 받기
			double rating = Double.parseDouble(request.getParameter("rating"));
			String content = request.getParameter("content");

			// 3) 데이터 담기
			Review review = new Review();
			review.setMovie_id(movie_id);
			review.setUser_id(user.getUser_id());
			review.setRating(rating);
			review.setReview_comment(content);
			
			// 4) DB에 저장
			int result = rDao.insertReview(review);
			
			// 5) 결과 처리 (실패 시 에러 메시지 저장)
			if (result == 0) {
				session.setAttribute("review_error", "이미 리뷰를 작성했거나 등록에 실패했습니다.");
			}
		}
		// 리뷰 삭제 (action이 "delete"일 때)
		else if ("delete".equals(action)) {
			String reviewIdStr = request.getParameter("rid");
			if (reviewIdStr != null) {
				long review_id = Long.parseLong(reviewIdStr);
				rDao.deleteReview(review_id);
			}
		}

		// 5. 모든 처리가 끝나면, 다시 해당 영화 상세 페이지로 이동(새로고침)
		response.sendRedirect("detail.do?id=" + movie_id);
	}
	
	/**
	 * 서버의 특정 폴더를 스캔하여 이미지 파일 경로 목록을 반환하는 메소드
	 * @param request : 실제 경로를 찾기 위해 필요
	 * @param movieId : 영화 ID (폴더명)
	 * @return 이미지 경로 리스트 (예: ["/images/29/1.jpg", "/images/29/2.png"])
	 */
	private List<String> getImagesFromFolder(HttpServletRequest request, long movieId) {
	    List<String> imageList = new ArrayList<>();
	    
	    // 1. 영화의 이미지 경로
	    String webPath = "/images/" + movieId;
	    
	    // 2. 실제 서버의 물리적 경로 찾기
	    String realPath = request.getServletContext().getRealPath(webPath);
	    
	    // 3. 폴더 객체 생성
	    File dir = new File(realPath);
	    
	    // 4. 폴더가 존재하고, 실제 디렉토리인지 확인
	    if (dir.exists() && dir.isDirectory()) {
	        // 폴더 내의 모든 파일 목록을 가져옴
	        File[] files = dir.listFiles();
	        
	        if (files != null) {
	            for (File file : files) {
	                // 파일인 경우만 처리 (하위 폴더 제외)
	                if (file.isFile()) {
	                    String fileName = file.getName();
	                    
	                    // 이미지 파일인지 확인 (jpg, png, gif 등) - 대소문자 무시
	                    String lowerName = fileName.toLowerCase();
	                    if (lowerName.endsWith(".jpg") || lowerName.endsWith(".png") || 
	                        lowerName.endsWith(".jpeg") || lowerName.endsWith(".gif")) {
	                        
	                        // "main.png" 메인 포스터 제외
	                        if (!fileName.equals("main.png")) {
	                            imageList.add(webPath + "/" + fileName);
	                        }
	                    }
	                }
	            }
	        }
	    }
	    // 숫자 순서대로 정렬
	    Collections.sort(imageList);
	    
	    return imageList;
	}
}
