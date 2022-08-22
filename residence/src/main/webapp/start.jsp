<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main1.css">

<script type="application/javascript" src="js/bjd.js"></script>
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
			      <option value="" selected>선택</option>
			    </select>
			    <select name="sigugun" id="sigugun">
			      <option value="" selected>선택</option>
			    </select>
			    <select name="dong" id="dong">
			      <option value="" selected>선택</option>
			    </select>
			    &nbsp; 
			    <input name="search_value" type="hidden"/>
			    <button type="submit" class="btn btn-light">검색</button>
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
	var bjdMap = new Map();
	for(var i=0; i<bjd.length; i++)
	{
	    var sido = bjd[i].sido;
	    var sigugun = bjd[i].sigugun;
	    var dong1 = bjd[i].dong1;
	    var dong2 = bjd[i].dong2;
	    var dong3 = bjd[i].dong3;
	    if(sido != "" && sigugun != "" && dong1 != "")
	    {
	        if(bjdMap.get(sido))
	        {
	            if(bjdMap.get(sido).get(sigugun))
	            {
	            	if(bjdMap.get(sido).get(sigugun).includes(dong1 + " " + dong2) == false)
	                	bjdMap.get(sido).get(sigugun).push(dong1 + " " + dong2);
	            }
	            else
	            {
	                bjdMap.get(sido).set(sigugun, []);
	            }
	        }
	        else
	        {
	            bjdMap.set(sido, new Map());
	        }
	    }
	}

	function sidoOptions(value, key, map)
	{
		jQuery('#sido').append(fn_option(0, key));
	}
	function sigugunOptions(value, key, map)
	{
		//console.log(jQuery('#sido > option:selected').val());
		var t = map.get(jQuery('#sido > option:selected').val());
		if(jQuery('#sido > option:selected').val() == key)
		{
			value.forEach((value, key, map) => jQuery('#sigugun').append(fn_option(0, key)));
		}
	}
	function dongOptions(value, key, map)
	{
		var t = map.get(jQuery('#sido > option:selected').val()).get(jQuery('#sigugun > option:selected').val());
		for(var i=0; i<t.length; i++)
		{
			 jQuery('#dong').append(fn_option(0, t[i]));
		}
		console.log("key:" + key);
		if(jQuery('#sigugun > option:selected').val() == key)
		{
			console.log(value);
			value.forEach((value, key, map) => jQuery('#dong').append(fn_option(0, value)));
		}
	}
	
	jQuery(document).ready(function(){
		/*
		  //sido option 추가
		  jQuery.each(hangjungdong.sido, function(idx, code){
		    //append를 이용하여 option 하위에 붙여넣음
		    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
		  });
		*/
		bjdMap.forEach(sidoOptions);
		
		jQuery('#sido').change(function(){
		    jQuery('#sigugun').show();
		    jQuery('#sigugun').empty();
		    jQuery('#sigugun').append(fn_option('','선택')); //
		    bjdMap.forEach(sigugunOptions);
		});

		jQuery('#sigugun').change(function(){
		    jQuery('#dong').show();
		    jQuery('#dong').empty();
		    jQuery('#dong').append(fn_option('','선택')); //
		    
		    var t = bjdMap.get(jQuery('#sido > option:selected').val()).get(jQuery('#sigugun > option:selected').val());
			console.log(t);
			for(var i=0; i<t.length; i++)
			{
				 jQuery('#dong').append(fn_option(0, t[i]));
			}
		});
	});
	
		function fn_option(code, name){
		  return '<option value="' + name +'">' + name +'</option>';
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
	    //System.out.println("세션이 무효화 상태입니다.");
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
		//System.out.println(uid);
	}
	%>
	<!-- ----------------------------------- -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>