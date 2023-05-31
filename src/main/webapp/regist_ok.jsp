<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

String id=request.getParameter("id");
String password=request.getParameter("password");//will return the value 'text'
String name = request.getParameter("name");
String phone_number = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
String email = request.getParameter("mail1")+"@"+request.getParameter("mail2");
String gender = request.getParameter("gender");
String birth_date = request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day");
String calendar = request.getParameter("calendar");
String rrn = request.getParameter("rrn")+"-"+request.getParameter("rrn_2");
String postcode = request.getParameter("postcode");
String roadAddr = request.getParameter("roadAddr");
String jibunAddr = request.getParameter("jibunAddr");
String detailAddr = request.getParameter("detailAddr");
String smssts = request.getParameter("smssts");
String emailsts = request.getParameter("emailsts");

%>
<p>Your ID: <%=id %></p>
<p>Your Password: <%=password %></p>
<p>Your Name: <%=name %></p>
<p>Your Phone_Number: <%=phone_number %></p>
<p>Your Email: <%=email %></p>
<p>Your Gender: <%=gender %></p>
<p>Your Birth_Date : <%=birth_date %> (<%=calendar %>)</p>
<p>Your Resident Registration Number: <%=rrn %></p>
<p>Your PostCode: <%=postcode %></p>
<p>Your RoadAddr: <%=roadAddr %></p>
<p>Your JibunAddr: <%=jibunAddr %></p>
<p>Your DetailAddr: <%=detailAddr %></p>
<input type="button" value="SIGN UP" Onclick="signUp()">
<input type="button" value="GO BACK" Onclick="goBack()">
</body> 
<script>
	function goBack() {
		window.history.back();
	}
	console.log("<%=smssts %>"+" "+"<%=emailsts %>");
	
	function signUp() { 
		<%
		Connection conn = null;

		String db_url = "jdbc:mysql://localhost:3306/campus";
		String db_id = "root";                     //MySQL에 접속을 위한 계정의 ID
		String db_pwd = "1234";            //MySQL에 접속을 위한 계정의 암호
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(db_url, db_id, db_pwd);
		
		if(conn!=null) {
		%>	console.log("MySQL DB 연결 성공"); <%
		}
		
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO T_SHOPPING_MEMBER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, NULL)";
			
		String tel1 = phone_number.split("-")[0];
		String tel2 = phone_number.split("-")[1];
		String tel3 = phone_number.split("-")[2];
		String email1 = email.split("@")[0];
		String email2 = email.split("@")[1];
		String birth_y = birth_date.split("/")[0];
		String birth_m = birth_date.split("/")[1];
		String birth_d = birth_date.split("/")[2];
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, tel1);
		pstmt.setString(6, tel2);
		pstmt.setString(7, tel3);
		pstmt.setString(8, smssts);
		pstmt.setString(9, email1);
		pstmt.setString(10, email2);
		pstmt.setString(11, emailsts);
		pstmt.setString(12, postcode);
		pstmt.setString(13, roadAddr);
		pstmt.setString(14, jibunAddr);
		pstmt.setString(15, detailAddr);
		pstmt.setString(16, birth_y);
		pstmt.setString(17, birth_m);
		pstmt.setString(18, birth_d);
		pstmt.setString(19, calendar);
		%>
		console.log("<%=pstmt %>");
		<%
		int rows = pstmt.executeUpdate();	
		if(rows == 0) {
		%>	
			console.log("Insert Failed");
		<%	
		}
		else {
		%>	
			console.log("Insert Successed");
		<%
			pstmt.close();
		}
	conn.close();
%>
	}

</script>
</html>