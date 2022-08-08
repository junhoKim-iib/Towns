<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%
// 북마크하려는 주소를 데이터베이스에 추가한다.
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234");
PreparedStatement pstmt = conn.prepareStatement("insert into mark(userid, address, aname, coordX, coordY) values (?, ?, ?, ?, ?)");

String userid = (String)session.getAttribute("G_uid");
String address = request.getParameter("address");
String aname = request.getParameter("title");
float coordX = Float.parseFloat(request.getParameter("coordX"));
float coordY = Float.parseFloat(request.getParameter("coordY"));

pstmt.setString(1, userid);
pstmt.setString(2, address);
pstmt.setString(3, aname);
pstmt.setFloat(4, coordX);
pstmt.setFloat(5, coordY);

pstmt.executeUpdate();

pstmt.close();
conn.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>