<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quên Mật Khẩu</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div style="max-width: 400px; margin: 30px auto; font-family: Arial, sans-serif;">
        <h2>Quên Mật Khẩu</h2>
        <c:if test="${alert != null}">
            <p style="color: red;">${alert}</p>
        </c:if>
        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
            <div>
                <label>Nhập Email đã đăng ký:</label><br/>
                <input type="email" name="email" required style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <button type="submit" style="padding: 10px 20px; background: #28a745; color: white; border: none; cursor: pointer;">Gửi mã xác nhận OTP</button>
        </form>
        <p><a href="${pageContext.request.contextPath}/login">Quay lại Đăng nhập</a></p>
    </div>
</body>
</html>