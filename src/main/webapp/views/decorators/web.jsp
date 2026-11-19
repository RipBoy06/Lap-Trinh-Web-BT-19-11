<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> - HCMUTE WebApp</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { min-height: 100vh; display: flex; flex-direction: column; background-color: #f8f9fa; }
        .main-content { flex: 1; padding: 25px 0; }
        .navbar-brand { font-weight: 700; color: #0d6efd !important; }
        .footer { background: #212529; color: #adb5bd; padding: 20px 0; margin-top: auto; }
        .avatar-nav { width: 32px; height: 32px; border-radius: 50%; object-fit: cover; margin-right: 6px; }
    </style>
    <sitemesh:write property='head'/>
</head>
<body>
    <!-- HEADER & NAVBAR BOOTSTRAP -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
        <div class="container">
            <a class="navbar-brand text-primary" href="${pageContext.request.contextPath}/home">
                <i class="bi bi-play-circle-fill text-danger me-1"></i> HCMUTE Media
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="bi bi-house-door me-1"></i>Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/video"><i class="bi bi-collection-play me-1"></i>Videos Của Tôi</a>
                    </li>
                    <c:if test="${sessionScope.account != null && sessionScope.account.roleid == 1}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-warning" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="bi bi-gear-fill me-1"></i>Quản Trị (Admin)
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/video/list"><i class="bi bi-camera-video me-1"></i>Quản Lý Video</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/list"><i class="bi bi-folder me-1"></i>Quản Lý Category</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
                <ul class="navbar-nav ms-auto align-items-center">
                    <c:choose>
                        <c:when test="${sessionScope.account == null}">
                            <li class="nav-item">
                                <a class="btn btn-outline-light btn-sm me-2" href="${pageContext.request.contextPath}/login">
                                    <i class="bi bi-box-arrow-in-right me-1"></i>Đăng nhập
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/register">
                                    <i class="bi bi-person-plus me-1"></i>Đăng ký
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle d-flex align-items-center text-white" href="#" role="button" data-bs-toggle="dropdown">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.account.avatar && sessionScope.account.avatar.startsWith('http')}">
                                            <img src="${sessionScope.account.avatar}" class="avatar-nav" alt="Avatar"/>
                                        </c:when>
                                        <c:when test="${not empty sessionScope.account.avatar}">
                                            <img src="${pageContext.request.contextPath}/image?fname=${sessionScope.account.avatar}" class="avatar-nav" alt="Avatar"/>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="bi bi-person-circle fs-5 me-1 text-info"></i>
                                        </c:otherwise>
                                    </c:choose>
                                    <span>${sessionScope.account.fullName}</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end shadow">
                                    <li>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
                                            <i class="bi bi-person-badge me-2"></i>Hồ Sơ Cá Nhân
                                        </a>
                                    </li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li>
                                        <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
                                            <i class="bi bi-box-arrow-right me-2"></i>Đăng Xuất
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- MAIN BODY DECORATED BY SITEMESH -->
    <main class="main-content">
        <sitemesh:write property='body'/>
    </main>

    <!-- FOOTER BOOTSTRAP -->
    <footer class="footer">
        <div class="container text-center">
            <p class="mb-1">© 2026 HCMUTE - Bộ Môn Lập Trình Web (Sitemesh 3 & Bootstrap 5)</p>
            <small class="text-secondary">Sinh viên: Nguyễn Hoài Hảo - MSSV: 22110... | Giảng viên hướng dẫn: IoTStar</small>
        </div>
    </footer>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
