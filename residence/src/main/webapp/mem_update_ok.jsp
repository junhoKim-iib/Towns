<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<%@page import="java.util.Calendar"%>
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";
Connection con=DriverManager.getConnection(url);
PreparedStatement pstmt=null;
String suserid =request.getParameter("userid");
String susernm =request.getParameter("usernm");
String spasswd =request.getParameter("passwd");
String sbirth =request.getParameter("birth");
String sjad =request.getParameter("jad");
String saddd =request.getParameter("addd");
String swos =request.getParameter("wos");
String spar =request.getParameter("par");
String sch =request.getParameter("ch");
String SQL="update members set ";
SQL=SQL+"usernm=?";
SQL=SQL+",birth=?";
SQL=SQL+",jad=?";
SQL=SQL+",addd=?";
SQL=SQL+",wos=?";
SQL=SQL+",par=?";
SQL=SQL+",ch=?";
SQL=SQL+" where userid=? and passwd=?";
pstmt=con.prepareStatement(SQL);
pstmt.setString(1,susernm);
pstmt.setString(2,sbirth);
pstmt.setString(3,sjad);
pstmt.setString(4,saddd);
pstmt.setString(5,swos);
pstmt.setString(6,spar);
pstmt.setString(7,sch);
pstmt.setString(8,suserid);
pstmt.setString(9,spasswd);
//System.out.println(pstmt);
int cnt=pstmt.executeUpdate();
pstmt.close();
con.close();
if(cnt>0)
{
	out.print("변경이 완료되었습니다.");
	String year = sbirth.split("-")[0];
	int birth = Integer.parseInt(year);
   	int thisYear = Calendar.getInstance().get(Calendar.YEAR);
	int age = thisYear - birth+1;
	//System.out.println(age);
   	session.setAttribute("G_birth", age);
   	session.setAttribute("G_wos", Integer.parseInt(swos));
   	session.setAttribute("G_par", Integer.parseInt(spar));
   	session.setAttribute("G_ch", Integer.parseInt(sch));
	response.sendRedirect("start.jsp");
}
else
{
	out.print("변경을 하지 못 하였습니다.");
	response.sendRedirect("mem_update.jsp");
}

%>