<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>��� ���� ���� ��õ</title>
<style>
body{
margin: 500px 1500px 200px 50px;
background-image:url("image/star.gif");
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
	/* �׵θ��� �޴� ���� ������. padding: �� ������ �Ʒ� ����; */
	padding: 0px 10px 0px 10px;
 
        color: #FFFFFF;
}
#header_menu{
	float: right;
}
</style>
</head>
<body>
	<h1>
	    <span>R. G. N</span><br/>
	</h1>
	<h2>
	    <span>Recommend a good neighborhood to live in</span>
	</h2>
	
	<div id="ac"></div>
	<form action="main.jsp" method="get">
		<div id="search">
	    	<div class="mx-1 mt-5 my-1 search-bar input-group mb-3">
				<input name="search_value" type="text" class="form-control rounded-pill" placeholder="���� �˻�" aria-label="Recipient's username" aria-describedby="button-addon2">
				<div class="input-group-append">
	      		</div>
	      	</div>
	      	<div id="header_menu">
	      		<ul id="menu_list"> 
					<li id="login"><a href="login1.jsp">�α���</a></li>
					<li id="join"><a href="join.jsp">ȸ������</a></li>
					<li id="logout"><a href="logout.jsp">�α׾ƿ�</a></li>
					<li id="bookmark"><a href="bookmark.jsp">�ϸ�ũ</a></li>
				</ul>
			</div>
		</div>
	</form>
	
	<span id="user_welcome"></span>
	<!-- -------------- Javascript -------------- // -->
	<script>
		var ShowMenuAfterLogin = function(show)
		{
			var logout = document.getElementById('logout');
			var bookmark = document.getElementById('bookmark');
			if(show)
			{
				// �α���, ȸ������ li ����
				var ul = document.getElementById('menu_list');
				console.log(ul);
				var items = ul.getElementsByTagName('li');
				console.log(items);
				items[0].remove();
				items[0].remove();
				
				logout.style.display = 'inline';
				bookmark.style.display = 'inline';
			}
			else
			{
				logout.style.display = 'none';
				bookmark.style.display = 'none';
			}
		}

		var ShowWelcome = function(user_id)
		{
			console.log(user_id+'asd');
			var welcome = document.getElementById('user_welcome');
			welcome.textContent = user_id+'�� ȯ���մϴ�!';
		}
		
	</script>
	<!-- ----------------------------------- -->
	<!-- -------------- JSP ---------------- -->
	<%
	if (session == null || !request.isRequestedSessionIdValid()) 
	{
	    System.out.println("������ ��ȿȭ �����Դϴ�.");
	    %>
		<script>
			ShowMenuAfterLogin(false);
		</script>
		<%
	}
	else
	{
		String uid = (String)session.getAttribute("G_uid");
		// �α��� �ȵ� ���¸�
		if(uid == null)
		{
			%>
			<script>
				ShowMenuAfterLogin(false);
			</script>
			<%
		}
		// �α��� �� ���¸�
		else
		{
			// �α׾ƿ� ��ư�� �����ش�.
			%>
			<script>
				ShowMenuAfterLogin(true);
				ShowWelcome('<%=uid%>');
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