package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.CloudinaryUtil;
import vn.iotstar.util.EmailUtils;

import java.io.IOException;

@WebServlet(urlPatterns = "/profile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("account") : null;

        if (sessionUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Tải lại thông tin mới nhất từ CSDL
        User user = userService.get(sessionUser.getUserName());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("account") : null;
        if (sessionUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = userService.get(sessionUser.getUserName());

        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String newEmail = req.getParameter("email");

        // 2. VALIDATION SERVER-SIDE
        if (fullname == null || fullname.trim().isEmpty()) {
            req.setAttribute("alertError", "Họ và tên không được để trống!");
            req.setAttribute("user", user);
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        if (phone != null && !phone.trim().isEmpty() && !phone.matches("^0[0-9]{9}$")) {
            req.setAttribute("alertError", "Số điện thoại không hợp lệ (phải gồm 10 số bắt đầu bằng số 0)!");
            req.setAttribute("user", user);
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        if (newEmail == null || !newEmail.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            req.setAttribute("alertError", "Định dạng Email không hợp lệ!");
            req.setAttribute("user", user);
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        // 3. UPLOAD HÌNH ẢNH AVATAR LÊN CLOUDINARY BẰNG MULTIPART
        try {
            Part part = req.getPart("avatar");
            if (part != null && part.getSize() > 0) {
                String uploadedUrl = CloudinaryUtil.uploadImage(part);
                if (uploadedUrl != null) {
                    user.setAvatar(uploadedUrl);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        user.setFullName(fullname.trim());
        user.setPhone(phone != null ? phone.trim() : null);

        // NẾU NGƯỜI DÙNG THAY ĐỔI EMAIL MỚI: Gửi mã OTP xác nhận đến email mới
        if (!newEmail.trim().equalsIgnoreCase(user.getEmail())) {
            // Kiểm tra email mới đã tồn tại chưa
            if (userService.checkExistEmail(newEmail.trim())) {
                req.setAttribute("alertError", "Email này đã được tài khoản khác sử dụng!");
                req.setAttribute("user", user);
                req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
                return;
            }

            // Sinh mã OTP gửi đến email mới
            String otp = EmailUtils.getRandomOTP();
            System.out.println("====================================================");
            System.out.println(">>> [ĐỔI EMAIL] Email mới: " + newEmail + " | MÃ OTP: " + otp);
            System.out.println("====================================================");

            boolean emailSent = EmailUtils.sendEmail(newEmail.trim(), "Xác nhận thay đổi Email - HCMUTE WebApp",
                    "Xin chào " + fullname + ",\n\nMã OTP xác nhận cập nhật email mới của bạn là: " + otp + "\nVui lòng nhập mã để hoàn tất.");

            // Lưu thông tin chờ xác nhận vào Session
            session.setAttribute("pendingNewEmail", newEmail.trim());
            session.setAttribute("pendingOtp", otp);
            session.setAttribute("pendingUserUpdate", user);

            // Cập nhật trước fullname, phone, avatar
            userService.update(user);
            session.setAttribute("account", user);

            if (!emailSent) {
                session.setAttribute("otpNotice", "Chưa thể gửi qua SMTP (mạng chặn cổng). Mã OTP xác nhận là: " + otp);
            }

            resp.sendRedirect(req.getContextPath() + "/profile/verify-email");
            return;
        }

        // NẾU EMAIL KHÔNG THAY ĐỔI: Lưu trực tiếp
        userService.update(user);
        session.setAttribute("account", user);

        req.setAttribute("alertSuccess", "Cập nhật hồ sơ thành công!");
        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }
}
