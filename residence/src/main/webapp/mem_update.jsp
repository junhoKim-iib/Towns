 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="utf-8">
<title>Sweet Home - 회원정보변경</title>
</head>
<style>
@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h1 {
       font-family: 'Cafe24Ssurround';
       color: #365f37;
    }
@charset "EUC-KR";
body{
    background-color: white;
}
select{
    width:85px;
    height:25px;
    outline: none;
    background: #f5f6f7;
    border: 1px solid #999;
}
a{
    color: black;
    text-decoration: none;
}
.main{
    text-align: center;
	margin-top: 20px;
}
input{
    cursor: pointer
}

/*언어설정*/
.select-lang{
    text-align: right;
    padding-right: 10px;
}
/*로고설정*/
.image{
    height: 32px;
    padding: 20px;
}
/*input 아이디박스*/
.login-id-wrap{

    margin: 0px 10px 8px 10px;
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
}
/*input 아이디 form*/
#input-id{
    border: none;
    outline:none;
    width:100%;
}
/*input 패스워드박스*/
.login-pw-wrap{

    margin: 0px 10px 8px 10px;
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
}
/*input 패스워드 form*/
#input-pw{
    border: none;
    outline:none;
    width:100%;
}
/*로그인버튼박스*/
.login-btn-wrap{
    height: 60px;
    line-height: 55px;
    margin: 0px 10px 8px 10px;
    border: solid 1px rgba(0,0,0,.1);
    background-color: #365f37;
    color: #fff;
    cursor: pointer;
}
/*로그인버튼*/
#login-btn{
    width:100px;
    background-color: #365f37;
    border: none;
    color:#fff;
    font-size: 18px;
    outline:none;
    cursor: pointer;
}
/*로그인 아래 박스*/
.under-login{
    height: 50px;
    border-bottom: 1px solid gainsboro;
    margin: 0px 10px 35px 10px;
}
/*로그인상태유지*/
.stay-check{
    margin-left: 7px;
    float: left;
}
/*로그인상태유지 체크박스*/
.stay-check input[type="checkbox"] {
    /*기존 체크박스 숨기기*/
    position: absolute;
    width: 0px;
    position: absolute;
}
.stay-check input[type="checkbox"] + label {
    display: inline-block;
    position: relative;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    }
.stay-check input[type="checkbox"] + label::before {
    content: ' ';
    display: inline-block;
    width: 22px;
    height: 22px;
    line-height: 18px;
    margin: -2px 8px 0 0;
    text-align: center;
    vertical-align: middle;
    background: #fafafa;
    border: 1px solid #cacece;
    border-radius: 50%;
    box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.stay-check input[type="checkbox"]:checked + label::before {
    content: '\2713';
    color: white;
    text-shadow: 1px 1px white;
    background:#365f37;
    border-color:#365f37;
    box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
/*IP보안 표시X*/
#ip-check{
    display: none;
}
/*IP보안 ON/OFF*/
#ip-context{
    color:rgb(160, 160, 160);
    font-weight: 900;
    display: inline-block;
    width: 22px;
}
/*간편한 로그인 구역*/
#easy-login-wrap{
    height: 90px;
    margin: 0px 10px 35px 10px;
}
/*간편한 로그인 텍스트*/
.easy-login{
    font-size: 20px;
    font-weight: 500;
}
/*QR & 일회용 로그인 박스 구역*/
.easy-login-box{
    display: grid;
    grid-template-columns: 1fr 1fr;
}
/*QR코드 로그인*/
.qr-login{
    float: left;
    border: 1px solid #365f37;
    background-color: #fff;
    margin: 0px 4px 0px 0px;
    line-height: 55px;
}
/*일회용 번호 로그인*/
.onetime-login{
    float: right;
    border: 1px solid #365f37;
    background-color: #fff;
    margin: 0px 0px 0px 4px;
    line-height: 55px;
}
/*더욱 간편한 로그인-en모드*/
.qr-login-en, .facebook-login, .line-login{
    font-family: Helvetica,Dotum,sans-serif;
    font-size: 18px;
    font-weight: 400;
    text-align: left;
    line-height: 55px;
    border: solid 1px #dadada;
    background: #fff;
    margin-bottom: 10px;
}
/*더욱 간편한 로그인 이미지-en모드*/
.easy-login-box-en img{
    display: inline-block;
    vertical-align: middle;
    margin: 0 10px 0 10px;
}
/*찾기 및 회원가입*/
.find-signup-wrap{
    height: 100px;
    grid-template-columns: 1fr 1fr 1fr;
}
/*찾기 및 회원가입 글자 희미하게 바꾸기*/
.find-signup-wrap a{
    color: rgb(150, 150, 150);
    text-decoration: none;
    font-weight: 500;
}
.find-signup-wrap span{
    color: rgb(150, 150, 150);
    font-weight: 500;
}
/*아이디 찾기*/
.find-id{
    margin: 3px;
    font-size: 14px;
    border-right: 1px solid gainsboro;
}
/*아이디 찾기-en모드*/
.find-id-en{
    font-size: 14px;
}
/*비밀번호 찾기*/
.find-pw{
    margin: 3px;
    font-size: 14px;
    border-right: 1px solid gainsboro;
}
/*회원가입*/
.sign-up{
    margin: 3px;
    font-size: 14px;
}
/*저작권 표시X*/
footer{
    display: none;
}


/*가로 800px 이상일때*/
@media(min-width : 800px)
{
    .main{
        width: 460px;
        margin: auto;
    }

/*언어설정*/
.select-lang{
    margin-top: 20px;
    width: 550px;
    padding-right: 10px;
}
/*로고설정*/
.image{
    margin-top: 40px;
    height: 130px;
    padding: 20px;
}

/*IP보안 표시*/
#ip-check{
    margin-right: 7px;
    float: right;
    display:block;
}

/*저작권 표시*/
footer{
    display:block;
}

}


/*회원가입 부분*/
.main-signup{
    text-align: center;
    width: 460px;
    margin: auto;
}
h3{
    margin:19px 0px 8px;
    text-align: left;
    font-size: 14px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
.signup-input{
    display:flex;
    /* margin: 0px 10px 8px 10px; */
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
    cursor: pointer;
}
.signup-input-c{
    display:flex;
    /* margin: 0px 10px 8px 10px; */
    padding: 10px;
    border: solid 1px #dadada;
    background: #f5f6f7;
    cursor: pointer;
}
.signup-input-c input{
    background: #f5f6f7;
}
#signup-id, #signup-pw, #signup-pww{
    height: 29px;
    border: none;
    outline:none;
    width:100%;
}
.signup-at{
    color: rgb(150, 150, 150);
    font-size: 15px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
    margin-top: 8px;
}
.pw-lock{
    /* content: ''; */
    /* display: inline-block; */
    top: 50%;
    right: 13px;
    width: 24px;
    height: 24px;
    margin-top: 5px;
    background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
    background-size: 125px 75px;
    cursor: pointer;
}
.pww-lock{
    /* content: ''; */
    /* display: inline-block; */
    top: 50%;
    right: 13px;
    width: 24px;
    height: 24px;
    margin-top: 5px;
    background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
    background-size: 125px 75px;
    cursor: pointer;
}

.signup-input-birth{
    display: block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px;
    background: #fff;
    box-sizing: border-box;
}
#signup-birth-yy, #signup-birth-mm, #signup-birth-dd{
    width: 113px;
    height: 29px;
    border: none;
    outline:none;
}
#signup-name, #signup-gender, #signup-email, #signup-country, #signup-phone, #signup-cnum{
    width:100%;
    height: 29px;
    border: none;
    outline:none;
}
#signup-gender{
    background-color: white;
}
#signup-country{
    background-color: white;
}
#signup-birth-mm{
    background-color: white;
}
/*본인 확인 이메일*/
.choice{
    display: flex;
}
.choice span{
    margin-top: 20px;
    color: rgb(150, 150, 150);
    font-size: 13px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
/*회원가입버튼박스*/
.signup-btn-wrap{
    height: 60px;
    line-height: 55px;
    margin: 10px 0px 50px 0px;
    border: solid 1px rgba(0,0,0,.1);
    background-color:#365f37;
    color: #fff;
    cursor: pointer;
}
/*회원가입버튼*/
#signup-btn{
    width:100px;
    background-color: #365f37;
    border: none;
    color:#fff;
    font-size: 16px;
    outline:none;
    cursor: pointer;
}
</style>
<script language=javascript>
function valid_check()
{
	if(document.frm1.userid.value=="")
	{
		alert("아이디를 입력하여 주시기 바랍니다.");
		document.frm1.userid.focus();
		return false;
	}
	if(document.frm1.userid.value.length <=3)
	{
		alert("아이디는 4자 이상입니다.");
		document.frm1.userid.focus();
		return false;
	}
	if(document.frm1.usernm.value=="")
	{
		alert("이름를 입력하여 주시기 바랍니다.");
		document.frm1.usernm.focus();
		return false;
	}
	if(document.frm1.passwd.value=="")
	{
		alert("비밀번호를 입력하여 주시기 바랍니다.");
		document.frm1.passwd.focus();
		return false;
	}
	if(document.frm1.passwd.value !=document.frm1.passwd2.value)
	{
		alert("비밀번호를 확인하여 주시기 바랍니다.");
		document.frm1.passwd.focus();
		return false;
	}
}

function KeyNumber()
{
	var event_key = event.keyCode;
	if((event_key < 48 || event_key > 57) && (event_key !=8 && event_key !=46))
	{
		event.returnValue=false;
	}
}
	
function cursor_move(a)
{
	if(a==1)
	{
		var str=document.frm1.jumin1.value.length;
		if(str==6)
			document.frm1.jumin1.focus();
	}
	else if(a==2)
	{
		var str=document.frm1.jumin2.value.length;
		if(str==7)
			document.frm1.mailrcv.focus();
	}
}
function remove_account()
{
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "mem_delete_ok.jsp");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhr.onreadystatechange = function() 
	{
		if(xhr.readyState == XMLHttpRequest.DONE)
		{
			if(xhr.status == 200)
			{
				var data = xhr.responseText;
				data = data.trim();
				if(data == 'true')
				{
					console.log('탈퇴 완료');
					window.location.href = '/residence/start.jsp';
					
				}
				else
				{
					console.log('탈퇴 실패');
				}
			}
		}
	}
	xhr.send('userid='+document.frm1.userid.value + '&usernm=' + document.frm1.usernm.value);
}

</script>
<%
//
String in_userid = (String)session.getAttribute("G_uid");
//
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234;encrypt=true;trustServerCertificate=true";
Connection con=DriverManager.getConnection(url);
PreparedStatement pstmt=null;
ResultSet rs=null;
String SQL="select * from members where userid=?";
pstmt=con.prepareStatement(SQL);
pstmt.setString(1, in_userid);
rs=pstmt.executeQuery();
if(rs.next()==false)
{
	out.print("등록되지 않은 회원입니다.");
%>
<script>
	alert('탈퇴되었습니다.');
	window.location.href = '/residence/start.jsp';
</script>
<%
}
else
{
	String usernm=rs.getString("usernm");
	String birth=rs.getString("birth");
	String jad=rs.getString("jad");
	String addd=rs.getString("addd");
	String wos=rs.getString("wos");
	String par=rs.getString("par");
	String ch=rs.getString("ch");
	
	//System.out.println(wos);
	%>
	<body>
	<div class="main-signup">
	<header>
	<div class="logo">
    <a href="start.jsp" target="_blank" title="스위트홈 홈페이지"><img src="image/logo1.JPG"class="image"></a>
    </div>
    </header>
	<form name="frm1" action="mem_update_ok.jsp" method="post">
	<section class="signup-wrap">
	<div>
    <h3>아이디</h3>
    <span class="signup-input">
    <input id="signup-id" type="text" size="15" maxlength="10" name="userid" value="<%=in_userid%>" readonly>
    </span>
    <h3>비밀번호</h3>
    <span class="signup-input">
    <input id="signup-pw" type="text" name="passwd"></input>
    <span class="pw-lock"></span>
    </span>
    <h3>비밀번호 재확인</h3>
    <span class="signup-input">
    <input id="signup-pww" type="text"name="passwd2"></input>
    <span class="pww-lock"></span>
    </span>
    </div>
    <div style="margin-top: 35px;">
    <h3>이름</h3>
    <span class="signup-input">
    <input id="signup-name" type="text"name="usernm"value="<%=usernm%>"></input>
    </span>       
	<h3>생년월일</h3>
    <span class="signup-input">
    <input id="signup-name" type="date"name="birth" value="<%=birth%>"min="1901-01-01" max="2022-05-29"></input>
    </span>
    <h3>사는 곳</h3>
    <span class="signup-input">
    <input id="signup-name" type="text"name="addd"value="<%=addd%>"></input>
    </span>
    <h3>직장 주소</h3>
    <span class="signup-input">
    <input id="signup-name" type="text" name="jad"value="<%=jad%>"></input>
    </span>
    <h3>결혼 여부</h3>
    <%
		if(wos.equals("1"))
		{%>
    기혼<input type="radio" value="1" name="wos" id="wos"checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	미혼<input type="radio" value="2" name="wos" id="wos">
	<% }
		else 
		{%>
		기혼<input type="radio" value="1" name="wos" id="wos">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	미혼<input type="radio" value="2" name="wos" id="wos"checked>
    </span>
	<%} %>
	<h3>직계존속</h3>
    <span class="signup-input">
    <input id="signup-name" type="text"name="par"value="<%=par%>">명</input>
    </span>
    <h3>자식</h3>
    <span class="signup-input">
    <input id="signup-name" type="text"name="ch"value="<%=ch%>">명</input>
    </span>
    <div>
    <div class="signup-btn-wrap">
     <button id="signup-btn">수정하기</button></div>
    <div class="signup-btn-wrap">
    <!-- <button id="signup-btn" value="탈퇴하기" onclick="window.open('mem_delete.jsp','_idcheck','height=220, width=520, menubar=no, directories=no, resizable=no, status=yes, scrollbars=no, toolbar=no');">
    탈퇴하기</button> -->
     <button id="signup-btn" value="탈퇴하기" onclick=remove_account()>
    탈퇴하기</button>
    </div>
    </section>            
    <footer>
    <div class="copyright-wrap" style="font-size: 12px;">
    <span>이용약관 | 개인정보처리방침 | 책임의 한계와 고지 | 회원정보 고객센터</span>
    <div>© WRUTA Corp.</div>
    </footer>
    </body>
	<%
    }
    %>
    </html>
