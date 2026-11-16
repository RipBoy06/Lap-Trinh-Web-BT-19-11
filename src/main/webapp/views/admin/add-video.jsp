<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Video Mới</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div style="max-width: 550px; margin: 20px auto; font-family: Arial, sans-serif;">
        <h2>+ Thêm Video Mới</h2>
        <!-- Form Multipart upload file poster theo hướng dẫn -->
        <form action="<c:url value='/admin/video/add'/>" method="post" enctype="multipart/form-data">
            <div>
                <label>Mã Video (ID):</label><br/>
                <input type="text" name="videoId" placeholder="vd: VID01" required style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Tiêu đề Video:</label><br/>
                <input type="text" name="title" placeholder="Nhập tiêu đề video" required style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Hình ảnh đại diện (Poster - Multipart):</label><br/>
                <input type="file" name="poster" accept="image/*" style="width: 100%; padding: 8px;"/>
            </div>
            <br/>
            <div>
                <label>Mô tả video:</label><br/>
                <textarea name="description" rows="4" style="width: 100%; padding: 8px;"></textarea>
            </div>
            <br/>
            <div>
                <input type="checkbox" name="active" value="1" checked /> Kích hoạt hiển thị
            </div>
            <br/>
            <button type="submit" style="padding: 10px 20px; background: #28a745; color: white; border: none; cursor: pointer;">Lưu Video</button>
            <a href="<c:url value='/admin/video/list'/>" style="margin-left: 15px;">Hủy bỏ</a>
        </form>
    </div>
</body>
</html>
