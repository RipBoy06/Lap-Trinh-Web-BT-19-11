<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm danh mục</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <h2>Thêm danh mục mới</h2>
    <form role="form" action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>Tên danh mục:</label>
            <input class="form-control" placeholder="Please enter category Name" name="catename" required />
        </div>
        <br/>
        <div class="form-group">
            <label>Ảnh đại diện:</label>
            <input type="file" name="icon" />
        </div>
        <br/>
        <button type="submit" class="btn btn-default">Thêm</button>
        <button type="reset" class="btn btn-primary">Hủy</button>
    </form>
</body>
</html>