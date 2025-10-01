package app.dao;

import app.model.Movie;
import java.sql.*;

public class MovieDAO {

    // TODO: 팀 DB 정보로 교체하세요.
    private static final String URL  =
        "jdbc:mysql://localhost:3306/cine?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 드라이버
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public Movie findById(String id) throws Exception {
        String sql = "SELECT id,title_ko,title_en,release_date,runtime_min,genre,country,rating," +
                     "director,poster_url,overview,trailer_url,photos FROM movies WHERE id = ?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;

                Movie m = new Movie();
                m.setId(rs.getString("id"));
                m.setTitleKo(rs.getString("title_ko"));
                m.setTitleEn(rs.getString("title_en"));
                m.setReleaseDate(rs.getDate("release_date"));

                Object rt = rs.getObject("runtime_min");
                m.setRuntimeMin(rt == null ? null : ((Number) rt).intValue());

                m.setGenre(rs.getString("genre"));
                m.setCountry(rs.getString("country"));
                m.setRating(rs.getString("rating"));
                m.setDirector(rs.getString("director"));
                m.setPosterUrl(rs.getString("poster_url"));
                m.setOverview(rs.getString("overview"));
                m.setTrailerUrl(rs.getString("trailer_url"));
                m.setPhotos(rs.getString("photos"));

                return m;
            }
        }
    }
}
