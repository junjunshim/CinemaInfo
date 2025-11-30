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
	// 하나의 객체만 생성되어 자원을 효울적으로 관리 가능
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
    	// return할, 유저 객체
    	User user = null;
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
            // 1. 유저 아이디, 2. 유저 비밀번호
            pstmt.setString(1, name);
            pstmt.setString(2, passwd);            
            rs = pstmt.executeQuery();
            // rs.next() => 검색한 데이터가 있는지 확인 
            if(rs.next()) {
            	user = new User();
            	// rs.getLong, rs.getString 등등 으로
                // 검색한 데이터에서 각 속성들의 값을 가져온다.
            	user.setUser_id(rs.getLong("user_id"));
            	user.setUserName(rs.getString("username"));
            	user.setNickName(rs.getString("nickName"));
            	user.setUserEmail(rs.getString("email"));
            	user.setJoin_date(rs.getDate("join_date"));
            }
        } catch(Exception e) {
        	System.err.println("loginUser 메소드 오류");
        	e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
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
    	String sql = "INSERT INTO users (username, nickname, email, password) VALUES (?, ?,  ?, ?)";
    	// return할, 식별값 0이면 실패, 1이면 성공
    	int result = 0;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	     
	    try {
	    	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
	    	conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        // sql문에서 ?로 된 값을 채운다. => 
            // 1. 유저 id, 2. 유저 이름 id, 3. 유저 이메일, 4, 유저 비번
	        pstmt.setString(1, user.getUserName());
	        pstmt.setString(2, user.getNickName());
	        pstmt.setString(3, user.getUserEmail());
	        pstmt.setString(4, user.getUserPasswd());
	        
	        // executeUpdate() 데이터 변경 요청
	        result = pstmt.executeUpdate();
	     } catch(Exception e) {
	    	 System.err.println("joinUser 메소드 오류");
	    	 e.printStackTrace();
	     } finally {
	    	 // 데이터베이스 접근에 사용된 자원 반납 또는 해제
	    	 DBManager.close(conn, pstmt);
	     }
	     return result;
    }
    

    /**
     * 사용자 아이디를 매개변수로 받아, 해당하는 사용자의 모든 정보를 조회합니다.
     * (마이페이지에서 email, join_date 등을 표시할 때 사용)
     * @param username 조회할 사용자의 아이디
     * @return 해당 사용자의 모든 정보가 담긴 User 객체 (없으면 null)
     */
    public User selectUserByUsername(String username) {
    	// 사용자 아이디를 통해서 사용자 정보 검색하는 쿼리
        String sql = "SELECT * FROM users WHERE username = ?";
        // return할, 유저 객체
        User user = null;
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
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                // rs.getLong, rs.getString 등등 으로
                // 검색한 데이터에서 각 속성들의 값을 가져온다.
                user.setUser_id(rs.getLong("user_id"));
                user.setUserName(rs.getString("username"));
                user.setNickName(rs.getString("nickname"));
                user.setUserEmail(rs.getString("email"));
                user.setJoin_date(rs.getDate("join_date"));
            }
        } catch (Exception e) {
            System.err.println("selectUserByUsername 메소드 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt, rs);
        }
        return user;
    }
    
    /**
     * 사용자의 현재 비밀번호가 일치하는지 확인하는 메소드 (SELECT만 수행)
     * @param username 현재 로그인한 사용자 아이디
     * @param oldPassword 사용자가 입력한 '이전 비밀번호'
     * @return 일치하면 true, 불일치하면 false
     */
    public boolean checkPassword(String username, String oldPassword) {
    	// 사용자 아이디를 통해서 현재 비밀번호를 검색하는 쿼리
        String sql = "SELECT password FROM users WHERE username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        // return할, 식별값 true or false
        boolean isMatch = false;

        try {
        	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
        	// rs => pstmt를 통해서 얻은 sql결과 (SELECT 연산일 때만 필요)
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            // sql문에서 ?로 된 값을 채운다. => 사용자 아이디
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                if (rs.getString("password").equals(oldPassword)) {
                    isMatch = true;
                }
            }
        } catch (Exception e) {
            System.err.println("checkPassword 메소드 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt, rs); 
        }
        return isMatch;
    }

    /**
     * 사용자의 프로필 (닉네임, 비밀번호)을 업데이트합니다. (UPDATE만 수행)
     * 값이 비어있지 않은 필드만 선택적으로 업데이트하는 동적 SQL을 사용합니다.
     * @param username 현재 로그인한 사용자 아이디
     * @param newNickname 변경할 새 닉네임 (변경 안 하면 빈 문자열)
     * @param newPassword 변경할 새 비밀번호 (변경 안 하면 빈 문자열)
     * @return 업데이트 성공 시 1, 실패 시 0
     */
    public int updateProfile(String username, String newNickname, String newPassword) {
        // 사용자 정보 업데이트 부분, 원하는 정보만 업데이트하기 위해서 StringBuilder 사용
    	StringBuilder sql = new StringBuilder("UPDATE users SET ");
        
    	// 사용자가 변경을 원하는 정보인지 true or false로 구분
        boolean hasNickname = (newNickname != null && !newNickname.isEmpty());
        boolean hasPassword = (newPassword != null && !newPassword.isEmpty());

        // true 라면 해당 내용들을 append로 추가
        if (hasNickname && !hasPassword) {
            sql.append("nickname = ? ");
        } 
        
        else if (!hasNickname && hasPassword) {
            sql.append("password = ? ");
        }
        
        else if (hasNickname && hasPassword) {
            sql.append("nickname = ?, password = ? ");
        } 
        
        else {
            return 0;
        }
        // 어떤 사용자 인지 구분하는 부분을 마지막에 추가
        sql.append("WHERE username = ?");

        Connection conn = null;
        PreparedStatement pstmt = null;
        
        // return할, 식별값 0이면 실패, 1이면 성공
        int result = 0;
        // 변경할 정보의 개수
        int paramIndex = 1;

        try {
        	// conn => DBManger를 통해서 빌려온 하나의 커넥션 풀
        	// pstmt => conn를 통해서 spl명령어를 보내는 역할
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql.toString());
            
            // 정보를 변경할때만 sql의 ? 값을 채운다
            if (hasNickname) {
                pstmt.setString(paramIndex++, newNickname);
            }
            if (hasPassword) {
                pstmt.setString(paramIndex++, newPassword);
            }
            
            // 사용자 아이디는 조건식으로 항상 추가
            pstmt.setString(paramIndex, username);
            
            // executeUpdate() 데이터 변경 요청
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("updateProfile 메소드 오류");
            e.printStackTrace();
        } finally {
        	// 데이터베이스 접근에 사용된 자원 반납 또는 해제
            DBManager.close(conn, pstmt);
        }
        return result;
    }
}
