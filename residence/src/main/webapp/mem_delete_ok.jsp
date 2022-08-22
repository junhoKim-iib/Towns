<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <!DOCTYPE html>
<html>
<head>
    <title>회원 탈퇴</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String userid = request.getParameter("userid");
String usernm = request.getParameter("usernm");
String passwd = request.getParameter("passwd");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";
Connection con=DriverManager.getConnection(url);
PreparedStatement pstmt=null;
ResultSet rs = null;
 
String sql = "";
try 
{
   // 3단계 : id에 해당하는 passwd를 가져오는 sql(sql 생성)
	sql = "delete from members where userid=? and usernm=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, usernm);
	int result = pstmt.executeUpdate();
	if(result >= 1)
	{
		out.print("true");
		session.invalidate(); 
	}
	else 
		out.print("false");
}
catch (Exception e) 
{
	out.println("회원 탈퇴 오류");
	e.printStackTrace();
	out.print("false");
}
finally
{
	if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	if(con!=null)try{con.close();}catch(SQLException ex){}
}

    %>
    <!--  
    <script>

        alert('회원 탈퇴되었습니다.');
        location.href='start.jsp';
    </script>
    -->
    </body>
</html>