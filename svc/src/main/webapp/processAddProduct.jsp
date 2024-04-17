<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	
	//	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String realFolder = getServletContext().getRealPath("/") + "upload";
	System.out.println(realFolder);
	
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String type = multi.getParameter("type");
	String torque = multi.getParameter("torque");
	String signal = multi.getParameter("signal");
	String frequency = multi.getParameter("frequency");
	String voltage = multi.getParameter("voltage");
	String manufacturer = multi.getParameter("manufacturer");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

	String sql = "insert into product values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, type);
	pstmt.setString(3, torque);
	pstmt.setString(4, signal);
	pstmt.setString(5, frequency);
	pstmt.setString(6, voltage);
	pstmt.setString(7, manufacturer);
	pstmt.setString(8, fileName);
	
	int success = pstmt.executeUpdate();
	if(success == 0)
		System.out.println("입력에 실패했습니다.");
	
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("products.jsp");
%>



