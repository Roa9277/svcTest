<%@ page language="java" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SVC</title>
	<link rel="stylesheet"href="../resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../resources/css/common.css"/>
</head>
<body>
	<div id="cont">
	<%@ include file="/menu.jsp" %>
	
		<div class="hg1">
			<div class="card" style="background-color: rgba(4, 13, 32, 0.5);">
				<div class="card-body" style="padding: 50px 50px 25px 50px">
				<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
				%>
					<form name="memberLogin" class="form-signin" action="./processLoginMember.jsp" 
						   method="post">
						<div class="form-group">
							<label for="inputUserName" class="sr-only">User Name</label> <input
								type="text" class="form-control" placeholder="ID" name='id'
								required autofocus>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="sr-only">Password</label> <input
								type="password" class="form-control" placeholder="Password"
								name='password' required>
						</div>
						<button id="button3" type="submit"> &emsp;&emsp;&emsp; 로그인 하기 &emsp;&emsp;&emsp; </button>
					</form>
				</div>
				<p>
					<a href="#">아이디 찾기</a>&nbsp; | &nbsp;
					<a href="#">비밀번호 찾기</a>&nbsp; | &nbsp;
					<a href="addMember.jsp">회원가입</a>
				</p>
			</div>
	    </div>
	</div>
</body>
<%@ include file="/footer.jsp"%>
</html>