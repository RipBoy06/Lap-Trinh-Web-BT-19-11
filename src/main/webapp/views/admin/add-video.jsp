<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Thêm Video Mới</title>
</head>
<body>
    <div class="card shadow-sm border-0 rounded-3 p-4">
        <h3 class="mb-4 text-primary border-bottom pb-2">
            <i class="bi bi-camera-video me-2"></i>Thêm Video Mới (Insert Video)
        </h3>

        <form action="<c:url value='/admin/video/add'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <div class="mb-3">
                <label class="form-label fw-bold">Mã Video (ID): <span class="text-danger">*</span></label>
                <input type="text" name="videoId" class="form-control" placeholder="vd: VID001" required minlength="2" pattern="^[a-zA-Z0-9_-]+$"/>
                <div class="invalid-feedback">Vui lòng nhập mã video (chỉ gồm chữ, số, gạch ngang).</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Tiêu Đề Video: <span class="text-danger">*</span></label>
                <input type="text" name="title" class="form-control" placeholder="Nhập tiêu đề video..." required minlength="3"/>
                <div class="invalid-feedback">Tiêu đề video không được để trống (tối thiểu 3 ký tự).</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Hình Ảnh Đại Diện (Poster Thumbnail):</label>
                <input type="file" name="poster" class="form-control" accept="image/*"/>
                <div class="form-text">Tải lên file ảnh poster (.jpg, .png, .webp).</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Mô Tả Chi Tiết:</label>
                <textarea name="description" class="form-control" rows="4" placeholder="Nhập mô tả tóm tắt nội dung video..."></textarea>
            </div>

            <div class="mb-4 form-check form-switch">
                <input class="form-check-input" type="checkbox" name="active" value="1" id="activeVideo" checked>
                <label class="form-check-label fw-bold" for="activeVideo">Kích hoạt hiển thị công khai</label>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-success px-4">
                    <i class="bi bi-cloud-upload me-1"></i>Lưu Video
                </button>
                <a href="<c:url value='/admin/video/list'/>" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Quay lại danh sách
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
