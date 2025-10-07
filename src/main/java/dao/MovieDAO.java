package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import dto.Movie;

/**
 * 데이터베이스의 movies 테이블과 직접 통신하며
 * SQL 쿼리를 실행하는 클래스 (DAO: Data Access Object)
 */
public class MovieDAO {
    // DAO 객체가 여러 개 생성되지 않도록 싱글톤 패턴으로 설계
    private static MovieDAO instance = new MovieDAO();
    private MovieDAO() {}
    public static MovieDAO getInstance() {
        return instance;
    }

    /**
     * 데이터베이스에 있는 모든 영화 목록을 최신 개봉일 순으로 가져오는 메소드
     * @return 영화(Movie) 객체들이 담긴 리스트
     */
    public List<Movie> selectAllMovies() {
        String sql = "SELECT movie_id, title, image_path, release_date, duration, audience, film_rating, category, country, director, main_actor, description, avg_rating FROM movies ORDER BY release_date DESC";
        
        List<Movie> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBManager.getConnection(); 
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Movie movie = new Movie();
                
                movie.setMovie_id(rs.getLong("movie_id"));
                movie.setMovie_title(rs.getString("title"));
                movie.setImg_path(rs.getString("image_path"));
                movie.setRelease_date(rs.getDate("release_date"));
                movie.setDuration(rs.getInt("duration"));
                movie.setAudience(rs.getLong("audience"));
                movie.setFilm_rating(rs.getString("film_rating"));
                movie.setCategory(rs.getString("category"));
                movie.setCountry(rs.getString("country"));
                movie.setDirector(rs.getString("director"));
                movie.setMain_actor(rs.getString("main_actor"));
                movie.setDescription(rs.getString("description"));
                movie.setAvg_rating(rs.getDouble("avg_rating"));
                
                list.add(movie);
            }
        } catch (Exception e) {
            System.err.println("selectAllMovies 메소드 오류");
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return list;
    }
    
    /**
     * 최근 days일 안에 개봉한 영화 중 평균 평점이 가장 높은 영화 1편을 조회합니다.
     * 평점이 같을 경우, 더 최신 영화를 우선합니다.
     * @param days '최근'으로 간주할 기간 (일 단위)
     * @return 화제의 영화(Movie) 객체 1개
     */
    public Movie selectTopRatedMovieFromRecent(int days) {
        // release_date가 SYSDATE로부터 days일 이내인 영화를 찾고
        // avg_rating으로 내림차순, release_date(개봉일)로 내림차순 정렬
        // 가장 위에 있는 1개의 데이터만 검색하는 쿼리
        String sql = "SELECT * FROM (" +
                     "SELECT * FROM movies " +
                     "WHERE release_date >= SYSDATE - ? " +
                     "ORDER BY avg_rating DESC, release_date DESC" +
                     ") WHERE ROWNUM = 1";
        
        Movie movie = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, days);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                movie = new Movie();
                
                movie.setMovie_id(rs.getLong("movie_id"));
                movie.setMovie_title(rs.getString("title"));
                movie.setImg_path(rs.getString("image_path"));
                movie.setRelease_date(rs.getDate("release_date"));
                movie.setDuration(rs.getInt("duration"));
                movie.setAudience(rs.getLong("audience"));
                movie.setFilm_rating(rs.getString("film_rating"));
                movie.setCategory(rs.getString("category"));
                movie.setCountry(rs.getString("country"));
                movie.setDirector(rs.getString("director"));
                movie.setMain_actor(rs.getString("main_actor"));
                movie.setDescription(rs.getString("description"));
                movie.setAvg_rating(rs.getDouble("avg_rating"));
            }
        } catch (Exception e) {
        	System.err.println("selectTopRatedMovieFromRecent 메소드 오류");
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return movie;
    }
    
    /**
     * 특정 카테고리에 해당하는 영화를 최신순으로, 지정된 개수만큼 가져옵니다.
     * @param category 조회할 영화 카테고리 (예: "액션")
     * @param count 가져올 영화의 개수
     * @return 해당 카테고리의 영화(Movie) 객체들이 담긴 리스트
     */
    public List<Movie> selectMoviesByCategory(String category, int count) {
    	// category를 검색할 때 LIKE를 통해서 부분적으로 일치하는 칼럼을 찾는다
    	// release_date를 기준으로 내림차순 정렬
    	// 파라미터로 받은 count 개수만큼만 검색하는 쿼리
        String sql = "SELECT * FROM (" +
                     "SELECT * FROM movies " +
                     "WHERE category LIKE ? " +
                     "ORDER BY release_date DESC" +
                     ") WHERE ROWNUM <= ?";
        
        List<Movie> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" +  category + "%");
            pstmt.setInt(2, count);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Movie movie = new Movie();
                
                movie.setMovie_id(rs.getLong("movie_id"));
                movie.setMovie_title(rs.getString("title"));
                movie.setImg_path(rs.getString("image_path"));
                
                list.add(movie);
            }
        } catch (Exception e) {
        	System.err.println("selectMoviesByCategory 메소드 오류");
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return list;
    }
}