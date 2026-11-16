<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div style="background: #343a40; color: white; padding: 12px 20px; margin-bottom: 20px; font-family: Arial, sans-serif;">
    <div style="display: flex; justify-content: space-between; align-items: center;">
        <div>
            <a href="${pageContext.request.contextPath}/home" style="color: #fff; text-decoration: none; font-weight: bold; margin-right: 15px;">🏠 TRANG CHỦ</a>
            <a href="${pageContext.request.contextPath}/video" style="color: #bbb; text-decoration: none; margin-right: 15px;">📹 Videos Của Tôi</a>
            <c:if test="${sessionScope.account != null && sessionScope.account.roleid == 1}">
                <a href="${pageContext.request.contextPath}/admin/video/list" style="color: #ffc107; text-decoration: none; margin-right: 15px;">⚙ Quản Lý Video</a>
                <a href="${pageContext.request.contextPath}/admin/category/list" style="color: #ffc107; text-decoration: none; margin-right: 15px;">📂 Quản Lý Category</a>
            </c:if>
        </div>
        <div>
            <c:choose>
                <c:when test="${sessionScope.account == null}">
                    <a href="${pageContext.request.contextPath}/login" style="color: #17a2b8; text-decoration: none; margin-right: 10px;">Đăng nhập</a> |
                    <a href="${pageContext.request.contextPath}/register" style="color: #28a745; text-decoration: none; margin-left: 10px;">Đăng ký</a>
                </c:when>
                <c:otherwise>
                    Xin chào, <b>${sessionScope.account.fullName} (${sessionScope.account.userName})</b> |
                    <a href="${pageContext.request.contextPath}/logout" style="color: #dc3545; text-decoration: none; margin-left: 10px;">Đăng Xuất</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
