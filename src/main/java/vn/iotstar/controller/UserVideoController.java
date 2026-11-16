package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.User;
import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/video")
public class UserVideoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("account") : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int page = 1;
        int pageSize = 6; // Phân trang 6 sp/trang theo đề bài
        try {
            String pageStr = req.getParameter("page");
            if (pageStr != null && !pageStr.isEmpty()) {
                page = Integer.parseInt(pageStr);
                if (page < 1) page = 1;
            }
        } catch (Exception e) {
            page = 1;
        }

        List<Video> videos = videoService.findByUser(user.getId(), page, pageSize);
        long totalVideos = videoService.countByUser(user.getId());
        int totalPages = (int) Math.ceil((double) totalVideos / pageSize);

        req.setAttribute("videoList", videos);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("/views/user-videos.jsp").forward(req, resp);
    }
}
