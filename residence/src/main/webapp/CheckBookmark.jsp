<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
// 해당 userid의 유저에게 address 주소가 북마크되어있는지 확인한다.
// 북마크되어있으면 true, 아니면 false를 반환한다.
request.setCharacterEncoding("utf-8");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234");
PreparedStatement pstmt = conn.prepareStatement("select * from mark where userid=? and address=?");

String userid = (String)session.getAttribute("G_uid");
String address = request.getParameter("address");
String aname = request.getParameter("title");

pstmt.setString(1, userid);
pstmt.setString(2, address);

ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
	out.print("true");
}
else
{
	out.print("false");
}
rs.close();
pstmt.close();
conn.close();
%>