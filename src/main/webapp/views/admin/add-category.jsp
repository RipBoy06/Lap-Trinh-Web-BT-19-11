<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Thêm Danh Mục Mới</title>
</head>
<body>
    <div class="card shadow-sm border-0 rounded-3 p-4">
        <h3 class="mb-4 text-primary border-bottom pb-2">
            <i class="bi bi-folder-plus me-2"></i>Thêm Danh Mục Mới (Insert Category)
        </h3>

        <form action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <div class="mb-3">
                <label class="form-label fw-bold">Tên Danh Mục: <span class="text-danger">*</span></label>
                <input type="text" name="catename" class="form-control" placeholder="Nhập tên danh mục..." required minlength="2"/>
                <div class="invalid-feedback">Tên danh mục không được để trống (tối thiểu 2 ký tự).</div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold">Biểu Tượng / Hình Ảnh (Icon):</label>
                <input type="file" name="icon" class="form-control" accept="image/*"/>
                <div class="form-text">Chọn file hình ảnh (.jpg, .png, .webp).</div>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-success px-4">
                    <i class="bi bi-save me-1"></i>Lưu Danh Mục
                </button>
                <a href="<c:url value='/admin/category/list'/>" class="btn btn-outline-secondary">
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
