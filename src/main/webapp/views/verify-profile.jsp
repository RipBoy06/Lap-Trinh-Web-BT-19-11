<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Xác Thực Email Mới</title>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm border-0 rounded-3 p-4">
                    <div class="text-center mb-4">
                        <i class="bi bi-shield-check text-primary display-4"></i>
                        <h3 class="mt-2">Xác Thực Email Mới</h3>
                        <p class="text-muted small">
                            Mã OTP 6 số đã được gửi đến email mới của bạn: <br/>
                            <b class="text-primary">${sessionScope.pendingNewEmail}</b>
                        </p>
                    </div>

                    <c:if test="${not empty alertError}">
                        <div class="alert alert-danger" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>${alertError}
                        </div>
                    </c:if>

                    <c:if test="${not empty alertWarning}">
                        <div class="alert alert-warning" role="alert">
                            <i class="bi bi-info-circle-fill me-2"></i>${alertWarning}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/profile/verify-email" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Nhập mã OTP (6 số):</label>
                            <input type="text" name="otp" class="form-control form-control-lg text-center letter-spacing fw-bold" 
                                   placeholder="------" maxlength="6" pattern="^[0-9]{6}$" required autofocus/>
                            <div class="invalid-feedback">Vui lòng nhập đúng 6 chữ số OTP.</div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 mb-3">
                            <i class="bi bi-check2-circle me-1"></i>Xác Nhận Đổi Email
                        </button>

                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/profile" class="text-decoration-none text-secondary">
                                <i class="bi bi-x-circle me-1"></i>Hủy bỏ & Quay lại Profile
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
