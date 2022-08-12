<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>R.G.N 로그인</title>
	<link rel="stylesheet" href="css/login.css">
	<script src="login.js"></script>
</head>
<script language=javascript>
function valid_check()
{
	if(document.frm1.userid.value=="")
	{
		alert("아이디를 입력하여 주시기 바랍니다.");
		document.frm1.userid.focus();
		return false;
	}
	if(document.frm1.passwd.value=="")
	{
		alert("비밀번호를 입력하여 주시기 바랍니다.");
		document.frm1.passwd.focus();
		return false;
	}
	document.frm1.submit();
}
</script>

<body>
	<div class="main">
		<!--웹페이지 상단-->
		<header>
			<div class="logo">
				<a href="start.jsp" target="_blank" title="홈페이지"><img src="image/logo1.JPG"
						class="image"></a>
			</div>
		</header>

		<!--로그인 부분-->
		<form name="frm1" action="login_ok1.jsp" METHOD="post">
		<section class="login-wrap">
			<div class="login-id-wrap">
				<input placeholder="아이디" type="text" class="input-id" name="userid" required></input>
			</div>
			<div class="login-pw-wrap">
				<input placeholder="비밀번호" type="password" class="input-pw" name="passwd" required></input>
			</div>
			<div class="login-btn-wrap">
				<button class="login-btn" onclick="valid_check()" >로그인</button>
			</div>
			<div class="under-login">
				<span class="stay-check">
					<input type="checkbox" name="stay-btn" value="stay" class="stay-checkbox">로그인 상태 유지
				</span>
				<span class="ip-check">
					IP 보안 <input type="checkbox" name="stay-btn" value="stay" class="ip-checkbox">
				</span>
			</div>
		</section>

		<!--class,PW 찾기 및 회원가입 부분-->
		<section class="find-signup-wrap">

			<!--<span class="find-id">
				<a href="https://nclass.naver.com/user2/help/classInquiry?lang=ko_KR" target="_blank"
					title="아이디 찾기">아이디 찾기</a>
			</span>

			<span class="find-pw">
				<a href="https://nclass.naver.com/user2/help/pwInquiry?lang=ko_KR" target="_blank"
					title="비밀번호 찾기">비밀번호 찾기</a>
			</span>
-->
			<span class="sign-up">
				<a href="join1.jsp" target="_blank"
					title="회원가입">회원가입</a>
			</span>

		</section>

		<!--저작권 정보-->
		<footer>
			<div class="copyright-wrap">
				<span> <img src="image/logo1.JPG" width=70px> Copyright  WRUTA. All Rights Reserved.</span>
			</div>
		</footer>

	</div>

</body>

</html>