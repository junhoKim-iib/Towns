<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그아웃</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    <script>

        alert('로그아웃 하였습니다.');
        location.href='start.jsp';
    </script>

</body>
</html>