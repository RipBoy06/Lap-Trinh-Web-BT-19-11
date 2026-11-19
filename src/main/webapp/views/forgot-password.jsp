<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Quên Mật Khẩu</title>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm border-0 rounded-3 p-4">
                    <div class="text-center mb-4">
                        <i class="bi bi-key-fill display-4 text-warning"></i>
                        <h3 class="mt-2 fw-bold">Quên Mật Khẩu</h3>
                        <p class="text-muted small">Nhập địa chỉ email đăng ký để nhận mã OTP đặt lại mật khẩu</p>
                    </div>

                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>${alert}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/forgot-password" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Email đăng ký: <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                <input type="email" name="email" class="form-control" placeholder="name@example.com" required/>
                                <div class="invalid-feedback">Vui lòng nhập định dạng email hợp lệ.</div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-warning w-100 py-2 mb-3 text-dark fw-bold">
                            <i class="bi bi-send me-1"></i>Gửi Mã Xác Nhận OTP
                        </button>

                        <div class="text-center small text-muted">
                            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">
                                <i class="bi bi-arrow-left me-1"></i>Quay lại Đăng nhập
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
