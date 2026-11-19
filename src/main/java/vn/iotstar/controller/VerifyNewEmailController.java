package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = "/profile/verify-email")
public class VerifyNewEmailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("pendingNewEmail") == null) {
            resp.sendRedirect(req.getContextPath() + "/profile");
            return;
        }

        String notice = (String) session.getAttribute("otpNotice");
        if (notice != null) {
            req.setAttribute("alertWarning", notice);
            session.removeAttribute("otpNotice");
        }

        req.getRequestDispatcher("/views/verify-profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("pendingNewEmail") == null) {
            resp.sendRedirect(req.getContextPath() + "/profile");
            return;
        }

        String otp = req.getParameter("otp");
        String expectedOtp = (String) session.getAttribute("pendingOtp");
        String newEmail = (String) session.getAttribute("pendingNewEmail");
        User sessionUser = (User) session.getAttribute("account");

        if (otp != null && otp.trim().equals(expectedOtp)) {
            // Xác nhận OTP thành công -> Cập nhật email mới vào CSDL
            User user = userService.get(sessionUser.getUserName());
            user.setEmail(newEmail);
            userService.update(user);

            // Cập nhật session
            session.setAttribute("account", user);
            session.removeAttribute("pendingOtp");
            session.removeAttribute("pendingNewEmail");
            session.removeAttribute("pendingUserUpdate");

            req.setAttribute("alertSuccess", "Xác nhận và cập nhật Email mới thành công!");
            req.setAttribute("user", user);
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
        } else {
            req.setAttribute("alertError", "Mã OTP không chính xác! Vui lòng kiểm tra lại hòm thư.");
            req.getRequestDispatcher("/views/verify-profile.jsp").forward(req, resp);
        }
    }
}
