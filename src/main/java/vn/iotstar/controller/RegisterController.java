package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.Constant;
import vn.iotstar.util.EmailUtils;

import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        if (service.checkExistUsername(username)) {
            req.setAttribute("alert", "Tài khoản đã tồn tại!");
            req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
            return;
        }
        if (service.checkExistEmail(email)) {
            req.setAttribute("alert", "Email đã tồn tại!");
            req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
            return;
        }

        // Tạo mã OTP 6 số ngẫu nhiên
        String otp = EmailUtils.getRandomOTP();
        System.out.println("====================================================");
        System.out.println(">>> [ĐĂNG KÝ] Email: " + email + " | MÃ OTP KÍCH HOẠT: " + otp);
        System.out.println("====================================================");

        boolean isSuccess = service.register(username, password, email, fullname, phone, otp);
        if (isSuccess) {
            // Gửi OTP qua email
            String subject = "Xác nhận kích hoạt tài khoản - Web App";
            String body = "Xin chào " + fullname + ",\n\nMã OTP kích hoạt tài khoản của bạn là: " + otp + "\nVui lòng không chia sẻ mã này với bất kỳ ai.";
            boolean emailSent = EmailUtils.sendEmail(email, subject, body);

            // Chuyển sang trang nhập OTP xác thực
            req.getSession().setAttribute("verifyEmail", email);
            if (!emailSent) {
                // Nếu mạng trường/tường lửa chặn SMTP, thông báo OTP trực tiếp để bạn test ngay
                req.setAttribute("alert", "Chưa thể gửi mail qua SMTP (do mạng chặn cổng). Mã OTP của bạn là: " + otp);
                req.getRequestDispatcher("/views/verify.jsp").forward(req, resp);
                return;
            }
            resp.sendRedirect(req.getContextPath() + "/verify");
        } else {
            req.setAttribute("alert", "Lỗi hệ thống khi đăng ký! (Hãy kiểm tra lại database đã thêm cột status và code chưa)");
            req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
        }
    }
}
