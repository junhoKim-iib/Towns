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
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
 <P align="center"><h4>ID CHECK</h4></P>
   <form name="form1" action="id_ch.jsp"method="post">
    <input type="text" style="width:300px; height:35px;" name="id"  size="20" value="<%=id %>"></td>
      <input type="button" class="btn btn-outline-success" value="검색" onClick="id_search()">
   </form>
<%
   if(id !=""&&fnd==false)
   {
%>
</br>
   <h6>사용 가능한  ID입니다.<P>
   확인을 누르시면 회원등록 화면으로 돌아갑니다.</h6>
   <input type="button" value="확인" class="btn btn-outline-success"onClick="id_ok('<%=id %>')"></a>
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