package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CheckDatabase {

    public static void main(String[] args) {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1"; 
        String username = "cinema_user";
        String password = "1234";

        Connection conn = null;
        
        System.out.println("최종 목표: cinema_user 계정으로 XEPDB1에 연결을 시도합니다...");
        
        try {
            // 1. 드라이버 로드
            Class.forName(driver);
            // 2. DB 연결
            conn = DriverManager.getConnection(url, username, password);
            
            System.out.println("==========================================");
            System.out.println("성공! cinema_user 계정으로 연결되었습니다!");
            System.out.println("==========================================");
        } catch (Exception e) {
            System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            System.err.println("실패: cinema_user 계정 연결 또는 조회에 문제가 발생했습니다.");
            System.err.println("자세한 오류 원인:");
            e.printStackTrace();
            System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {}
        }
    }
}