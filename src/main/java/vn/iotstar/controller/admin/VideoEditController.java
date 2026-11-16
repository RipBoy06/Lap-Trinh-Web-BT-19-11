package vn.iotstar.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;
import vn.iotstar.util.Constant;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(urlPatterns = {"/admin/video/edit"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class VideoEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String videoId = req.getParameter("id");
        Video video = videoService.findById(videoId);
        req.setAttribute("video", video);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/edit-video.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String videoId = req.getParameter("videoId");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        boolean active = "1".equals(req.getParameter("active")) || "on".equals(req.getParameter("active"));

        Video video = videoService.findById(videoId);
        if (video != null) {
            video.setTitle(title);
            video.setDescription(description);
            video.setActive(active);

            try {
                Part part = req.getPart("poster");
                if (part != null && part.getSize() > 0) {
                    String uploadPath = Constant.DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdirs();

                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    int index = filename.lastIndexOf(".");
                    String ext = (index > 0) ? filename.substring(index + 1) : "png";
                    String fname = System.currentTimeMillis() + "." + ext;
                    part.write(uploadPath + File.separator + fname);
                    video.setPoster(fname);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            videoService.update(video);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/video/list");
    }
}
