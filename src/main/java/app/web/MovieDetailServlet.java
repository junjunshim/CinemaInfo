package app.web;

import app.dao.MovieDAO;
import app.dao.ReviewDAO;
import app.model.Movie;
import app.model.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/detail")
public class MovieDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 경고 제거

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id"); // 메인에서 넘기는 영화 키 (예: chainsaw)
        if (id == null || id.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        try {
            Movie m = new MovieDAO().findById(id);
            if (m == null) {
                req.setAttribute("error", "영화를 찾을 수 없습니다.");
            } else {
                req.setAttribute("movie", m);

                // 리뷰 목록/평균/개수 전달
                ReviewDAO rdao = new ReviewDAO();
                List<Review> reviews = rdao.findByMovie(id);
                req.setAttribute("reviews", reviews);
                req.setAttribute("avgRating", rdao.avgRating(id));
                req.setAttribute("reviewCount", rdao.countByMovie(id));
            }

            req.getRequestDispatcher("/detail.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

