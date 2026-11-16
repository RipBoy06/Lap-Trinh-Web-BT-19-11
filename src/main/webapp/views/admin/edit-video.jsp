<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cập Nhật Video</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div style="max-width: 550px; margin: 20px auto; font-family: Arial, sans-serif;">
        <h2>Chỉnh Sửa Video</h2>
        <form action="<c:url value='/admin/video/edit'/>" method="post" enctype="multipart/form-data">
            <div>
                <label>Mã Video (ID):</label><br/>
                <input type="text" name="videoId" value="${video.videoId}" readonly style="width: 100%; padding: 8px; background: #eee;"/>
            </div>
            <br/>
            <div>
                <label>Tiêu đề Video:</label><br/>
                <input type="text" name="title" value="${video.title}" required style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Hình ảnh hiện tại:</label><br/>
                <c:if test="${not empty video.poster}">
                    <img height="100" width="150" src="<c:url value='/image?fname=${video.poster}'/>" style="object-fit: cover; margin-bottom: 5px;"/>
                </c:if>
                <br/>
                <label>Thay đổi Poster (chọn file mới nếu muốn đổi):</label><br/>
                <input type="file" name="poster" accept="image/*" style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Mô tả video:</label><br/>
                <textarea name="description" rows="4" style="width: 100%; padding: 8px;">${video.description}</textarea>
            </div>
            <br/>
            <div>
                <input type="checkbox" name="active" value="1" ${video.active ? 'checked' : ''} /> Kích hoạt hiển thị
            </div>
            <br/>
            <button type="submit" style="padding: 10px 20px; background: #007bff; color: white; border: none; cursor: pointer;">Cập Nhật Video</button>
            <a href="<c:url value='/admin/video/list'/>" style="margin-left: 15px;">Hủy bỏ</a>
        </form>
    </div>
</body>
</html>
