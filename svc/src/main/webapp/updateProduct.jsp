<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./resources/css/common.css"/>
<title>제품수정</title>
</head>
<body>
	<jsp:include page="thanks.jsp" />
	<div style="height: 100px; margin-left: 30px; margin-top: 20px;">
		<p>
		<h2 style="text-decoration: overline; margin-left: 40px;">제품수정</h2>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String productId = request.getParameter("id");

		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class ="col-md-5">
		<img src="./upload/<%=rs.getString("p_filename")%>"
			 style="width: 400px; height: 300px;float:left; margin-left: 40px;" />
	</div>
	<div class="col-md-7">
		<form name="newProduct" action="./processUpdateProduct.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">제품명</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId"
						class="form-control" value='<%=rs.getString("p_id")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제품타입</label>
				<div class="col-sm-3">
					<input type="text" name="type" class="form-control"
						value="<%=rs.getString("p_type")%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control"
						value="<%=rs.getString("p_manufacturer")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">토크</label>
				<div class="col-sm-3">
					<input type="text" name="torque" class="form-control"
						value="<%=rs.getString("p_torque")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">입력신호</label>
				<div class="col-sm-3">
					<input type="text" name="signal" class="form-control"
						value="<%=rs.getString("p_signal")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주파수</label>
				<div class="col-sm-3">
					<input type="text" name="frequency" class="form-control"
						value="<%=rs.getString("p_frequency")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전압</label>
				<div class="col-sm-3">
					<input type="text" name="voltage" class="form-control"
						value="<%=rs.getString("p_voltage")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제품사진</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type ="button" class="button4" value="수정" onclick = "submit()"/>
				</div>
			</div>
		</form>

	</div>
	<%
		}
		if (rs != null)
			rs.close();
 		if (pstmt != null)
 			pstmt.close();
 		if (conn != null)
			conn.close();
 	%>
</body>
</html>
