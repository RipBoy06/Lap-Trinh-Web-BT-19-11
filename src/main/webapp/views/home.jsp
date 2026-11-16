<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ - 10 Video Mới Nhất</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background-color: #f8f9fa; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .video-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 20px; }
        .video-card { background: white; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); overflow: hidden; }
        .video-thumb { width: 100%; height: 160px; object-fit: cover; background-color: #333; }
        .video-info { padding: 12px; }
        .video-title { font-size: 16px; font-weight: bold; margin: 0 0 8px; }
        .video-title a { color: #333; text-decoration: none; }
        .video-title a:hover { color: #007bff; text-decoration: underline; }
        .video-meta { font-size: 13px; color: #777; }
    </style>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div class="container">
        <h2>🔥 10 Video Mới Nhất Trên Hệ Thống</h2>
        <div class="video-grid">
            <c:forEach items="${top10Videos}" var="v">
                <div class="video-card">
                    <c:choose>
                        <c:when test="${not empty v.poster}">
                            <img src="${pageContext.request.contextPath}/image?fname=${v.poster}" class="video-thumb" alt="${v.title}" />
                        </c:when>
                        <c:otherwise>
                            <div class="video-thumb" style="display: flex; align-items: center; justify-content: center; color: white;">No Image</div>
                        </c:otherwise>
                    </c:choose>
                    <div class="video-info">
                        <h3 class="video-title">
                            <!-- Bấm chuột vào tiêu đề để xem chi tiết và play video -->
                            <a href="${pageContext.request.contextPath}/video/detail?id=${v.videoId}">${v.title}</a>
                        </h3>
                        <div class="video-meta">
                            <span>👁 ${v.views} lượt xem</span> | 
                            <span>Đăng bởi: <b>${v.user != null ? v.user.fullName : 'Admin'}</b></span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <c:if test="${empty top10Videos}">
            <p>Chưa có video nào trong hệ thống.</p>
        </c:if>
    </div>
</body>
</html>
