<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>


<%

	Connection conn = null;
	String db_url = "jdbc:mysql://localhost:3306/campus";
	String db_id = "root";                     //MySQL에 접속을 위한 계정의 ID
	String db_pwd = "1234";            //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(db_url, db_id, db_pwd);
	String id = request.getParameter("id");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql = "SELECT * FROM T_SHOPPING_MEMBER WHERE MEMBER_ID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);

	rs = pstmt.executeQuery();
	
	
	response.setContentType("application/json");
	PrintWriter outt = response.getWriter();
	
	JSONObject resultObj = new JSONObject();
	
	if(rs.next())
	{
		resultObj.put("result","true");
	}
	else
	{
		resultObj.put("result","false");
	}
	
	outt.print(resultObj.toString());
	
%>

