<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"href="../resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/common.css"/>
<script type="text/javascript">
	function checkForm() {
		
		var form = document.newMember;
		
// 		var id = form.id.value;
// 		var name = form.name.value;
// 		var phone = newMember.phone.value;
// 		var email = form.email.value;
		
// 		var password = document.getElementById("password");
// 		var pass2 = document.getElementById("password_confirm");
// 		var phone = document.getElementById("phone");

		if (form.id.value.length < 4 || form.id.value.length > 12) {
			alert("[아이디]\n최소 4자에서 최대 12자까지 입력하세요");
			form.name.select();
			form.name.focus();
			return false;
		}

		if (form.password.value != form.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			form.password_confirm.select();
			form.password_confirm.focus();
			return false;
		}
		

		if (isNaN(form.phone.value)) {
			alert("전화번호는 숫자만 입력해주세요.");
			form.phone.select();
			form.phone.focus();
			return false;
		}
		
// 		if(checkForm() === false) {
// 			return false;
// 		}
		
		form.submit()
	}
</script>

<title>회원가입</title>
</head>
<body>
	<jsp:include page="/thanks.jsp" />
		<div style="height: 100px; margin-left: 30px; margin-top: 20px;">
		<p>
			<h2 style="text-decoration: overline; margin-left: 40px;">회원가입</h2>
		</div>

	<div style="margin-left: 60px; min-width: 1000px;">
		<form name="newMember" class="form-horizontal"  action="processAddMember.jsp" 
			  method="post" autocomplete="off" >
			<div class="form-group row">
				<label class="col-sm-2 ">&emsp;아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" required>
<!-- 					<input type="submit" id="button4" value="중복검사" onclick="checkId()">  -->
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">&emsp;비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control" placeholder="password" required>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">&emsp;비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control" placeholder="password confirm" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">&emsp;성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" required>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">&emsp;성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" checked/> 남 
					<input name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">&emsp;생일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="생년(4자)" size="6" required> 
					<select name="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">&emsp;이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50" required>@ 
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">&emsp;전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" required>

				</div>
			</div>
			<p/>
			<hr>
			<div class="form-group  row">
				<label class="col-sm-2 ">&emsp;회사명</label>
				<div class="col-sm-3">
					<input name="comp" type="text" class="form-control" placeholder="company">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">&emsp;직급</label>
				<div class="col-sm-3">
					<input name="position" type="text" class="form-control" placeholder="position">
				</div>
			</div>
			<div class="grid text-center" style="--bs-columns: 18; --bs-gap: .5rem;">
				<div class="g-col-4">
					<input type="button" class="button4" value="등록" onclick="checkForm()"> 
					<input type="reset" class="button5" value="다시작성" onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>