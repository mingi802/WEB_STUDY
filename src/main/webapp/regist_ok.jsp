<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
String gender = request.getParameter("gender");
String birth_date = request.getParameter("year")+"�� ";
birth_date += request.getParameter("month")+"�� ";
birth_date += request.getParameter("day")+"��";
String rrn = request.getParameter("rrn")+"-";
rrn += request.getParameter("rrn_2");	
%>
<p>Your ID: <%=id %></p>
<p>Your Password: <%=password %></p>
<p>Your Gender: <%=gender %></p>
<p>Your Birth Month: <%=birth_date %></p>
<p>Your Resident Registration Number: <%=rrn %></p>
<input type="button" value="GO BACK" Onclick="goBack()">
</body> 
<script>
function goBack() {
	window.history.back();
}

</script>
</html>