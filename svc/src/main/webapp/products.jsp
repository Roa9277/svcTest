<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
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
		<h2 style="text-decoration: overline; margin-left: 40px;">제품목록</h2>
		<c:if test="${sessionId eq 'svc_rnd'}">
			<input style="float: right; margin-right: 50px;" type="button" 
				   class="button4" value="제품등록" onclick="location.href='addProduct.jsp'"/>
		</c:if>
	</div>
	
	<div>
		<div class="row" align="center" style="margin: 40px;">
		<%@ include file="dbconn.jsp"%>
			<%
				String sql = "SELECT * FROM product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-3" style=" margin-left: 30px;">
				<img src="./upload/<%=rs.getString("p_fileName")%>" style="width: 250PX; height: 170px; margin-bottom:15px;">
				<h3><%=rs.getString("p_id")%></h3>
				<p><%=rs.getString("p_type")%>
				<p>
				<input type="button" class="button4" value="상세정보"
						onclick="location.href='./product.jsp?id=<%=rs.getString("p_id")%>'"/>
			</div>
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
		</div>
	</div>
	
</body>