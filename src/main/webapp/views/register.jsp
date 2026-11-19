<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Đăng Ký Tài Khoản Mới</title>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6">
                <div class="card shadow-sm border-0 rounded-3 p-4">
                    <div class="text-center mb-4">
                        <i class="bi bi-person-plus-fill display-4 text-success"></i>
                        <h3 class="mt-2 fw-bold">Tạo Tài Khoản Mới</h3>
                        <p class="text-muted small">Điền thông tin bên dưới để đăng ký tài khoản (kích hoạt bằng OTP)</p>
                    </div>

                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>${alert}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tài khoản (Username): <span class="text-danger">*</span></label>
                            <input type="text" name="username" class="form-control" placeholder="Tên tài khoản (tối thiểu 3 ký tự)" 
                                   required minlength="3" pattern="^[a-zA-Z0-9_]+$"/>
                            <div class="invalid-feedback">Tài khoản từ 3 ký tự trở lên, chỉ gồm chữ, số và dấu gạch dưới.</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Họ và tên: <span class="text-danger">*</span></label>
                            <input type="text" name="fullname" class="form-control" placeholder="Họ và tên của bạn" required minlength="2"/>
                            <div class="invalid-feedback">Vui lòng nhập họ và tên.</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Email (Nhận OTP): <span class="text-danger">*</span></label>
                            <input type="email" name="email" class="form-control" placeholder="name@example.com" required/>
                            <div class="invalid-feedback">Vui lòng nhập email hợp lệ để nhận mã xác nhận OTP.</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Số điện thoại:</label>
                            <input type="tel" name="phone" class="form-control" placeholder="0xxxxxxxxx (10 số)" pattern="^0[0-9]{9}$"/>
                            <div class="invalid-feedback">Số điện thoại phải gồm 10 chữ số bắt đầu bằng số 0.</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">Mật khẩu: <span class="text-danger">*</span></label>
                            <input type="password" name="password" class="form-control" placeholder="Tối thiểu 6 ký tự" required minlength="6"/>
                            <div class="invalid-feedback">Mật khẩu phải có tối thiểu 6 ký tự.</div>
                        </div>

                        <button type="submit" class="btn btn-success w-100 py-2 mb-3">
                            <i class="bi bi-shield-lock me-1"></i>Đăng Ký & Nhận Mã OTP
                        </button>

                        <div class="text-center small text-muted">
                            Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="text-decoration-none fw-bold">Đăng nhập</a>
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
