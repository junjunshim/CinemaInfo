package app.web;

import app.dao.ReviewDAO;
import app.model.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/reviews")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 경고 제거

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action  = req.getParameter("action");   // add | delete
        String movieId = req.getParameter("movieId");

        if (movieId == null || movieId.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        // 로그인 전까지는 세션으로 임시 사용자 식별
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            userId = "u-" + session.getId();
            session.setAttribute("userId", userId);
        }

        try {
            ReviewDAO dao = new ReviewDAO();

            if ("add".equals(action)) {
                String nick = req.getParameter("nick");
                if (nick == null || nick.isBlank()) nick = "익명";

                String content = req.getParameter("content");
                if (content == null) content = "";
                content = content.trim();
                if (content.length() > 30) content = content.substring(0, 30);

                double rating;
                try {
                    rating = Double.parseDouble(req.getParameter("rating"));
                } catch (Exception e) {
                    rating = 0;
                }
                // 0.5 ~ 5.0, 0.5 단위로 보정
                rating = Math.max(0.5, Math.min(5.0, Math.round(rating * 2) / 2.0));

                if (content.isEmpty()) {
                    session.setAttribute("review_error", "리뷰를 입력하세요 (30자 이내).");
                } else {
                    Review r = new Review();
                    r.setMovieId(movieId);
                    r.setUserId(userId);
                    r.setNickname(nick);
                    r.setRating(rating);
                    r.setContent(content);
                    dao.insert(r);
                }

            } else if ("delete".equals(action)) {
                long id = Long.parseLong(req.getParameter("id"));
                dao.deleteByIdAndUser(id, userId);
            }

            resp.sendRedirect(req.getContextPath() + "/detail?id=" + movieId + "#reviews");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

