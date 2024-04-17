<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
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

		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE product SET p_type=?, p_torque=?, p_signal=?, p_frequency=?, p_voltage=?, p_manufacturer=?, p_fileName=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setString(2, torque);
				pstmt.setString(3, signal);
				pstmt.setString(4, frequency);
				pstmt.setString(5, voltage);
				pstmt.setString(6, manufacturer);
				pstmt.setString(7, fileName);
				pstmt.setString(8, productId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE product SET p_type=?, p_torque=?, p_signal=?, p_frequency=?, p_voltage=?, p_manufacturer=?, WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setString(2, torque);
				pstmt.setString(3, signal);
				pstmt.setString(4, frequency);
				pstmt.setString(5, voltage);
				pstmt.setString(6, manufacturer);
				pstmt.setString(7, productId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("Product.jsp");
%>


