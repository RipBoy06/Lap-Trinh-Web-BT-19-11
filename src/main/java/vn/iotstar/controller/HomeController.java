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
import java.util.List;

@WebServlet(urlPatterns = {"/home", "/trang-chu"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 4.2: Lấy 10 video mới nhất
        List<Video> top10 = videoService.findTop10New();
        req.setAttribute("top10Videos", top10);
        req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
    }
}
