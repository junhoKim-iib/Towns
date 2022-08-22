<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%request.setCharacterEncoding("utf-8");%>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";
Connection con=DriverManager.getConnection(url);
PreparedStatement pstmt=null;
ResultSet rs=null;
String suserid=request.getParameter("userid");
String spasswd=request.getParameter("passwd");
//System.out.println(suserid);
//System.out.println(spasswd);
String SQL="select usernm, birth, wos, par, ch from members where userid=? and passwd=?";
pstmt=con.prepareStatement(SQL);
pstmt.setString(1,suserid);
pstmt.setString(2,spasswd);
rs=pstmt.executeQuery();
if(rs.next()==true){
	session.setAttribute("G_uid", suserid);
   	session.setAttribute("G_name", rs.getString("usernm"));
   	
   	Date birth = rs.getDate("birth");
   	int thisYear = Calendar.getInstance().get(Calendar.YEAR);
	int age = thisYear - birth.getYear() - 1899;
	//System.out.println(age);
   	session.setAttribute("G_birth", age);
   	session.setAttribute("G_wos", rs.getInt("wos"));
   	session.setAttribute("G_par", rs.getInt("par"));
   	session.setAttribute("G_ch", rs.getInt("ch"));
   	
   	session.setMaxInactiveInterval(60*60); //10분 세션 유지
   	//System.out.println(rs.getString("usernm")+"님 로그인 성공!");  
   	response.sendRedirect("start.jsp");
}
else {
   out.println("");%> 
   <script language="javascript">
   alert("로그인 실패!");
   location.href = 'start.jsp';
   </script> 
   response.sendRedirect("start.jsp");
<% 
}
pstmt.close();
rs.close();
con.close();
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