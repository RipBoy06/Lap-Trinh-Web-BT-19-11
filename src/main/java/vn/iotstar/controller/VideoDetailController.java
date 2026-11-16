package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = "/video/detail")
public class VideoDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String videoId = req.getParameter("id");
        if (videoId != null && !videoId.isEmpty()) {
            // Tăng lượt xem và lấy chi tiết video
            Video video = videoService.findByIdAndIncrementView(videoId);
            req.setAttribute("video", video);
        }
        req.getRequestDispatcher("/views/video-detail.jsp").forward(req, resp);
    }
}
