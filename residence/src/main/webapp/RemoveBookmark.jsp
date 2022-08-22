<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%
// 북마크를 데이터베이스에서 삭제한다.
// 없는 북마크 데이터를 삭제하려는 경우는 고려하지 않음

//JSON 데이터 받아옴
request.setCharacterEncoding("utf-8");
StringBuffer sb = new StringBuffer();
BufferedReader br = request.getReader();

String line = null;
while((line = br.readLine()) != null) {
	sb.append(line);
}
JSONParser parser = new JSONParser();
JSONObject obj = (JSONObject)parser.parse(sb.toString());

String userid = (String)session.getAttribute("G_uid");
String bjdCode = String.valueOf(obj.get("bjdCode"));
String kaptCode = (String)obj.get("kaptCode");
/*
String kaptName = (String)obj.get("kaptCode");
String kaptAddr = (String)obj.get("kaptCode");
String doroJuso = (String)obj.get("kaptCode");
String welfareFacility = (String)obj.get("kaptCode");
String kaptdWtimebus = (String)obj.get("kaptdWtimebus");
String subwayLine = (String)obj.get("subwayLine");
String subwayStation = (String)obj.get("subwayStation");
String kaptdWtimesub = (String)obj.get("kaptdWtimesub");
String convenientFacility = (String)obj.get("convenientFacility");
String educationFacility = (String)obj.get("educationFacility");
float lng = Float.parseFloat(String.valueOf(obj.get("lng")));
float lat = Float.parseFloat(String.valueOf(obj.get("lat")));
*/

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true");
PreparedStatement pstmt = conn.prepareStatement("delete from mark where userid=? and kaptCode=?");

pstmt.setString(1, userid);
pstmt.setString(2, kaptCode);

pstmt.executeUpdate();

pstmt.close();
conn.close();
%>