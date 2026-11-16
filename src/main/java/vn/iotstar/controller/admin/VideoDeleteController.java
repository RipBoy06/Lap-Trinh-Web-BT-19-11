package vn.iotstar.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/video/delete"})
public class VideoDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String videoId = req.getParameter("id");
        if (videoId != null) {
            videoService.delete(videoId);
        }
        resp.sendRedirect(req.getContextPath() + "/admin/video/list");
    }
}
