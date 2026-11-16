package vn.iotstar.configs;

import org.mindrot.jbcrypt.BCrypt;
import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.util.EmailUtils;

public class TestAll {
    public static void main(String[] args) {
        System.out.println("=== 1. TEST BCRYPT PASSWORD HASHING ===");
        String rawPass = "123456";
        String hashed = BCrypt.hashpw(rawPass, BCrypt.gensalt(12));
        System.out.println("Mật khẩu gốc: " + rawPass);
        System.out.println("Mật khẩu đã hash: " + hashed);
        boolean isMatch = BCrypt.checkpw(rawPass, hashed);
        System.out.println("Kiểm tra khớp mật khẩu: " + (isMatch ? "SUCCESS (Khớp)" : "FAILED (Không khớp)"));

        System.out.println("\n=== 2. TEST DATABASE & JPA (LẤY USER ADMIN) ===");
        try {
            UserDao userDao = new UserDaoImpl();
            User admin = userDao.get("admin");
            if (admin != null) {
                System.out.println("Lấy User Admin thành công: " + admin.getFullName() + " | Email: " + admin.getEmail() + " | Status: " + admin.getStatus());
            } else {
                System.out.println("Chưa tìm thấy user 'admin' trong DB. Hãy đảm bảo bạn đã chạy script SQL!");
            }
        } catch (Exception e) {
            System.err.println("Lỗi kết nối JPA/Database: " + e.getMessage());
        }

        System.out.println("\n=== 3. TEST GỬI EMAIL OTP QUA GMAIL ===");
        String testEmail = "hoaihao2006@gmail.com"; // Email của bạn
        String otp = EmailUtils.getRandomOTP();
        System.out.println("Đang gửi thử OTP (" + otp + ") tới " + testEmail + "...");
        boolean emailSent = EmailUtils.sendEmail(testEmail, "Test OTP WebApp", "Mã OTP thử nghiệm của bạn là: " + otp);
        if (emailSent) {
            System.out.println("Gửi Email thành công! Hãy kiểm tra hộp thư đến (Inbox hoặc Spam) của " + testEmail);
        } else {
            System.err.println("Gửi Email thất bại! Vui lòng kiểm tra lại kết nối mạng hoặc Mật khẩu ứng dụng Gmail.");
        }
    }
}
