<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Videos Của Tôi</title>
    <style>
        .video-card { transition: transform 0.2s, box-shadow 0.2s; border: none; border-radius: 10px; overflow: hidden; }
        .video-card:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(0,0,0,0.12); }
        .video-thumb { height: 180px; object-fit: cover; background: #000; width: 100%; }
    </style>
</head>
<body>
    <div class="container py-2">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
            <h3 class="fw-bold text-primary mb-0">
                <i class="bi bi-collection-play me-2"></i>Videos Của Tôi (Phân Trang 6 Video / Trang)
            </h3>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:forEach items="${videoList}" var="v">
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
                                <span><i class="bi bi-eye me-1"></i>${v.views} lượt xem</span>
                                <span>
                                    <span class="badge ${v.active ? 'bg-success' : 'bg-secondary'}">
                                        ${v.active ? 'Công khai' : 'Tạm ẩn'}
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <c:if test="${empty videoList}">
            <div class="text-center py-5">
                <i class="bi bi-film fs-1 text-muted"></i>
                <p class="text-muted mt-2">Bạn chưa đăng tải video nào.</p>
            </div>
        </c:if>

        <!-- Phân trang 6 video/trang -->
        <c:if test="${totalPages > 1}">
            <nav class="mt-5 d-flex justify-content-center">
                <ul class="pagination shadow-sm">
                    <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/video?page=${currentPage - 1}">« Trước</a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/video?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/video?page=${currentPage + 1}">Sau »</a>
                    </li>
                </ul>
            </nav>
        </c:if>
    </div>
</body>
</html>
