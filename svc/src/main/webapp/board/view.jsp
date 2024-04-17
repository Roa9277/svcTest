<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="mvc.model.BoardDTO" %>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./resources/css/common.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Board</title>
</head>
<body>
	<jsp:include page="/thanks.jsp" />
	<div style="height: 100px; margin-left: 30px; margin-top: 20px;">
		<p>
		<h2 style="text-decoration: overline; margin-left: 40px;">게시판</h2>
	</div>
	
	<div class="container">
		<form name="newUpdate" 
		action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
		class="form-horizontal" method="post">
		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<input name="name" class="form-control" value="<%=notice.getName()%>" readonly>
			</div>
		</div>
		<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control"	value="<%=notice.getSubject()%>" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5"><%=notice.getContent()%></textarea>
				</div>
			</div>
			<div style="margin-top: 40px; margin-bottom: 40px;">
				<label class="col-sm-2 control-label">답변 방법</label>
				<div class="col-sm-5">
					<input name="messenger" type="radio" checked readonly/> <%=notice.getMessenger()%>로 답변
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<c:set var="userId" value="<%=notice.getId()%>" />
					<c:if test="${sessionId eq userId or sessionId eq 'svc_rnd'}">
						<p>
							<input type="button" onclick="location.href='./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>'"	class="button5" value="삭제"> 
							<input type="submit" class="button4" value="수정">
					</c:if>
					<input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=nowpage%>'" class="button4" value="목록">
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${sessionId eq userId}"> --%>
<%-- 							<input type="button" onclick="location.href='./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>'"	class="button5" value="삭제"> --%>
<!-- 								<input type="submit" class="button4" value="수정 "> -->
<%-- 								<input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=nowpage%>'" class="button4" value="목록"> --%>
<%-- 						</c:when> --%>
<%-- 						<c:when test="${sessionId eq 'svc_rnd'}"> --%>
<!-- 							<li> -->
<%-- 								<input type="button" onclick="location.href='./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>'"	class="button5" value="삭제"> --%>
<!-- 								<input type="submit" class="button4" value="수정 "> -->
<%-- 								<input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=nowpage%>'" class="button4" value="목록"> --%>
<%-- 								<input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=nowpage%>'" class="button4" value="답변"> --%>
<!-- 							</li> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<li> -->
<%-- 								<input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=nowpage%>'" class="button4" value="목록"> --%>
<!-- 							</li>0 -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
					
				</div>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>



					





