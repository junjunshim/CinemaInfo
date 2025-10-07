package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBManager;
import dto.User;

/**
 * 데이터베이스의 users 테이블과 직접 통신하며
 * SQL 쿼리를 실행하는 클래스 (DAO: Data Access Object)
 */
public class UserDAO {
	// DAO 객체가 여러 개 생성되지 않도록 싱글톤 패턴으로 설계
    private static UserDAO instance = new UserDAO();
    private UserDAO() {}
    public static UserDAO getInstance() {
        return instance;
    }
    
    /**
     * 로그인 처리를 위한 메소드. 아이디와 비밀번호가 일치하는 사용자를 찾습니다.
     * @param name 사용자가 입력한 아이디
     * @param password 사용자가 입력한 비밀번호
     * @return 로그인 성공 시 사용자 정보(User)를, 실패 시 null을 반환합니다.
     */
    public User loginUser(String name, String passwd) {
    	// 파라미터로 입력받은 name, passwd가 일치하는 유저 검색
    	String sql="SELECT * FROM users WHERE username = ? AND password = ?";
    	User user = null;
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try {
    		conn = DBManager.getConnection(); 
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, passwd);            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	user = new User();
            	user.setUser_id(rs.getLong("user_id"));
            	user.setUserName(rs.getString("username"));
            	user.setUserEmail(rs.getString("email"));
            	user.setJoin_date(rs.getDate("join_date"));
            }
        } catch(Exception e) {
        	System.err.println("loginUser 메소드 오류");
        	e.printStackTrace();
        } finally {
        	DBManager.close(conn, pstmt, rs);
    	}
    	return user;
    }
    
    /**
     * 회원가입 처리를 위한 메소드. 새로운 사용자 정보를 DB에 삽입합니다.
     * @param user 회원가입할 사용자 정보가 담긴 User 객체
     * @return DB에 삽입 성공 시 1, 실패 시 0을 반환합니다.
     */
    public int joinUser(User user) {
    	// 입력받은 user 객체 데이터베이스에 삽입
    	String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
    	 int result = 0; // 0: 실패, 1: 성공
         Connection conn = null;
         PreparedStatement pstmt = null;
         
         try {
        	 conn = DBManager.getConnection();
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, user.getUserName());
             pstmt.setString(2, user.getUserEmail());
             pstmt.setString(3, user.getUserPasswd());
             
             result = pstmt.executeUpdate();
         } catch(Exception e) {
        	 System.err.println("joinUser 메소드 오류");
        	 e.printStackTrace();
         } finally {
        	 DBManager.close(conn, pstmt);
         }
         return result;
    }
}
