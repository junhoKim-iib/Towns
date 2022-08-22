<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
// 해당 userid의 유저에게 주소가 북마크되어있는지 확인한다.
// 북마크되어있으면 true, 아니면 false를 반환한다.

/* 데이터 예시
{
	'bjdCode': 4812725028,
	'kaptCode': 'A63085232',
	'kaptName': '마산삼계2',
	'kaptAddr': '경상남도 창원마산회원구 내서읍 삼계리 39 마산삼계2',
	'doroJuso': '경상남도 창원시 마산회원구 삼계2길 24',
	'welfareFacility': '관리사무소, 노인정, 어린이놀이터, 자전거보관소',
	'kaptdWtimebus': '5~10분이내',
	'subwayLine': nan,
	'subwayStation': nan,
	'kaptdWtimesub': nan,
	'convenientFacility': '병원(청아병원) 대형상가(롯데마트) 공원(내서근린공원)',
	'educationFacility': '초등학교(광려초등학교) 중학교(삼계중학교) 고등학교(내서여고)',
	'lng': 128.5032221,
	'lat': 35.2290864
 }
*/
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
String kaptCode = (String)obj.get("kaptCode");
String kaptName = (String)obj.get("kaptName");
//String writer = (String) request.getSession().getAttribute("email");
//obj.get("bid")를 바로 읽으면 Class Case Exception이 발생한다. 이는
//JS의 Number를 바로 int로 변경하려고 해서 그런 것이므로 String으로 변환 후 파싱해서 사용한다.
//int bid = Integer.parseInt(String.valueOf(obj.get("bid")));
	

// DB 조회
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";

Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true");
PreparedStatement pstmt = conn.prepareStatement("select * from mark where userid=? and kaptCode=?");

pstmt.setString(1, userid);
pstmt.setString(2, kaptCode);

ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
	out.print("true");
}
else
{
	out.print("false");
}

// 종료
rs.close();
pstmt.close();
conn.close();
%>