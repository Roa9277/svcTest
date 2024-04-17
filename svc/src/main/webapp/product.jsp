<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.Product"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./resources/css/common.css"/>
	<title>제품목록</title>
</head>
<body>
	<jsp:include page="thanks.jsp" />
	<div style="height: 100px; margin-left: 30px; margin-top: 20px;">
		<p>
		<h2 style="text-decoration: overline; margin-left: 40px;">제품상세</h2>
		<div style="float: right;">
			<c:choose>
				<c:when test="${sessionId eq 'svc_rnd'}">
					<input style="float: right; margin-right: 50px;" type="button" 
						   class="button4" value="수정" onclick="location.href='updateProduct.jsp'"/>
					<input type="button" onclick="location.href='products.jsp'" class="button4"
							value="목록으로"/>
				</c:when>
				<c:otherwise>
					<input type="button" onclick="location.href='products.jsp'" class="button4"
							style="float: right; margin-right: 50px;" value="목록으로"/>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String id = request.getParameter("id");

		String sql = "select * from product where p_id = '"+id+"'";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {

	%>
	<div class ="col-md-5">
		<img src="./upload/<%=rs.getString("p_filename")%>"
			 style="width: 400px; height: 300px;float:left; margin-left: 40px;" />
	</div>
	<div>
		<div style="margin-left: 50px; float: left;">
			<h2><%=rs.getString("p_id")%></h2>
			<P/>
			<p><b>제품타입</b> : <%=rs.getString("p_type")%>
			<p><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
			<p><b>토크</b> : <%=rs.getString("p_torque")%>
			<p><b>입력신호</b> : <%=rs.getString("p_signal")%>
			<p><b>주파수</b> : <%=rs.getString("p_frequency")%>
			<p><b>전압</b> : <%=rs.getString("p_voltage")%>
		</div>
	</div>
<!-- 	<div style="display: flex; justify-content: center; align-items: flex-end;"> -->
		
<!-- 		<p> -->
<!-- 			자세한 사항은 문의부탁드립니다.</p> -->
<!-- 	</div> -->
	<%
		}
	%>
	<%	
	if (rs != null)
		rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
		conn.close();
	%>
	
</body>
</html>
