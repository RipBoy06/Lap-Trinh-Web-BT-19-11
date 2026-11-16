<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi Tiết Video - ${video.title}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background-color: #f8f9fa; }
        .container { max-width: 900px; margin: 20px auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .player-box { width: 100%; height: 450px; background: #000; display: flex; align-items: center; justify-content: center; border-radius: 6px; overflow: hidden; margin-bottom: 20px; }
        .player-box video { width: 100%; height: 100%; }
        .video-header { border-bottom: 1px solid #eee; padding-bottom: 15px; margin-bottom: 15px; }
        .video-header h1 { font-size: 24px; margin: 0 0 10px; color: #222; }
        .video-stats { color: #666; font-size: 14px; }
        .video-desc { line-height: 1.6; color: #444; }
    </style>
</head>
<body>
    <jsp:include page="/views/topbar.jsp" />
    <div class="container">
        <c:choose>
            <c:when test="${not empty video}">
                <div class="player-box">
                    <!-- Play video: hỗ trợ file video hoặc hiển thị poster cùng player controls -->
                    <video controls autoplay poster="${pageContext.request.contextPath}/image?fname=${video.poster}">
                        <source src="${pageContext.request.contextPath}/image?fname=${video.poster}" type="video/mp4">
                        Trình duyệt của bạn không hỗ trợ thẻ video.
                    </video>
                </div>
                <div class="video-header">
                    <h1>${video.title}</h1>
                    <div class="video-stats">
                        <span>👁 Lượt xem: <b>${video.views}</b></span> | 
                        <span>Mã video: <b>${video.videoId}</b></span> | 
                        <span>Người đăng: <b>${video.user != null ? video.user.fullName : 'Admin'}</b></span>
                    </div>
                </div>
                <div class="video-desc">
                    <h3>Mô tả video:</h3>
                    <p>${not empty video.description ? video.description : 'Không có mô tả cho video này.'}</p>
                </div>
            </c:when>
            <c:otherwise>
                <h3>Không tìm thấy video yêu cầu!</h3>
            </c:otherwise>
        </c:choose>
        <p style="margin-top: 20px;"><a href="javascript:history.back()">« Quay lại</a></p>
    </div>
</body>
</html>
