<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Quản Lý Videos</title>
</head>
<body>
    <div class="card shadow-sm border-0 rounded-3 p-4">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
            <h3 class="text-primary mb-0"><i class="bi bi-camera-reels me-2"></i>Danh Sách Quản Lý Videos (CRUD)</h3>
            <a href="<c:url value='/admin/video/add'/>" class="btn btn-success">
                <i class="bi bi-plus-circle me-1"></i>Thêm Video Mới
            </a>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th style="width: 50px;">STT</th>
                        <th style="width: 120px;">Poster</th>
                        <th style="width: 100px;">Mã Video</th>
                        <th>Tiêu Đề</th>
                        <th style="width: 100px;">Lượt Xem</th>
                        <th style="width: 120px;">Trạng Thái</th>
                        <th style="width: 140px;">Người Đăng</th>
                        <th style="width: 150px;" class="text-center">Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${videoList}" var="v" varStatus="STT">
                        <tr>
                            <td class="fw-bold">${STT.index + 1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty v.poster}">
                                        <img src="<c:url value='/image?fname=${v.poster}'/>" class="rounded shadow-sm" height="60" width="90" style="object-fit: cover;" alt="Poster"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary">No poster</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><span class="badge bg-light text-dark border">${v.videoId}</span></td>
                            <td>
                                <a href="<c:url value='/video/detail?id=${v.videoId}'/>" class="text-decoration-none fw-semibold" target="_blank">
                                    ${v.title}
                                </a>
                            </td>
                            <td><i class="bi bi-eye me-1 text-muted"></i>${v.views}</td>
                            <td>
                                <span class="badge ${v.active ? 'bg-success' : 'bg-secondary'}">
                                    ${v.active ? 'Công khai' : 'Tạm ẩn'}
                                </span>
                            </td>
                            <td>${v.user != null ? v.user.fullName : 'Admin'}</td>
                            <td class="text-center">
                                <a href="<c:url value='/admin/video/edit?id=${v.videoId}'/>" class="btn btn-sm btn-outline-primary me-1">
                                    <i class="bi bi-pencil me-1"></i>Sửa
                                </a>
                                <a href="<c:url value='/admin/video/delete?id=${v.videoId}'/>" class="btn btn-sm btn-outline-danger" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa video này?');">
                                    <i class="bi bi-trash me-1"></i>Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty videoList}">
                        <tr>
                            <td colspan="8" class="text-center text-muted py-4">Chưa có video nào.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
