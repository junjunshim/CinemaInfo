package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import dto.Review;

/**
 * 데이터베이스의 reviews 테이블과 직접 통신하며
 * SQL 쿼리를 실행하는 클래스 (DAO: Data Access Object)
 */
public class ReviewDAO {
	// DAO 객체가 여러 개 생성되지 않도록 싱글톤 패턴으로 설계
	// 하나의 객체만 생성되어 자원을 효울적으로 관리 가능
	private static ReviewDAO instance = new ReviewDAO();
	private ReviewDAO() {};
	public static ReviewDAO getInstance() {
		return instance;
	}
	
	/**
     * 데이터베이스에 있는 특정 영화의 리뷰 목록을 최신 순으로 가져오는 메소드
     * @param movie_id 조회할 영화의 ID
     * @return 리뷰(Review) 객체들이 담긴 리스트
     */
	public List<Review> selectReviewsByMovieId(long movie_id){
		// reviews, movies, users 테이블을 JOIN
		// 파라미터로 받은 movie_id와 같은 리뷰들만
		// review_date 내림차순으로 정렬하여 검색
		String sql = "SELECT r.review_id, r.movie_id, r.user_id, r.rating, " +
                "r.review_comment, r.review_date, " +
                "m.title as movie_title, u.username as username " +
                "FROM reviews r " +
                "JOIN movies m ON r.movie_id = m.movie_id " +
                "JOIN users u ON r.user_id = u.user_id " +
                "WHERE r.movie_id = ? " + 
                "ORDER BY r.review_date DESC";
		
		// return할, 리뷰 리스트
        List<Review> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
        	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
        	// rs => pstmt를 통해서 얻은 sql결과 (SELECT 연산일 때만 필요)
            conn = DBManager.getConnection(); 
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, movie_id);
            rs = pstmt.executeQuery();
            // rs.next() => 검색한 데이터를 한줄씩 가져오기 
            while(rs.next()) {
            	Review review = new Review();
            	// rs.getLong, rs.getString 등등 으로
                // 검색한 데이터에서 각 속성들의 값을 가져온다.
                review.setReview_id(rs.getLong("review_id"));
                review.setMovie_id(rs.getLong("movie_id"));
                review.setUser_id(rs.getLong("user_id"));
                review.setRating(rs.getDouble("rating"));
                review.setReview_comment(rs.getString("review_comment"));
                review.setReview_date(rs.getDate("review_date"));
                review.setMovie_title(rs.getString("movie_title"));
                review.setUserName(rs.getString("username"));
                // 가져온 리뷰 데이터를 담는 review객체를 리스트에 추가
                list.add(review);
            }
        } catch (Exception e) {
        	System.err.println("selectReviewsByMovieId 메소드 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt, rs);
        }
        return list;
	}
	
	/**
     * 데이터베이스에 있는 특정 유저의 리뷰들을 최신순으로 가져오는 메소드
     * @param user_id 조회할 유저의 ID
     * @param page      요청하는 페이지 번호 (1, 2, 3...)
     * @param reviewsPerPage 페이지 당 리뷰 수 (5)
     * @return 리뷰(Review) 객체들이 담긴 리스트
     */
	public List<Review> selectReviewsByUserId(long user_id, int page, int reviewsPerPage) {
		// reviews, movies, users 테이블을 JOIN
		// 파라미터로 받은 user_id와 같은 리뷰들만 검색
		// review_date 내림차순으로 정렬하여 검색
        String sql = "SELECT r.review_id, r.movie_id, r.user_id, r.rating, " +
                     "r.review_comment, r.review_date, " +
                     "m.title as movie_title, u.username as username " +
                     "FROM reviews r " +
                     "JOIN movies m ON r.movie_id = m.movie_id " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "WHERE r.user_id = ? " +
                     "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        // return할, 리뷰 리스트
        List<Review> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
        	// rs => pstmt를 통해서 얻은 sql결과 (SELECT 연산일 때만 필요)
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            // sql문에서 ?로 된 값을 채운다. =>
            // 1. 유저 아이디, 2. 몇번째 오프셋, 3. 오프셋당 갯수
            pstmt.setLong(1, user_id);
            pstmt.setInt(2, (page - 1) * reviewsPerPage);
            pstmt.setInt(3, reviewsPerPage);

            rs = pstmt.executeQuery();
            // rs.next() => 검색한 데이터를 한줄씩 가져오기 
            while(rs.next()) {
                Review review = new Review();
                // rs.getLong, rs.getString 등등 으로
                // 검색한 데이터에서 각 속성들의 값을 가져온다.
                review.setReview_id(rs.getLong("review_id"));
                review.setMovie_id(rs.getLong("movie_id"));
                review.setUser_id(rs.getLong("user_id"));
                review.setRating(rs.getDouble("rating"));
                review.setReview_comment(rs.getString("review_comment"));
                review.setReview_date(rs.getDate("review_date"));
                review.setMovie_title(rs.getString("movie_title"));
                review.setUserName(rs.getString("username"));
                // 가져온 리뷰 데이터를 담는 review객체를 리스트에 추가
                list.add(review);
            }
        } catch (Exception e) {
        	System.err.println("selectReviewsByUserId 메소드 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt, rs);
        }
        return list;
    }
	
	/**
     * 특정 사용자가 작성한 리뷰의 '총 개수'를 반환하는 메소드
     * @param user_id 조회할 유저의 ID
     * @return 총 리뷰 개수
     */
    public int getReviewCountByUserId(long user_id) {
    	// 사용자의 모든 리뷰의 개수를 검색하는 쿼리
        String sql = "SELECT COUNT(*) FROM reviews WHERE user_id = ?";
        // return할, 리뷰의 개수
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
        	// rs => pstmt를 통해서 얻은 sql결과 (SELECT 연산일 때만 필요)
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            // sql문에서 ?로 된 값을 채운다. => 유저 id 값 입력
            pstmt.setLong(1, user_id);
            rs = pstmt.executeQuery();
            
            // rs.next() => 검색한 데이터가 있는지 확인 
            if (rs.next()) {
            	// rs.getInt를 통해서 개수를 가져온다.
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.err.println("getReviewCountByUserId 메소드 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt, rs);
        }
        return count;
    }
    
    /**
     * 사용자의 영화 리뷰를 등록하는 메소드
     * @param review 등록할 리뷰의 정보를 담는 객체
     * @return 성공 시 1, 실패 시 0 반환
     */
    public int insertReview(Review review) {
    	// 사용자 리뷰를 추가하는 쿼리
    	String sql = "INSERT INTO reviews (movie_id, user_id, rating, review_comment, review_date) " +
    	             "VALUES (?, ?, ?, ?, SYSDATE)";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        // return할, 식별값 0이면 실패, 1이면 성공
        int result = 0;

        try {
        	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            
            // sql문에서 ?로 된 값을 채운다. => 
            // 1. 리뷰할 영화 id, 2. 리뷰를 작성하는 사용자 id, 3. 영화 평점, 4, 리뷰 내용
            pstmt.setLong(1, review.getMovie_id());
            pstmt.setLong(2, review.getUser_id());
            pstmt.setDouble(3, review.getRating());
            pstmt.setString(4, review.getReview_comment());
            
            // executeUpdate() 데이터 변경 요청
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("insertReview 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt);
        }
        return result;
    }
    
    /**
     * 사용자의 등록된 리뷰를 삭제하는 메소드
     * @param review_id 삭제할 리뷰의 review_id 값
     * @return 성공 시 1, 실패 시 0 반환
     */
    public int deleteReview(long review_id) {
    	// 사용자 리뷰 삭제 쿼리
        String sql = "DELETE FROM reviews WHERE review_id = ?";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        // return할, 식별값 0이면 실패, 1이면 성공
        int result = 0;

        try {
        	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            // sql문에서 ?로 된 값을 채운다. => 리뷰 id
            pstmt.setLong(1, review_id);
            // executeUpdate() 데이터 변경 요청
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("deleteReview 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt);
        }
        return result;
    }
}
