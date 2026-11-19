<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Đặt Lại Mật Khẩu</title>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm border-0 rounded-3 p-4">
                    <div class="text-center mb-4">
                        <i class="bi bi-shield-lock-fill display-4 text-info"></i>
                        <h3 class="mt-2 fw-bold">Đặt Lại Mật Khẩu</h3>
                        <p class="text-muted small">Nhập mã OTP đã nhận qua email và thiết lập mật khẩu mới</p>
                    </div>

                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>${alert}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/reset-password" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Email:</label>
                            <input type="email" name="email" class="form-control bg-light" value="${not empty email ? email : sessionScope.resetEmail}" required readonly/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Mã OTP (6 số): <span class="text-danger">*</span></label>
                            <input type="text" name="otp" class="form-control text-center fw-bold" placeholder="Nhập mã 6 số" required maxlength="6" pattern="^[0-9]{6}$"/>
                            <div class="invalid-feedback">Vui lòng nhập đúng 6 chữ số OTP.</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">Mật khẩu mới: <span class="text-danger">*</span></label>
                            <input type="password" name="newPassword" class="form-control" placeholder="Tối thiểu 6 ký tự" required minlength="6"/>
                            <div class="invalid-feedback">Mật khẩu mới tối thiểu 6 ký tự.</div>
                        </div>

                        <button type="submit" class="btn btn-info w-100 py-2 mb-3 text-white fw-bold">
                            <i class="bi bi-check-circle me-1"></i>Đổi Mật Khẩu
                        </button>
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
