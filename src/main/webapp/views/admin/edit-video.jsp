<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Chỉnh Sửa Video</title>
</head>
<body>
    <div class="card shadow-sm border-0 rounded-3 p-4">
        <h3 class="mb-4 text-primary border-bottom pb-2">
            <i class="bi bi-pencil-square me-2"></i>Chỉnh Sửa Video (Edit Video)
        </h3>

        <form action="<c:url value='/admin/video/edit'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <div class="mb-3">
                <label class="form-label fw-bold">Mã Video (ID):</label>
                <input type="text" name="videoId" class="form-control bg-light" value="${video.videoId}" readonly/>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Tiêu Đề Video: <span class="text-danger">*</span></label>
                <input type="text" name="title" class="form-control" value="${video.title}" required minlength="3"/>
                <div class="invalid-feedback">Tiêu đề video không được để trống (tối thiểu 3 ký tự).</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Poster Hiện Tại:</label><br/>
                <c:if test="${not empty video.poster}">
                    <img src="${pageContext.request.contextPath}/image?fname=${video.poster}" class="rounded shadow-sm mb-2" height="120" alt="Poster"/>
                </c:if>
                <input type="file" name="poster" class="form-control" accept="image/*"/>
                <div class="form-text">Để trống nếu không muốn thay đổi ảnh poster.</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Mô Tả Chi Tiết:</label>
                <textarea name="description" class="form-control" rows="4">${video.description}</textarea>
            </div>

            <div class="mb-4 form-check form-switch">
                <input class="form-check-input" type="checkbox" name="active" value="1" id="activeVideo" ${video.active ? 'checked' : ''}>
                <label class="form-check-label fw-bold" for="activeVideo">Kích hoạt hiển thị công khai</label>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary px-4">
                    <i class="bi bi-check-circle me-1"></i>Cập Nhật Video
                </button>
                <a href="<c:url value='/admin/video/list'/>" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Hủy Bỏ
                </a>
            </div>
        </form>
    </div>

    <script>
        (function () {
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
