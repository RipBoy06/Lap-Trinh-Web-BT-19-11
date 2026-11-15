<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tạo tài khoản mới</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <h2>Tạo tài khoản mới</h2>
    <c:if test="${alert != null}">
        <h3 style="color: red;">${alert}</h3>
    </c:if>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <div>
            <label>Tài khoản:</label><br/>
            <input type="text" name="username" placeholder="Tài khoản" required />
        </div><br/>
        <div>
            <label>Họ tên:</label><br/>
            <input type="text" name="fullname" placeholder="Họ tên" required />
        </div><br/>
        <div>
            <label>Email:</label><br/>
            <input type="email" name="email" placeholder="Nhập Email" required />
        </div><br/>
        <div>
            <label>Số điện thoại:</label><br/>
            <input type="text" name="phone" placeholder="Số điện thoại" />
        </div><br/>
        <div>
            <label>Mật khẩu:</label><br/>
            <input type="password" name="password" placeholder="Mật khẩu" required />
        </div><br/>
        <button type="submit">Tạo tài khoản</button>
    </form>
    <p>Nếu bạn đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a></p>
</body>
</html>