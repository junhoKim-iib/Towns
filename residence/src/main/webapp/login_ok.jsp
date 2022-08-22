<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";
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
	session.setAttribute("G_MEMID",suserid);
	session.setAttribute("G_MEMNM",rs.getString(1));
	session.setMaxInactiveInterval(60*60);
	out.print(rs.getString(1)+"님의 로그인이 성공되었습니다.");
	response.sendRedirect("start.jsp");
}

else
out.print("로그인을 실패하였습니다.");
pstmt.close();
rs.close();
con.close();
%>