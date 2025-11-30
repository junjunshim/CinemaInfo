package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// context.xml => 환경 설정 정보를 담고 있는 파일
// 담고 있는 정보 => 데이터베이스 드라이버 이름, db 주소, db 접근 아이디/비번

// DBCP : 커넥션 풀
// 데이터베이스 연결하는 과정을 효울적으로 관리하는 방법
/**
 *데이터베이스 커넥션 풀을 관리하는 클래스 
 */
public class DBManager {

    /**
     * 커넥션 풀에서 Connection 객체를 하나 빌려오는 메소드
     * @return 연결된 Connection 객체
     */
    public static Connection getConnection() {
        Connection conn = null;
        try {
        	// 1. 탐색기(Context) 열기
            // JNDI(Java Naming and Directory Interface) 서비스를 시작합니다.
            // 서버 설정 파일에 있는 자원을 찾을 준비를 하는 것입니다.
            Context initContext = new InitialContext();
            
            // 2. 환경 설정 폴더로 이동
            // "java:/comp/env"는 톰캣이 리소스를 관리하는 표준 디렉터리 경로입니다.
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            
            // 3. 'jdbc/oracle'이라는 이름표를 가진 자원(DataSource) 찾기
            // context.xml 파일에 설정해둔 name="jdbc/oracle"을 찾는 것입니다.
            // 여기서 DataSource는 '커넥션 풀 관리자'입니다.
            DataSource ds = (DataSource)envContext.lookup("jdbc/oracle");
            
            // 4. 관리자에게 연결 하나 빌려오기
            // 풀에 미리 만들어져 있는 Connection 객체 중 놀고 있는 것을 하나 가져옵니다.
            conn = ds.getConnection();
        } catch (Exception e) {
        	System.err.println("getConnection 메소드 오류");
            e.printStackTrace();
        }
        return conn;
    }
    
    /**
     * 사용이 끝난 자원을 커넥션 풀에 반납하는 메소드(SELECT 쿼리용)
     * @param conn Connection 객체
     * @param stmt Statement 또는 PreparedStatement 객체
     * @param rs ResultSet 객체
     */
    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
        	System.err.println("close 메소드 오류");
            e.printStackTrace();
        }
    }
    
    
    /**
     * 사용이 끝난 자원을 커넥션 풀에 반납하는 메소드 (INSERT, UPDATE, DELETE 쿼리용)
     * @param conn Connection 객체
     * @param stmt Statement 또는 PreparedStatement 객체
     */
    public static void close(Connection conn, Statement stmt) {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
        	System.err.println("close 메소드 오류");
            e.printStackTrace();
        }
    }
}