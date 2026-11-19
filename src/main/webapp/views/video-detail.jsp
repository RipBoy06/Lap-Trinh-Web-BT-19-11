<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>${video.title} - Chi Tiết Video</title>
</head>
<body>
    <div class="container py-3">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <c:choose>
                    <c:when test="${not empty video}">
                        <div class="card shadow-sm border-0 rounded-3 overflow-hidden mb-4">
                            <div class="ratio ratio-16x9 bg-dark">
                                <video controls autoplay poster="${pageContext.request.contextPath}/image?fname=${video.poster}">
                                    <source src="${pageContext.request.contextPath}/image?fname=${video.poster}" type="video/mp4">
                                    Trình duyệt của bạn không hỗ trợ phát thẻ video.
                                </video>
                            </div>
                            <div class="card-body p-4">
                                <h2 class="fw-bold fs-4 mb-2">${video.title}</h2>
                                <div class="text-muted small mb-3 pb-3 border-bottom d-flex gap-3 align-items-center">
                                    <span><i class="bi bi-eye-fill me-1 text-primary"></i><b>${video.views}</b> lượt xem</span>
                                    <span><i class="bi bi-person-fill me-1 text-success"></i>Đăng bởi: <b>${video.user != null ? video.user.fullName : 'Admin'}</b></span>
                                    <span><i class="bi bi-tag-fill me-1 text-secondary"></i>Mã video: <code>${video.videoId}</code></span>
                                </div>
                                <h5 class="fw-bold fs-6">Mô tả video:</h5>
                                <p class="text-secondary" style="white-space: pre-line;">
                                    ${not empty video.description ? video.description : 'Không có mô tả cho video này.'}
                                </p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger" role="alert">
                            <i class="bi bi-exclamation-octagon-fill me-2"></i>Không tìm thấy video yêu cầu!
                        </div>
                    </c:otherwise>
                </c:choose>
                <div>
                    <a href="javascript:history.back()" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-1"></i>Quay lại
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
