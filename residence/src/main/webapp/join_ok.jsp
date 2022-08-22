<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";
Connection con= DriverManager.getConnection(url); // DB연결
Statement stmt = con.createStatement(); // 쿼리문만들기
// 매개변수들 설정
String suserid =request.getParameter("userid");
String susernm =request.getParameter("usernm");
String spasswd =request.getParameter("passwd");
String sbirth =request.getParameter("birth");
String sjad =request.getParameter("jad");
String saddd =request.getParameter("addd");
String swos =request.getParameter("wos");
String spar =request.getParameter("par");
String sch =request.getParameter("ch");
/* System.out.println(suserid);
System.out.println(susernm);
System.out.println(spasswd);
System.out.println(sbirth);
System.out.println(sjad);
System.out.println(saddd);
System.out.println(swos); // 
System.out.println(sjad);
System.out.println(spar);// 
System.out.println(sch); // */
// 매개변수 넣을 쿼리문 String으로 만들기
String SQL="select count(*) cnt from members where userid = '" + suserid + "'";
// 만든 String으로 쿼리 실행하고 결과값 받기
ResultSet rs= stmt.executeQuery(SQL);

rs.next();
if(rs!=null){
	if(rs.getInt("cnt")>0){
		out.print("이 아이디는 이미 다른 사람이 사용하고 있으므로 사용할 수 없습니다.");
	}
	else {
		SQL="insert into members(userid, usernm, passwd,birth,jad,addd,wos,par,ch) values(";
		SQL=SQL+"'"+suserid +"',";
		SQL=SQL+"'"+susernm +"',";
		SQL=SQL+"'"+spasswd +"',";
		SQL=SQL+"'"+sbirth+"',";
		SQL=SQL+"'"+sjad +"',";
		SQL=SQL+"'"+saddd +"',";
		SQL=SQL+"'"+swos +"',";
		SQL=SQL+"'"+spar +"',";
		SQL=SQL+"'"+sch +"')";
		stmt.executeUpdate(SQL);
		stmt.close();
		con.close();
		out.println("가입이 완료 되었습니다.");
	   	response.sendRedirect("start.jsp");
	}
}
%>
