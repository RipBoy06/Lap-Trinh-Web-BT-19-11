<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kích Hoạt Tài Khoản Bằng OTP</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div style="max-width: 400px; margin: 30px auto; font-family: Arial, sans-serif;">
        <h2>Kích Hoạt Tài Khoản</h2>
        <p>Mã OTP đã được gửi đến email của bạn. Vui lòng kiểm tra hòm thư!</p>
        
        <c:if test="${alert != null}">
            <p style="color: red;">${alert}</p>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/verify" method="post">
            <div>
                <label>Email xác nhận:</label><br/>
                <input type="email" name="email" value="${not empty email ? email : sessionScope.verifyEmail}" required style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Nhập mã OTP (6 số):</label><br/>
                <input type="text" name="otp" placeholder="Nhập mã OTP" required maxlength="6" style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <button type="submit" style="padding: 10px 20px; background: #007bff; color: white; border: none; cursor: pointer;">Kích hoạt tài khoản</button>
        </form>
        <p><a href="${pageContext.request.contextPath}/login">Quay lại trang Đăng nhập</a></p>
    </div>
</body>
</html>