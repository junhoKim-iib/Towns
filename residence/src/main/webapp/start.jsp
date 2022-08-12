<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main1.css">

<script type="application/javascript" src="js/hangjungdong.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<meta charset="UTF-8">
<title>살기 좋은 동네 추천</title>
<style>
@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
font-family: 'Cafe24Ssurround';
margin: 500px 1500px 200px 50px;
background-image:url("image/star1.png");
background-repeat:no-repeat;
background-size: cover;
 }
h1 {
        text-align: left;
        font-size: 80px;
    }
h1 span:nth-child(1) {
        color:#FFFFFF;
    }
h2 {
        text-align: left;
        font-size: 30px;
    }
   
h2 span:nth-child(1) {
        color:#FFFFFF;
    }
.search-bar {
      width: 1000px;
    }
#header_menu ul li {
	display: inline;
	border-left: 1px solid #FFFFFF;
	/* 테두리와 메뉴 간격 벌리기. padding: 위 오른쪽 아래 왼쪽; */
	padding: 0px 10px 0px 10px;
 font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
        color: #FFFFFF;
}
#search{
 font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
}
#header_menu{
	float: right;
}
</style>
</head>
<body>
	<h1>
	    <span>Sweet Home</span><br/>
	</h1>
	<h2>
	    <span id="subtitle">Recommend a good neighborhood <span id="userid" style="font-size:50px;"></span> to live in</span>
	</h2>
	
	<div id="ac"></div>
	<form action="main.jsp" method="get">
		<div id="search">
	    	<div class="mx-1 mt-5 my-1 search-bar input-group mb-3">
		    	<select name="sido" id="sido">
			      <option value="">선택</option>
			    </select>
			    <select name="sigugun" id="sigugun">
			      <option value="">선택</option>
			    </select>
			    <select name="dong" id="dong">
			      <option value="">선택</option>
			    </select>
			    <button type="submit">검색</button>
				<!--  
				<input name="search_value" type="text" class="form-control rounded-pill" placeholder="지역 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
				-->
				<div class="input-group-append">
				
	      		</div>
	      	</div>
	      	<div id="header_menu">
	      		<ul id="menu_list"> 
					<li id="login"><a href="login1.jsp">로그인</a></li>
					<li id="join1"><a href="join1.jsp">회원가입</a></li>
					<li id="logout"><a href="logout.jsp">로그아웃</a></li>
					<li id="update"><a href="mem_update.jsp">회원정보 수정</a></li>
				</ul>
			</div>
		</div>
	</form>
	
	<span id="user_welcome"></span>
	<!-- -------------- Javascript -------------- // -->
	<script>
	jQuery(document).ready(function(){
		  //sido option 추가
		  jQuery.each(hangjungdong.sido, function(idx, code){
		    //append를 이용하여 option 하위에 붙여넣음
		    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
		  });

		  //sido 변경시 시군구 option 추가
		  jQuery('#sido').change(function(){
		    jQuery('#sigugun').show();
		    jQuery('#sigugun').empty();
		    jQuery('#sigugun').append(fn_option('','선택')); //
		    jQuery.each(hangjungdong.sigugun, function(idx, code){
		      if(jQuery('#sido > option:selected').val() == code.sido)
		        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
		    });

		    //세종특별자치시 예외처리
		    //옵션값을 읽어 비교
		    if(jQuery('#sido option:selected').val() == '36'){
		      jQuery('#sigugun').hide();
		      //index를 이용해서 selected 속성(attr)추가
		      //기본 선택 옵션이 최상위로 index 0을 가짐
		      jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
		      //trigger를 이용해 change 실행
		      jQuery('#sigugun').trigger('change');
		    }
		  });

		  //시군구 변경시 행정동 옵션추가
		  jQuery('#sigugun').change(function(){
		    //option 제거
		    jQuery('#dong').empty();
		    jQuery.each(hangjungdong.dong, function(idx, code){
		      if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
		        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
		    });
		    //option의 맨앞에 추가
		    jQuery('#dong').prepend(fn_option('','선택'));
		    //option중 선택을 기본으로 선택
		    jQuery('#dong option:eq("")').attr('selected', 'selected');

		  });

		  jQuery('#dong').change(function(){
		    var sido = jQuery('#sido option:selected').val();
		    var sigugun = jQuery('#sigugun option:selected').val();
		    var dong = jQuery('#dong option:selected').val();
		    var dongCode = sido + sigugun + dong + '00';

		    //동네예보 URL
		    var url = 'https://www.weather.go.kr/weather/process/timeseries-dfs-body-ajax.jsp?myPointCode=' + dongCode + '&unit=K';

		  });
		});

		function fn_option(code, name){
		  return '<option value="' + code +'">' + name +'</option>';
		}
		</script>
	<script>
		var ShowMenuAfterLogin = function(show)
		{
			var logout = document.getElementById('logout');
			var update = document.getElementById('update');
			if(show)
			{
				// 로그인, 회원가입 li 삭제
				var ul = document.getElementById('menu_list');
				console.log(ul);
				var items = ul.getElementsByTagName('li');
				console.log(items);
				items[0].remove();
				items[0].remove();
				
				logout.style.display = 'inline';
				update.style.display = 'inline';
			}
			else
			{
				logout.style.display = 'none';
				update.style.display = 'none';				
			}
		}

		var ShowUserId = function(user_id)
		{
			document.getElementById('userid').textContent = ' for '+user_id;
		}
		
	</script>
	<!-- ----------------------------------- -->
	<!-- -------------- JSP ---------------- -->
	<%
	if (session == null || !request.isRequestedSessionIdValid()) 
	{
	    System.out.println("세션이 무효화 상태입니다.");
	    %>
		<script>
			ShowMenuAfterLogin(false);
		</script>
		<%
	}
	else
	{
		String uid = (String)session.getAttribute("G_uid");
		// 로그인 안된 상태면
		if(uid == null)
		{
			%>
			<script>
				ShowMenuAfterLogin(false);
			</script>
			<%
		}
		// 로그인 된 상태면
		else
		{
			// 로그아웃 버튼을 보여준다.
			%>
			<script>
				ShowMenuAfterLogin(true);
				ShowUserId('<%=uid%>');
			</script>
			<%
		}
		System.out.println(uid);
	}
	%>
	<!-- ----------------------------------- -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>