<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="org.json.simple.JSONObject" %>
<%
// 북마크 데이터를 조회한다.
request.setCharacterEncoding("utf-8");
String userid = (String)session.getAttribute("G_uid");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true");
PreparedStatement pstmt = conn.prepareStatement("select * from mark where userid=?");

pstmt.setString(1, userid);

ResultSet rs = pstmt.executeQuery();
JSONArray result = new JSONArray();
while(rs.next())
{
	JSONObject obj = new JSONObject();
	obj.put("userid", rs.getString(1));
	obj.put("bjdCode", rs.getString(2));
	obj.put("kaptCode", rs.getString(3));
	obj.put("kaptName", rs.getString(4));
	obj.put("kaptAddr", rs.getString(5));
	obj.put("doroJuso", rs.getString(6));
	obj.put("welfareFacility", rs.getString(7));
	obj.put("kaptdWtimebus", rs.getString(8));
	obj.put("subwayLine", rs.getString(9));
	obj.put("subwayStation", rs.getString(10));
	obj.put("kaptdWtimesub", rs.getString(11));
	obj.put("convenientFacility", rs.getString(12));
	obj.put("educationFacility", rs.getString(13));
	obj.put("lng", rs.getFloat(14));
	obj.put("lat", rs.getFloat(15));
	obj.put("selling_price", rs.getString(16));
	obj.put("chartered_price", rs.getString(17));
	obj.put("monthly_price", rs.getString(18));
	obj.put("transaction_price", rs.getString(19));
	//System.out.println(obj);
	result.add(obj);
}
out.clear();
out.print(result);
rs.close();
pstmt.close();
conn.close();
%>