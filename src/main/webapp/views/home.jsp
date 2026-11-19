<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Trang Chủ - Top 10 Video Mới Nhất</title>
    <style>
        .video-card { transition: transform 0.2s, box-shadow 0.2s; border: none; border-radius: 10px; overflow: hidden; }
        .video-card:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(0,0,0,0.12); }
        .video-thumb { height: 175px; object-fit: cover; background: #000; width: 100%; }
    </style>
</head>
<body>
    <div class="container py-2">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold text-dark mb-0">
                <i class="bi bi-fire text-danger me-2"></i>10 Video Mới Nhất
            </h3>
            <span class="badge bg-danger rounded-pill px-3 py-2">Trending</span>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
            <c:forEach items="${top10Videos}" var="v">
                <div class="col">
                    <div class="card h-100 video-card shadow-sm">
                        <c:choose>
                            <c:when test="${not empty v.poster}">
                                <img src="${pageContext.request.contextPath}/image?fname=${v.poster}" class="video-thumb" alt="${v.title}" />
                            </c:when>
                            <c:otherwise>
                                <div class="video-thumb d-flex align-items-center justify-content-center text-secondary">
                                    <i class="bi bi-play-btn fs-1"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fs-6 fw-bold">
                                <a href="${pageContext.request.contextPath}/video/detail?id=${v.videoId}" class="text-decoration-none text-dark stretched-link">
                                    ${v.title}
                                </a>
                            </h5>
                            <div class="mt-auto text-muted small d-flex justify-content-between pt-2 border-top">
                                <span><i class="bi bi-eye me-1"></i>${v.views} xem</span>
                                <span><i class="bi bi-person me-1"></i>${v.user != null ? v.user.fullName : 'Admin'}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <c:if test="${empty top10Videos}">
            <div class="text-center py-5">
                <i class="bi bi-inbox fs-1 text-muted"></i>
                <p class="text-muted mt-2">Hệ thống chưa có video nào.</p>
            </div>
        </c:if>
    </div>
</body>
</html>
