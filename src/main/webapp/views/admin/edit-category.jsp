<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Cập Nhật Danh Mục</title>
</head>
<body>
    <div class="card shadow-sm border-0 rounded-3 p-4">
        <h3 class="mb-4 text-primary border-bottom pb-2">
            <i class="bi bi-pencil-square me-2"></i>Chỉnh Sửa Danh Mục (Edit Category)
        </h3>

        <form action="<c:url value='/admin/category/edit'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <input type="hidden" name="id" value="${category.id}"/>

            <div class="mb-3">
                <label class="form-label fw-bold">Tên Danh Mục: <span class="text-danger">*</span></label>
                <input type="text" name="catename" class="form-control" value="${category.catename}" required minlength="2"/>
                <div class="invalid-feedback">Tên danh mục không được để trống (tối thiểu 2 ký tự).</div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Hình Ảnh Hiện Tại:</label><br/>
                <c:if test="${not empty category.icon}">
                    <img src="${pageContext.request.contextPath}/image?fname=${category.icon}" class="rounded shadow-sm mb-2" height="100" alt="Icon"/>
                </c:if>
                <input type="file" name="icon" class="form-control" accept="image/*"/>
                <div class="form-text">Để trống nếu không muốn thay đổi hình ảnh.</div>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary px-4">
                    <i class="bi bi-check-circle me-1"></i>Cập Nhật
                </button>
                <a href="<c:url value='/admin/category/list'/>" class="btn btn-outline-secondary">
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
