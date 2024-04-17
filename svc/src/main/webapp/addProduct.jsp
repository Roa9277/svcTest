<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./resources/css/common.css"/>
	<title>제픔등록</title>
</head>
<body>
	<jsp:include page="thanks.jsp" />
	<div style="height: 100px; margin-left: 30px; margin-top: 20px;">
		<p>
		<h2 style="text-decoration: overline; margin-left: 40px;">제품등록</h2>
	</div>
	<div style="margin-left: 70px; min-width: 1000px;">
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" 
			  method="post" enctype ="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2 ">제품명</label>
				<div class="col-sm-3">
					<input type="text" id ="productId" name="productId" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 ">제품타입</label>
				<div class="col-sm-3">
					<input type="text" id ="type" name="type" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 ">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 ">토크</label>
				<div class="col-sm-3">
					<input type="text" name="torque" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 ">입력신호</label>
				<div class="col-sm-3">
					<input type="text" name="signal" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 ">주파수</label>
				<div class="col-sm-3">
					<input type="text" name="frequency" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 ">전압</label>
				<div class="col-sm-3">
					<input type="text" name="voltage" class="form-control">
				</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2 ">제품사진</label>
				<div class ="col-sm-5">
						<input type="file" name="productImage" class="form-control">
					</div>
				</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type ="button" class="button4" value="등록" onclick = "submit()"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
