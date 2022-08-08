<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<% 
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
boolean fnd = false;
if(id==null)
	id="";
else
{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234";
	Connection con=DriverManager.getConnection(url);
	ResultSet rs= null;
	Statement stmt=con.createStatement();
	String strSQL="select userid from members where userid='"+id+"'";
	rs=stmt.executeQuery(strSQL);
	if(rs.next())fnd=true;
	stmt.close();
	con.close();	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id check</title>
</head>
<script language="javaScript">
function id_search()
{
	if(document.form1.id.value=="")
		{
		alert("ID를 입력해주세요");
		document.form1.id.focus();
		}
	else
		{
		document.form1.submit();
		}
}
function id_ok(a)
{
	opener.document.frm1.userid.value=a;
	self.close();
	}
</script>
<body>
<center>
<br>
<P align="center">사용하고자 하는 ID를 검색 버튼을 누르세요</P>
<form name="form1" action="id_ch.jsp"method="post">
<table width="200">
<tr>
<td width="150">ID</td>
<td width="100"><input type="text" name="id" size="20"
value=<%=id %>></td>
<td width="40"><input type="button" value="검색" onClick="id_search()"></td>
</tr>
</table>
</form>
<%
if(id !=""&&fnd==false)
{
%>
사용 가능한  ID입니다.<P>
확인을 누르시면 회원등록 화면으로 돌아갑니다.
<input type="button" value="확인" onClick="id_ok('<%=id %>')"></a>
<!--<a href="id_ok('<%=id %>')"></a>확인  -->
<%
}
else if(id!=""&&fnd==true)
{
	%>
이미 사용 중인 ID입니다.
<%
}
%>
</center>
</body>
</html>