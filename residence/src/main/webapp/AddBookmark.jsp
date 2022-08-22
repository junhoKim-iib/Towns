<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%
// 북마크하려는 주소를 데이터베이스에 추가한다.
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
String kaptName = (String)obj.get("kaptName");
String kaptAddr = (String)obj.get("kaptAddr");
String doroJuso = (String)obj.get("doroJuso");
String welfareFacility = (String)obj.get("welfareFacility");
String kaptdWtimebus = (String)obj.get("kaptdWtimebus");
String subwayLine = (String)obj.get("subwayLine");
String subwayStation = (String)obj.get("subwayStation");
String kaptdWtimesub = (String)obj.get("kaptdWtimesub");
String convenientFacility = (String)obj.get("convenientFacility");
String educationFacility = (String)obj.get("educationFacility");
float lng = Float.parseFloat(String.valueOf(obj.get("lng")));
float lat = Float.parseFloat(String.valueOf(obj.get("lat")));
// new. 2022.11.17
String monthly_price = (String)obj.get("monthly_price");
String selling_price = (String)obj.get("selling_price");
String transaction_price = (String)obj.get("transaction_price");
String chartered_price = (String)obj.get("chartered_price");



Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true");
//PreparedStatement pstmt = conn.prepareStatement("insert into mark(userid , bjdCode, kaptCode, kaptName, kaptAddr, doroJuso, welfareFacility, kaptdWtimebus, subwayLine, subwayStation, kaptdWtimesub, convenientFacility, educationFacility, lng, lat) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
PreparedStatement pstmt = conn.prepareStatement("insert into mark(userid , bjdCode, kaptCode, kaptName, kaptAddr, doroJuso, welfareFacility, kaptdWtimebus, subwayLine, subwayStation, kaptdWtimesub, convenientFacility, educationFacility, lng, lat, monthly_price, selling_price, transaction_price, chartered_price) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
pstmt.setString(1, userid);
pstmt.setString(2, bjdCode);
pstmt.setString(3, kaptCode);
pstmt.setString(4, kaptName);
pstmt.setString(5, kaptAddr);
pstmt.setString(6, doroJuso);
pstmt.setString(7, welfareFacility);
pstmt.setString(8, kaptdWtimebus);
pstmt.setString(9, subwayLine);
pstmt.setString(10, subwayStation);
pstmt.setString(11, kaptdWtimesub);
pstmt.setString(12, convenientFacility);
pstmt.setString(13, educationFacility);
pstmt.setFloat(14, lng);
pstmt.setFloat(15, lat);
pstmt.setString(16, monthly_price);
pstmt.setString(17, selling_price);
pstmt.setString(18, transaction_price);
pstmt.setString(19, chartered_price);

pstmt.executeUpdate();

pstmt.close();
conn.close();

%>