<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>R.G.N �α���</title>
	<link rel="stylesheet" href="css/login.css">
	<script src="login.js"></script>
</head>
<script language=javascript>
function valid_check()
{
	if(document.frm1.userid.value=="")
	{
		alert("���̵� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
		document.frm1.userid.focus();
		return false;
	}
	if(document.frm1.passwd.value=="")
	{
		alert("��й�ȣ�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
		document.frm1.passwd.focus();
		return false;
	}
	document.frm1.submit();
}
</script>

<body>
	<div class="main">
		<!--�������� ���-->
		<header>
			<!--NAVER LOGO-->
			<div class="logo">
				<a href="start.jsp" target="_blank" title="Ȩ������"><img src="image/logo1.PNG"
						class="image"></a>
			</div>
		</header>

		<!--�α��� �κ�-->
		<form name="frm1" action="login_ok1.jsp" METHOD="post">
		<section class="login-wrap">
			<div class="login-id-wrap">
				<input placeholder="���̵�" type="text" class="input-id" name="userid" required></input>
			</div>
			<div class="login-pw-wrap">
				<input placeholder="��й�ȣ" type="password" class="input-pw" name="passwd" required></input>
			</div>
			<div class="login-btn-wrap">
				<button class="login-btn" onclick="valid_check()" >�α���</button>
			</div>
			<div class="under-login">
				<span class="stay-check">
					<input type="checkbox" name="stay-btn" value="stay" class="stay-checkbox">�α��� ���� ����
				</span>
				<span class="ip-check">
					IP ���� <input type="checkbox" name="stay-btn" value="stay" class="ip-checkbox">
				</span>
			</div>
		</section>

		<!--class,PW ã�� �� ȸ������ �κ�-->
		<section class="find-signup-wrap">

			<!--<span class="find-id">
				<a href="https://nclass.naver.com/user2/help/classInquiry?lang=ko_KR" target="_blank"
					title="���̵� ã��">���̵� ã��</a>
			</span>

			<span class="find-pw">
				<a href="https://nclass.naver.com/user2/help/pwInquiry?lang=ko_KR" target="_blank"
					title="��й�ȣ ã��">��й�ȣ ã��</a>
			</span>
-->
			<span class="sign-up">
				<a href="join.jsp" target="_blank"
					title="ȸ������">ȸ������</a>
			</span>

		</section>

		<!--���۱� ����-->
		<footer>
			<div class="copyright-wrap">
				<span> <img src="image/logo1.PNG" width=70px> Copyright  WRUTA. All Rights Reserved.</span>
			</div>
		</footer>

	</div>

</body>

</html>