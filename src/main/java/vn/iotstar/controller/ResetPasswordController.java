package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        String otp = req.getParameter("otp");
        String newPassword = req.getParameter("newPassword");

        User user = service.findByEmail(email);
        if (user != null && otp != null && otp.equals(user.getCode())) {
            // Mã hóa mật khẩu mới và lưu vào DB
            user.setPassWord(BCrypt.hashpw(newPassword, BCrypt.gensalt(12)));
            user.setCode(null); // Xóa OTP đã sử dụng
            service.update(user);

            req.setAttribute("alertSuccess", "Đổi mật khẩu thành công! Vui lòng đăng nhập với mật khẩu mới.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("alert", "Mã OTP không chính xác!");
            req.setAttribute("email", email);
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }
}
