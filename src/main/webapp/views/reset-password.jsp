<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt Lại Mật Khẩu Mới</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div style="max-width: 400px; margin: 30px auto; font-family: Arial, sans-serif;">
        <h2>Đặt Lại Mật Khẩu</h2>
        <c:if test="${alert != null}">
            <p style="color: red;">${alert}</p>
        </c:if>
        <form action="${pageContext.request.contextPath}/reset-password" method="post">
            <div>
                <label>Email:</label><br/>
                <input type="email" name="email" value="${not empty email ? email : sessionScope.resetEmail}" required style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Mã OTP (6 số):</label><br/>
                <input type="text" name="otp" required maxlength="6" style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Mật khẩu mới:</label><br/>
                <input type="password" name="newPassword" required style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <button type="submit" style="padding: 10px 20px; background: #007bff; color: white; border: none; cursor: pointer;">Đổi Mật Khẩu</button>
        </form>
    </div>
</body>
</html>