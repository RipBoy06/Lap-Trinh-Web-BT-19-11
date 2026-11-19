<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Hồ Sơ Cá Nhân</title>
    <style>
        .profile-card { border: none; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); background: #fff; }
        .profile-avatar-lg { width: 140px; height: 140px; border-radius: 50%; object-fit: cover; border: 4px solid #e9ecef; }
    </style>
</head>
<body>
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="profile-card p-4">
                    <h3 class="mb-4 text-primary border-bottom pb-2">
                        <i class="bi bi-person-lines-fill me-2"></i>Hồ Sơ Cá Nhân & Cập Nhật
                    </h3>

                    <c:if test="${not empty alertSuccess}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle-fill me-2"></i>${alertSuccess}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <c:if test="${not empty alertError}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>${alertError}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                        <div class="row align-items-center mb-4">
                            <div class="col-md-4 text-center">
                                <c:choose>
                                    <c:when test="${not empty user.avatar && user.avatar.startsWith('http')}">
                                        <img src="${user.avatar}" class="profile-avatar-lg shadow-sm" alt="Avatar"/>
                                    </c:when>
                                    <c:when test="${not empty user.avatar}">
                                        <img src="${pageContext.request.contextPath}/image?fname=${user.avatar}" class="profile-avatar-lg shadow-sm" alt="Avatar"/>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="profile-avatar-lg bg-light d-flex align-items-center justify-content-center mx-auto shadow-sm">
                                            <i class="bi bi-person fs-1 text-secondary"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="mt-2 text-muted small">
                                    <c:if test="${not empty user.avatar && user.avatar.startsWith('http')}">
                                        <span class="badge bg-success"><i class="bi bi-cloud-check me-1"></i>Cloudinary</span>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label class="form-label fw-bold"><i class="bi bi-cloud-arrow-up me-1"></i>Thay đổi ảnh đại diện (Cloudinary Multipart):</label>
                                <input type="file" name="avatar" class="form-control" accept="image/*"/>
                                <div class="form-text">Hỗ trợ các định dạng JPG, PNG, WEBP (Tự động tải lên Cloudinary).</div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Tài khoản (Username):</label>
                            <input type="text" class="form-control bg-light" value="${user.userName}" readonly/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Họ và tên: <span class="text-danger">*</span></label>
                            <input type="text" name="fullname" class="form-control" value="${user.fullName}" required minlength="2"/>
                            <div class="invalid-feedback">Vui lòng nhập họ và tên (tối thiểu 2 ký tự).</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Email: <span class="text-danger">*</span></label>
                            <input type="email" name="email" class="form-control" value="${user.email}" required/>
                            <div class="invalid-feedback">Vui lòng nhập định dạng email hợp lệ.</div>
                            <div class="form-text text-primary">
                                <i class="bi bi-info-circle me-1"></i>Lưu ý: Nếu bạn đổi email mới, hệ thống sẽ gửi <b>mã OTP</b> tới email mới đó để xác nhận cập nhật.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Số điện thoại:</label>
                            <input type="tel" name="phone" class="form-control" value="${user.phone}" pattern="^0[0-9]{9}$" placeholder="0xxxxxxxxx"/>
                            <div class="invalid-feedback">Số điện thoại phải gồm 10 chữ số và bắt đầu bằng số 0.</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">Vai trò:</label>
                            <span class="badge ${user.roleid == 1 ? 'bg-danger' : 'bg-info'} fs-6">
                                ${user.roleid == 1 ? 'Quản trị viên (Admin)' : 'Thành viên (User)'}
                            </span>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-left me-1"></i>Quay Lại
                            </a>
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="bi bi-save me-1"></i>Cập Nhật Hồ Sơ
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 Client-Side Validation Script -->
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
