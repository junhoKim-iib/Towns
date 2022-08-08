<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="org.json.simple.JSONObject" %>
<%
// 북마크 데이터를 조회한다.
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234");
PreparedStatement pstmt = conn.prepareStatement("select * from mark where userid=?");

String userid = (String)session.getAttribute("G_uid");

pstmt.setString(1, userid);

ResultSet rs = pstmt.executeQuery();
JSONArray arr = new JSONArray();
JSONObject result = new JSONObject();
while(rs.next())
{
	JSONObject obj = new JSONObject();
	obj.put("userid", rs.getString(1));
	obj.put("address", rs.getString(2));
	obj.put("aname", rs.getString(3));
	obj.put("coordX", rs.getFloat(4));
	obj.put("coordY", rs.getFloat(5));
	System.out.println(obj.toString());
	obj.clear();
}
result.put(
System.out.println(arr.toString());
out.print(arr.toString());
rs.close();
pstmt.close();
conn.close();
%>