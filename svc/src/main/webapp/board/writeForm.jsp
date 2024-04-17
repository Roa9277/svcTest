<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionName = (String) session.getAttribute("sessionName");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./resources/css/common.css"/>
	<title>Board</title>
</head>
<script type="text/javascript">
	function checkBoard() {
		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if(!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
	}
	
	function submit1() {
		alert("등록 완료");
		document.newWrite.submit();
	}
	
</script>
<body>
	<jsp:include page="/thanks.jsp" />
	<div style="height: 100px; margin-left: 30px; margin-top: 20px;">
		<p>
		<h2 style="text-decoration: overline; margin-left: 40px;">게시판</h2>
	</div>
	<div class="container">
		<form action="./BoardWriteAction.do" name="newWrite"
			class="form-horizontal" method="post" onsubmit="return checkBoard()">
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2 control-label">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" 
						value="<%=sessionName %>" placeholder="name" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" 
						placeholder="제목을 입력해주세요.">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control" 
						placeholder="제품과 관련없는 내용는 삭제될 수 있습니다."></textarea>
				</div>
			</div>
			<div style="margin-top: 40px;">
				<label class="col-sm-2 control-label">답변 방법</label>
				<div class="col-sm-5">
					<input name="messenger" type="radio" value="전화번호" checked/> 전화번호로 답변 &emsp;
					<input name="messenger" type="radio" value="이메일" /> 이메일로 답변&emsp;
					<input name="messenger" type="radio" value="댓글" /> 댓글로 답변
					
				</div>
			</div>
			<div class="grid text-center" style="--bs-columns: 18; --bs-gap: .5rem;">
				<div class="g-col-4" style="margin-top: 50px;">
					<input type="button" class="button4" value="등록" onclick="submit1()">
					<input type="button" class="button5" value="취소"
						   onclick="location.href='<c:url value="./BoardListAction.do"/>'">
				</div>
			</div>
		</form>
	</div>
</body>
</html>