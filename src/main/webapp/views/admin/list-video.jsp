<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Videos</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <h2>Danh Sách Quản Lý Videos (CRUD)</h2>
    <p><a href="<c:url value='/admin/video/add'/>" style="padding: 8px 12px; background: #28a745; color: white; text-decoration: none; border-radius: 4px;">+ Thêm Video Mới</a></p>
    <table border="1" cellpadding="8" cellspacing="0" style="width: 100%; border-collapse: collapse;">
        <thead style="background: #eee;">
            <tr>
                <th>STT</th>
                <th>Poster</th>
                <th>Mã Video</th>
                <th>Tiêu đề</th>
                <th>Lượt xem</th>
                <th>Trạng thái</th>
                <th>Người đăng</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${videoList}" var="v" varStatus="STT">
                <tr>
                    <td>${STT.index + 1}</td>
                    <td>
                        <c:if test="${not empty v.poster}">
                            <img height="80" width="120" src="<c:url value='/image?fname=${v.poster}'/>" style="object-fit: cover; border-radius: 4px;" />
                        </c:if>
                    </td>
                    <td><b>${v.videoId}</b></td>
                    <td><a href="<c:url value='/video/detail?id=${v.videoId}'/>" target="_blank">${v.title}</a></td>
                    <td>${v.views}</td>
                    <td>${v.active ? 'Hoạt động' : 'Tạm ẩn'}</td>
                    <td>${v.user != null ? v.user.fullName : 'Admin'}</td>
                    <td>
                        <a href="<c:url value='/admin/video/edit?id=${v.videoId}'/>">Sửa</a> | 
                        <a href="<c:url value='/admin/video/delete?id=${v.videoId}'/>" onclick="return confirm('Bạn có chắc muốn xóa video này?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
