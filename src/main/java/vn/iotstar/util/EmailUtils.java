package vn.iotstar.util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailUtils {
    private static final String FROM_EMAIL = "hoaihao2006@gmail.com";
    // Mật khẩu ứng dụng (App Password) - xóa dấu cách để tương thích tuyệt đối với SMTP
    private static final String APP_PASSWORD = "slmbbouseonlcxyq";

    public static String getRandomOTP() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public static boolean sendEmail(String toEmail, String subject, String body) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL, "Web App Support"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            System.out.println(">>> [EMAIL SUCCESS] Đã gửi mail OTP thành công tới: " + toEmail);
            return true;
        } catch (Exception e) {
            System.err.println(">>> [EMAIL ERROR] Gửi mail thất bại tới: " + toEmail);
            e.printStackTrace();
            return false;
        }
    }
}
