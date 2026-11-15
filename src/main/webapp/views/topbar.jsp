<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div style="background: #f5f5f5; padding: 10px; margin-bottom: 15px; border-bottom: 1px solid #ddd;">
    <c:choose>
        <c:when test="${sessionScope.account == null}">
            <a href="${pageContext.request.contextPath}/login">Đăng nhập</a> |
            <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
        </c:when>
        <c:otherwise>
            Xin chào, <b>${sessionScope.account.fullName} (${sessionScope.account.userName})</b> |
            <a href="${pageContext.request.contextPath}/logout">Đăng Xuất</a>
        </c:otherwise>
    </c:choose>
</div>