<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살기 좋은 동네 추천</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<script language=javascript>
function valid_check()
{
	if(document.frm1.userid.value=="")
		{alert("아이디를 입력하여 주시기 바랍니다.");
		document.frm1.userid.fous();
		return false;
		}
	if(document.frm1.passwd.value=="")
		{
		alert("비밀번호를 입력하여 주시기 바랍니다.");
		document.frm1.passwd.fous();
		return false;
		}
	document.frm1.submit();
	}</script>

<body>
<header>
		<div id="header_menu"><!-- 헤드 메뉴바 부분 -->
			<ul>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
		<h1 class="logo">
		</header>
		<center><a href="start.jsp"><img src="image/logo.PNG"></a></h1></center>
	<h3>로그인</h3>
<form name="frm1" action="login_ok.jsp" METHOD="post">
<table width="300" border="1" CellPadding="0" CellSpacing="0">
<tr>
<input type="text" size="15" maxlength="41" name="userid">
</tr>
<tr>
</br>
<input type="password" size="15" maxlength="41" name="passwd">
</tr>
<tr>
<td width="100%" align="center" colspan="2">
<input type="button" value="로그인" onclick="valid_check()">
</td>
</tr>
</table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>