<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Kích Hoạt Tài Khoản Bằng OTP</title>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm border-0 rounded-3 p-4">
                    <div class="text-center mb-4">
                        <i class="bi bi-envelope-check-fill display-4 text-primary"></i>
                        <h3 class="mt-2 fw-bold">Kích Hoạt Tài Khoản</h3>
                        <p class="text-muted small">
                            Mã OTP 6 số đã được gửi đến email của bạn.<br/>
                            Vui lòng kiểm tra hộp thư (inbox hoặc thư rác/spam).
                        </p>
                    </div>

                    <c:if test="${not empty alert}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <i class="bi bi-info-circle-fill me-2"></i>${alert}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/verify" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Email kích hoạt: <span class="text-danger">*</span></label>
                            <input type="email" name="email" class="form-control" value="${not empty email ? email : sessionScope.verifyEmail}" required/>
                            <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">Mã OTP xác thực (6 số): <span class="text-danger">*</span></label>
                            <input type="text" name="otp" class="form-control form-control-lg text-center fw-bold letter-spacing" 
                                   placeholder="------" maxlength="6" pattern="^[0-9]{6}$" required autofocus/>
                            <div class="invalid-feedback">Vui lòng nhập đúng 6 chữ số OTP.</div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 mb-3">
                            <i class="bi bi-patch-check-fill me-1"></i>Kích Hoạt Tài Khoản
                        </button>

                        <div class="text-center small text-muted">
                            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">
                                <i class="bi bi-arrow-left me-1"></i>Quay lại trang Đăng nhập
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
