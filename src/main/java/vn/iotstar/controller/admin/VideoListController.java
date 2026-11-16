package vn.iotstar.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/video/list"})
public class VideoListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Video> videoList = videoService.findAll();
        req.setAttribute("videoList", videoList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-video.jsp");
        dispatcher.forward(req, resp);
    }
}
