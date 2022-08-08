<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%
// 북마크를 데이터베이스에서 삭제한다.
// 없는 북마크 데이터를 삭제하려는 경우는 고려하지 않음
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234");
PreparedStatement pstmt = conn.prepareStatement("delete from mark where userid=? and address=? and aname=?");

String userid = (String)session.getAttribute("G_uid");
String address = request.getParameter("address");
String aname = request.getParameter("title");

pstmt.setString(1, userid);
pstmt.setString(2, address);
pstmt.setString(3, aname);

pstmt.executeUpdate();

pstmt.close();
conn.close();
%>