<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>

<meta charset="UTF-8">
<title>WHAT? - 모든 것을 알 때까지</title>
</head>
<script language=javascript>
function tableCreate(){
	var html = '';
	
	var name = $("#inName").val();
	var birth = $("#inBirth").val();
	var jobaddress = $("#inJad").val();
	var address = $("#inAd").val();
	var wos = $("#inWos").val();
	var gender = $("#inGen").val();
	var remove = $("remove").val();
				
	html += '<tr>';
	html += '<td>'+name+'</td>';
	html += '<td>'+birth+'</td>';
	html += '<td>'+jobaddress+'</td>';
	html += '<td>'+address+'</td>';
	html += '<td>'+wos+'</td>';
	html += '<td>'+gender+'</td>';
	
	html += '<td><button onclick="tableDelete(this)" id="remove">remove</button></td>';
	html += '</tr>';
				
	$("#dynamicTable").append(html);
				
	$("#inName").val('');
	$("#inBirth").val('');
	$("#inJad").val('');
	$("#inAd").val('');
	$("#inWos").val('');
	$("#inGen").val('');
}

function tableDelete(obj){
	var tr = $(obj).parent().parent();

	tr.remove();
}

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
function KeyNumber()
{
	var event_key = event.keyCode;
	if(event_key < 48 || event_key > 57) && (event_key !=8 && event_key !=46))
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
<!--function check_id()
{
	var JSPName="id_check.jsp";
	browsing_window=window.open(JSPName,"_idcheck", "height=220, width=520, menubar=no, directories=no, resizable=no, status=yes, scrollbars=no, toolbar=no");
	browsing_window.focus();
	}-->
</script>
<body>

<h3>회원 가입</h3>
<form name="frm1" action="join_ok.jsp" method="post">
<table width="500" border="1" CellPadding="0" CellSpacing="0">
<tr>
<td width="40%" align="left">아이디</td>
<td width="60%" align="left">
<input type="text" size="15" maxlength="10" name="userid" readonly>
<!--<input type="button" value="ID Check" name="ID Check" onclick="check_id()" onmouseover="this.style.cursor='hand';">  -->
<input type="button" value="ID Check" onclick="window.open('id_ch.jsp','_idcheck','height=220, width=520, menubar=no, directories=no, resizable=no, status=yes, scrollbars=no, toolbar=no');">
</td>
</tr>
<tr>
<td width="40%" align="left">이름</td>
<td width="60%" align="left">
<input type="text" size="15" maxlength="10" name="usernm">
</td>
</tr>
<tr>
<td width="40%" align="left">비밀번호</td>
<td width="60%" align="left">
<input type="password" size="10" maxlength="10" name="passwd">
</td>
</tr>
<tr>
<td width="40%" align="left">비밀번호 확인</td>
<td width="60%" align="left">
<input type="password" size="10" maxlength="10" name="passwd2">
</td>
</tr>
<tr>
<td width="40%" align="left">생년월일</td>
<td width="60%" align="left">
<input type="date" size="10" maxlength="10" name="birth" min="1901-01-01" max="2022-05-29">
</td>
</tr>
<tr>
<td width="40%" align="left">직장 주소</td>
<td width="60%" align="left">
<input type="text" size="10" maxlength="10" name="jad">
</td>
</tr>
<tr>
<td width="40%" align="left">사는 곳</td>
<td width="60%" align="left">
<input type="text" size="10" maxlength="10" name="addd">
</td>
</tr>
<tr>
<td width="40%" align="left">결혼 여부</td>
<td width="60%" align="left">
기혼<input type="radio" value="1" name="wos" id="wos">
					미혼<input type="radio" value="2" name="wos" id="wos">
</td>
</td>
</tr>
<tr>
<td width="40%" align="left">직계존속</td>
<td width="60%" align="left">
<input type="text" size="10" maxlength="10" name="par">명
</td>
</tr>
<tr>
<td width="40%" align="left">자식</td>
<td width="60%" align="left">
<input type="text" size="10" maxlength="10" name="ch">명
</td>
</tr>
</form>
</table>
<button class="join-btn" value="가입" onclick="valid_check()">가입</button>
<!--
<div>
		<table border="1px" id="dynamicTable">

			<colgroup>
				<col width="200px">
				<col width="200px">
				<col width="200px">
				<col width="200px">
				<col width="200px">
				<col width="200px">
				<col width="100px">
			</colgroup>

			<thead>
				<tr>
					<th>이름</th>
					<th>생년월일</th>
					<th>직장 주소</th>
					<th>사는 곳</th>
					<th>결혼 여부</th>
					<th>성별</th>
					<th>버튼</th>
				</tr>
			</thead>
</form>
			<tbody id="dynamicTbody"></tbody>

			<tfoot>
				<tr>
						<td><input type="text" placeholder="이름" id="inName" name="inName"></td>
					<td><input type="text" placeholder="생년원일" id="inBirth" name="inBirth"></td>
					<td><input type="text" placeholder="직장 주소" id="inJad" name="inJad"></td>
					<td><input type="text" placeholder="사는 곳" id="inAd" name="inAd"></td>
					<td>기혼<input type="radio" value="1" name="inWos" id="inWos">
					미혼<input type="radio" value="2" name="inWos" id="inWos"></td>
					<td>남<input type="radio" value="1" name="inGen" id="inGen">
					여<input type="radio" value="2" name="inGen"id="inGen" ></td>
					<td><input type="button"  value="append" onClick="tableCreate()"></td>
				</tr>
			</tfoot>

		</table>
	</div>

<!--  
<tr>
<td width="40%" align="left">관심사</td>
<td width="60%" align="left">
건강<input type="checkbox" name="health">
경제<input type="checkbox" name="economy">
정치<input type="checkbox" name="politics">
연예<input type="checkbox" name="entertainment">
스포츠<input type="checkbox" name="sport">
뷰티<input type="checkbox" name="beauty">
음식<input type="checkbox" name="food">
여행<input type="checkbox" name="tour">
운동<input type="checkbox" name="exercise">
IT<input type="checkbox" name="it">
게임<input type="checkbox" name="game">
</td>
</tr>
<tr>
<td width="40%" align="left">메일수신여부</td>
<td width="60%" align="left">
동의함<input type="checkbox" name="mailrcv">
</td>
</tr>
<tr>
<td width="40%" align="left">성별</td>
<td width="60%" align="left">
남<input type="radio" value="1" name="gender">
여<input type="radio" value="2" name="gender">
</td>
</tr>
<tr>
<td width="40%" align="left">직업</td>
<td width="60%" align="left">
<select name="job">
<option value="">==직업을 선택하세요==</option>
<option value="1">학생</option>
<option value="2">회사원</option>
<option value="3">군인</option>
<option value="9">기타</option>
</select>
</td>
</tr>
</td>

<tr>-->

<!-- </td>
</tr>
-->

</body>
</html>