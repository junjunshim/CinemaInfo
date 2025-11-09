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
		
        List<Review> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBManager.getConnection(); 
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, movie_id);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
            	Review review = new Review();
            	
                review.setReview_id(rs.getLong("review_id"));
                review.setMovie_id(rs.getLong("movie_id"));
                review.setUser_id(rs.getLong("user_id"));
                review.setRating(rs.getDouble("rating"));
                review.setReview_comment(rs.getString("review_comment"));
                review.setReview_date(rs.getDate("review_date"));
                review.setMovie_title(rs.getString("movie_title"));
                review.setUserName(rs.getString("username"));
                
                list.add(review);
            }
        } catch (Exception e) {
        	System.err.println("selectReviewsByMovieId 메소드 오류");
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return list;
	}
	
	/**
     * 데이터베이스에 있는 특정 유저의 리뷰들을 최신순으로 가져오는 메소드
     * @param user_id 조회할 유저의 ID
     * @return 리뷰(Review) 객체들이 담긴 리스트
     */
	public List<Review> selectReviewsByUserId(long user_id) {
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
                     "ORDER BY r.review_date DESC";
        
        List<Review> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, user_id);

            rs = pstmt.executeQuery();

            while(rs.next()) {
                Review review = new Review();
                
                review.setReview_id(rs.getLong("review_id"));
                review.setMovie_id(rs.getLong("movie_id"));
                review.setUser_id(rs.getLong("user_id"));
                review.setRating(rs.getDouble("rating"));
                review.setReview_comment(rs.getString("review_comment"));
                review.setReview_date(rs.getDate("review_date"));
                review.setMovie_title(rs.getString("movie_title"));
                review.setUserName(rs.getString("username"));
                
                list.add(review);
            }
        } catch (Exception e) {
        	System.err.println("selectReviewsByUserId 메소드 오류");
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return list;
    }
}
