<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Quản Lý Danh Mục</title>
</head>
<body>
    <div class="card shadow-sm border-0 rounded-3 p-4">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
            <h3 class="text-primary mb-0"><i class="bi bi-folder2-open me-2"></i>Danh Sách Danh Mục (Category)</h3>
            <a href="<c:url value='/admin/category/add'/>" class="btn btn-success">
                <i class="bi bi-plus-circle me-1"></i>Thêm Danh Mục Mới
            </a>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th style="width: 60px;">STT</th>
                        <th style="width: 140px;">Hình Ảnh</th>
                        <th>Tên Danh Mục</th>
                        <th style="width: 160px;" class="text-center">Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cateList}" var="cate" varStatus="STT">
                        <tr>
                            <td class="fw-bold">${STT.index + 1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty cate.icon}">
                                        <img src="<c:url value='/image?fname=${cate.icon}'/>" class="rounded shadow-sm" height="60" style="object-fit: cover;" alt="Icon"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary">No image</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="fw-semibold">${cate.catename}</td>
                            <td class="text-center">
                                <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>" class="btn btn-sm btn-outline-primary me-1">
                                    <i class="bi bi-pencil me-1"></i>Sửa
                                </a>
                                <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>" class="btn btn-sm btn-outline-danger" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?');">
                                    <i class="bi bi-trash me-1"></i>Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty cateList}">
                        <tr>
                            <td colspan="4" class="text-center text-muted py-4">Chưa có danh mục nào.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
