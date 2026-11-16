package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.EmailUtils;

import java.io.IOException;

@WebServlet(urlPatterns = "/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        User user = service.findByEmail(email);

        if (user == null) {
            req.setAttribute("alert", "Email không tồn tại trong hệ thống!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            return;
        }

        // Tạo OTP mới và lưu vào DB
        String otp = EmailUtils.getRandomOTP();
        System.out.println("====================================================");
        System.out.println(">>> [QUÊN MẬT KHẨU] Email: " + email + " | MÃ OTP: " + otp);
        System.out.println("====================================================");

        user.setCode(otp);
        service.update(user);

        // Gửi OTP qua email
        String subject = "Mã xác nhận đặt lại mật khẩu";
        String body = "Xin chào " + user.getFullName() + ",\n\nMã OTP đặt lại mật khẩu của bạn là: " + otp + "\nVui lòng không chia sẻ mã này.";
        boolean emailSent = EmailUtils.sendEmail(email, subject, body);

        // Chuyển sang trang đặt lại mật khẩu
        req.getSession().setAttribute("resetEmail", email);
        if (!emailSent) {
            req.setAttribute("alert", "Chưa thể gửi mail qua SMTP (do mạng chặn cổng). Mã OTP của bạn là: " + otp);
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect(req.getContextPath() + "/reset-password");
    }
}
