<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Video Của Tôi (Phân Trang 6 Video / Trang)</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background-color: #f8f9fa; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .video-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
        .video-card { background: white; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); overflow: hidden; }
        .video-thumb { width: 100%; height: 170px; object-fit: cover; background-color: #333; }
        .video-info { padding: 12px; }
        .video-title { font-size: 16px; font-weight: bold; margin: 0 0 8px; }
        .video-title a { color: #333; text-decoration: none; }
        .video-title a:hover { color: #007bff; text-decoration: underline; }
        .video-meta { font-size: 13px; color: #777; }
        .pagination { display: flex; justify-content: center; margin-top: 30px; gap: 8px; }
        .pagination a, .pagination span { padding: 8px 14px; border: 1px solid #ccc; text-decoration: none; color: #333; border-radius: 4px; }
        .pagination .active { background-color: #007bff; color: white; border-color: #007bff; }
    </style>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div class="container">
        <h2>📹 Danh Sách Videos Của Bạn (Phân trang 6 sp/trang)</h2>
        <div class="video-grid">
            <c:forEach items="${videoList}" var="v">
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
                            <span>Trạng thái: <b>${v.active ? 'Hoạt động' : 'Tạm ẩn'}</b></span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <c:if test="${empty videoList}">
            <p>Bạn chưa có video nào.</p>
        </c:if>

        <!-- Phân trang 6 video/trang -->
        <c:if test="${totalPages > 1}">
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="${pageContext.request.contextPath}/video?page=${currentPage - 1}">« Trước</a>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${currentPage == i}">
                            <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/video?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="${pageContext.request.contextPath}/video?page=${currentPage + 1}">Sau »</a>
                </c:if>
            </div>
        </c:if>
    </div>
</body>
</html>
