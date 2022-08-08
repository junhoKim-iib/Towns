<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234";
Connection con=DriverManager.getConnection(url);
PreparedStatement pstmt=null;
ResultSet rs=null;
String suserid=request.getParameter("userid");
String spasswd=request.getParameter("passwd");
String SQL="select usernm from members where userid=? and passwd=?";
pstmt=con.prepareStatement(SQL);
pstmt.setString(1,suserid);
pstmt.setString(2,spasswd);
rs=pstmt.executeQuery();
if(rs.next()==true){
	session.setAttribute("G_uid", suserid);
   	session.setAttribute("G_name",rs.getString("usernm"));
   	session.setMaxInactiveInterval(60*60); //10분 세션 유지
   	System.out.println(rs.getString("usernm")+"님 로그인 성공!");  
   	response.sendRedirect("start.jsp");
}
else {
   out.println("");%> 
   <script language="javascript">
   alert("로그인 실패!");
   location.href = 'main.jsp';
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