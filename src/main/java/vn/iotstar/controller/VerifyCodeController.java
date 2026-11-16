package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = "/verify")
public class VerifyCodeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/verify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        String otp = req.getParameter("otp");

        boolean verified = service.verifyCode(email, otp);
        if (verified) {
            req.setAttribute("alertSuccess", "Kích hoạt tài khoản thành công! Vui lòng đăng nhập.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("alert", "Mã OTP không đúng hoặc tài khoản không tồn tại!");
            req.setAttribute("email", email);
            req.getRequestDispatcher("/views/verify.jsp").forward(req, resp);
        }
    }
}
