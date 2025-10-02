package app.dao;

import app.model.Review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    // MovieDAO와 동일한 DB 정보 사용
    private static final String URL  =
        "jdbc:mysql://localhost:3306/cine?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public void insert(Review r) throws Exception {
        String sql = "INSERT INTO reviews(movie_id,user_id,nickname,rating,content) VALUES(?,?,?,?,?)";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, r.getMovieId());
            ps.setString(2, r.getUserId());
            ps.setString(3, r.getNickname());
            ps.setDouble(4, r.getRating());
            ps.setString(5, r.getContent());
            ps.executeUpdate();
        }
    }

    public boolean deleteByIdAndUser(long id, String userId) throws Exception {
        String sql = "DELETE FROM reviews WHERE id=? AND user_id=?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, id);
            ps.setString(2, userId);
            return ps.executeUpdate() > 0;
        }
    }

    public List<Review> findByMovie(String movieId) throws Exception {
        String sql = "SELECT * FROM reviews WHERE movie_id=? ORDER BY id DESC";
        List<Review> list = new ArrayList<>();
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Review r = new Review();
                    r.setId(rs.getLong("id"));
                    r.setMovieId(rs.getString("movie_id"));
                    r.setUserId(rs.getString("user_id"));
                    r.setNickname(rs.getString("nickname"));
                    r.setRating(rs.getDouble("rating"));
                    r.setContent(rs.getString("content"));
                    r.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(r);
                }
            }
        }
        return list;
    }

    public Double avgRating(String movieId) throws Exception {
        String sql = "SELECT AVG(rating) AS avg_rt FROM reviews WHERE movie_id=?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    double v = rs.getDouble("avg_rt");
                    return rs.wasNull() ? null : v;
                }
            }
        }
        return null;
    }

    public int countByMovie(String movieId) throws Exception {
        String sql = "SELECT COUNT(*) FROM reviews WHERE movie_id=?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }
}
