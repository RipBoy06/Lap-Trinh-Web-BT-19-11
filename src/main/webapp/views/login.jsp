<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập Vào Hệ Thống</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <h2>Đăng Nhập Vào Hệ Thống</h2>
    <c:if test="${alert != null}">
        <h3 style="color: red;">${alert}</h3>
    </c:if>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div>
            <label>Tài khoản:</label><br/>
            <input type="text" placeholder="Tài khoản" name="username" required />
        </div>
        <br/>
        <div>
            <label>Mật khẩu:</label><br/>
            <input type="password" placeholder="Mật khẩu" name="password" required />
        </div>
        <br/>
        <div>
            <input type="checkbox" name="remember" /> Nhớ tôi (Remember Me)
        </div>
        <br/>
        <button type="submit">Đăng nhập</button>
    </form>
    <p>Nếu bạn chưa có tài khoản trên hệ thống, thì hãy <a href="${pageContext.request.contextPath}/register">Đăng ký</a></p>
</body>
</html>