<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> - Trang Quản Trị Admin</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { min-height: 100vh; display: flex; flex-direction: column; background-color: #f4f6f9; }
        .admin-sidebar { min-height: calc(100vh - 56px); background: #343a40; color: #fff; }
        .admin-sidebar a { color: #c2c7d0; text-decoration: none; padding: 10px 15px; display: block; border-radius: 4px; margin-bottom: 5px; }
        .admin-sidebar a:hover, .admin-sidebar a.active { background: #495057; color: #fff; }
        .content-wrapper { flex: 1; padding: 25px; }
    </style>
    <sitemesh:write property='head'/>
</head>
<body>
    <nav class="navbar navbar-dark bg-dark px-3">
        <a class="navbar-brand text-warning" href="${pageContext.request.contextPath}/admin/video/list">
            <i class="bi bi-shield-lock-fill me-1"></i> BẢNG ĐIỀU KHIỂN ADMIN
        </a>
        <div class="d-flex align-items-center">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-info btn-sm me-3">
                <i class="bi bi-box-arrow-up-right me-1"></i> Về Trang Chủ
            </a>
            <span class="text-white me-3">Admin: <b>${sessionScope.account.fullName}</b></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">Đăng Xuất</a>
        </div>
    </nav>

    <div class="container-fluid flex-grow-1">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 admin-sidebar p-3">
                <h6 class="text-uppercase text-secondary px-2 mb-3">Quản Lý Dữ Liệu</h6>
                <a href="${pageContext.request.contextPath}/admin/video/list"><i class="bi bi-camera-video me-2"></i>Quản lý Videos</a>
                <a href="${pageContext.request.contextPath}/admin/video/add"><i class="bi bi-plus-circle me-2"></i>Thêm Video Mới</a>
                <hr class="text-secondary"/>
                <a href="${pageContext.request.contextPath}/admin/category/list"><i class="bi bi-folder me-2"></i>Quản lý Categories</a>
                <a href="${pageContext.request.contextPath}/admin/category/add"><i class="bi bi-folder-plus me-2"></i>Thêm Category</a>
                <hr class="text-secondary"/>
                <a href="${pageContext.request.contextPath}/profile"><i class="bi bi-person-badge me-2"></i>Hồ sơ cá nhân</a>
            </div>

            <!-- Main Admin Content -->
            <div class="col-md-10 content-wrapper">
                <sitemesh:write property='body'/>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
