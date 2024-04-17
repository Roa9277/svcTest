<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" 
	user="svc_rnd" password="svc_design1" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=? and password=?  
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
<c:set var="name1" value="${row.name}"/>

	<%
		String name1 = (String)pageContext.getAttribute("name1");
	
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName", name1);
	%>
	<c:redirect url="/welcome.jsp" />
</c:forEach>

<%-- <c:redirect url="loginMember.jsp" /> --%>
<c:redirect url="loginMember.jsp?error=1" />
