package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
            // 1. JNDI(Java Naming and Directory Interface)를 사용하기 위한 객체 생성
            Context initContext = new InitialContext();
            
            // 2. context.xml에 설정된 리소스들을 찾기 위한 경로 지정
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            
            // 3. context.xml 파일에서 "jdbc/oracle" 이라는 이름의 리소스(DataSource)를 찾아옴
            DataSource ds = (DataSource)envContext.lookup("jdbc/oracle");
            
            // 4. DataSource를 통해 커넥션 풀에서 Connection 하나를 빌려옴
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