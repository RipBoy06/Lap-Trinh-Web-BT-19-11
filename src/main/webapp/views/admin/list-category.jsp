<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý danh mục</title>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <h2>Quản lý danh mục</h2>
    <p><a href="<c:url value='/admin/category/add'/>">+ Thêm danh mục mới</a></p>
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>STT</th>
                <th>Hình ảnh</th>
                <th>Tên danh mục</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${cateList}" var="cate" varStatus="STT">
                <tr class="odd gradeX">
                    <td>${STT.index + 1}</td>
                    <c:url value="/image?fname=${cate.icon}" var="imgUrl"></c:url>
                    <td><img height="150" width="200" src="${imgUrl}" /></td>
                    <td>${cate.catename}</td>
                    <td>
                        <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>" class="center">Sửa</a>
                        | <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>" class="center">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>