package vn.iotstar.service.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;

import java.sql.Date;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null) {
            // Kiểm tra mật khẩu mã hóa BCrypt (hỗ trợ cả mật khẩu thường nếu tài khoản cũ chưa hash)
            boolean passMatch = false;
            try {
                passMatch = BCrypt.checkpw(password, user.getPassWord());
            } catch (Exception e) {
                passMatch = password.equals(user.getPassWord());
            }

            if (passMatch) {
                return user;
            }
        }
        return null;
    }

    @Override
    public User get(String username) {
        return userDao.get(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public boolean register(String username, String password, String email, String fullname, String phone, String otp) {
        if (userDao.checkExistUsername(username) || userDao.checkExistEmail(email)) {
            return false;
        }
        // Hash password bằng BCrypt
        String hashPass = BCrypt.hashpw(password, BCrypt.gensalt(12));
        Date date = new Date(System.currentTimeMillis());

        // status = 0 (chưa kích hoạt), code = mã OTP
        User user = new User(email, username, fullname, hashPass, null, 3, phone, date, 0, otp);
        userDao.insert(user);
        return true;
    }

    @Override
    public boolean verifyCode(String email, String code) {
        User user = userDao.findByEmail(email);
        if (user != null && code != null && code.equals(user.getCode())) {
            user.setStatus(1); // Kích hoạt tài khoản
            user.setCode(null); // Xóa OTP
            userDao.update(user);
            return true;
        }
        return false;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }
}