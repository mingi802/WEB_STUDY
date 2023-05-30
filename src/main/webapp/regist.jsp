<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="loginform" action="./regist_ok.jsp" method="GET" onSubmit="return validateForm()" accept-charset="UTF-8">
		<table align="center">
			<tr> 
				<th colspan="2">회원가입</th>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" placeholder="id"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" placeholder="password"></td>
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input type="password" name="confirm_password" placeholder="confirm password"></td>	
			</tr>
			<tr>
				<td>Gender</td>
				<td>
					<input id="male" type="radio" name="gender" value="male" onchange="setRrn_2()">
					<label for="male">남성</label>
					<input id="female" type="radio" name="gender" value="female" onchange="setRrn_2()">
					<label for="female">여성</label>
				</td>		
			</tr>
			<tr>
				<td>Birth Date</td>
				<td>
					<select name="year" onchange="setYear(this), setRrn_2()">
					</select>
					<select name="month" onchange="setMonth(this)">
					</select>
					<select name="day" onchange="setDay(this)">
					</select>
				</td>
			</tr>
			<tr>
				<td>Resident Registration Number</td>
				<td><input type="text" name="rrn" value="000000" style="width:80px; text-align:right;" readonly> 
				<b>-</b> 
				<input type="text" name="rrn_2" placeholder="1234567" style="width:80px;" disabled></td>
			</tr>
			<tr align="right">
				<td colspan="2"><input type="submit" value="Sign Up">&nbsp;<input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>
	
	
	<script>
		function setYear(year) {
			var rrn = document.loginform.rrn;
			var rrn_year = rrn.value;
			if(rrn_year.length >= 2) {
				rrn.value = year.value.substring(2) + rrn_year.substring(2);
			}
			else
			rrn.value = year.value.substring(2);
		}
	
		function setMonth(mon) {
			var rrn = document.loginform.rrn;
			var rrn_month = rrn.value;
			if(rrn_month.length == 4) {
				rrn.value = rrn_month.substring(0,2) + mon.value;
			}
			else if(rrn_month.length == 6) {
				rrn.value = rrn_month.substring(0,2) + mon.value + rrn_month.substring(4,6);
			}
			else
			rrn.value += mon.value;
		}
		
		function setDay(day) {
			var rrn = document.loginform.rrn;
			var rrn_day = rrn.value;
			if(rrn_day.length >= 6) {
				rrn.value = rrn_day.substring(0,4) + day.value;
			}
			else
			rrn.value += day.value; 		
		}
		
		function getValue(gender) {
			alert(gender.value);
		}
		
		function setRrn_2() {
			var now = new Date();
	    	var now_year = parseInt(now.getFullYear().toString().substring(2));
	    	var bir_year = parseInt(document.loginform.year.value.substring(2));
	    	var gender = document.loginform.gender.value;
	    	var rrn_gen_temp = (gender == "male") ? [1,3] : [2,4];
	    	var rrn_gen = (now_year >= bir_year) ? rrn_gen_temp[1] : rrn_gen_temp[0];
	    	var rrn_2 = document.loginform.rrn_2;
	    	console.log(now_year, bir_year, now_year >= bir_year, rrn_gen);
	    	rrn_2.value = rrn_gen;
	    	rrn_2.disabled=false;
		}
	
	    function validateForm() {
	    	var id = document.loginform.id.value;
	    	var password = document.loginform.password.value;
	    	var confirm_password = document.loginform.confirm_password.value;
	    	var gender = document.loginform.gender.value;
	    	var rrn_gen = (gender == "male") ? [1,3] : [2,4];
	    	var birth_date = document.loginform.year.value+"년 "+document.loginform.month.value+"월 "+document.loginform.day.value+"일";
	    	var rrn = document.loginform.rrn.value + "-" + document.loginform.rrn_2.value;
	    	alert(id+" "+password+" "+gender+" "+birth_date+" "+rrn+" "+rrn_gen); 
	    	//이 문서의 charset이 utf-8이 아니면 힣이 깨지므로 주의하자.
	    	if((/^(?=.*[^ㄱ-ㅎ가-힣A-Za-z0-9])(?=.*[0-9])(?=.*[a-zA-Z]).{5,8}$/).test(id) // <- 이 정규표현식은 한글,영어,숫자를 제외한 문자(특수문자)와 숫자, 영어가 문자열에 있는 지, 길이는 5~8이 맞는 지 검사해준다.  
	    			&& id.match(/[^ㄱ-ㅎ가-힝A-Za-z0-9]/g).length == 1) {	// <- match()는 괄호안에 정규표현식이 문자열 내부에 존재하면 그 값을 배열로 하나만 가져오는데, 표현식 끝에 g(global)을 달아주면 문자열 끝까지 검사하여 조건이 일치하는 값을 전부 가져온다. 
	    																// 괄호 안 표현식은 특수문자를 추출해낸다. 즉, 저 배열의 길이가 1이 넘으면 id안에 특수문자가 2개 이상 있다는 뜻이므로 올바른 아이디 형식이 아님을 검사할 수 있다. 
	    		alert("아이디 형식 통과");
	    		
	    		if((/^(?=.*[^ㄱ-ㅎ가-힣A-Za-z0-9])(?=.*[0-9])(?=.*[a-zA-Z]).{8,}$/).test(password)) {
	    			alert("비밀번호 형식 통과");
	    			if(password==confirm_password) {
		    			alert("비밀번호 일치"); 
		    			if(rrn.length == 14 && rrn_gen.includes(parseInt(rrn.charAt(7)))) {
		    				alert("선택한 성별과 주민등록번호에 기재된 성별이 동일함");
		    				return true;
		    			}
		    			else {
		    				alert("선택한 성별과 주민등록번호에 기재된 성별 틀림 또는 잘못된 주민번호 길이");
		    				document.loginform.rrn.focus();
		    				return false;
		    			}
		    		}
		    		else { 
		    			alert("비밀번호 맞지 않음");
		    			document.loginform.confirm_password.focus();
		    			return false;
		    		}
	    		}
	    		else {
	    			alert("올바르지 않은 비밀번호 형식(영어,숫자,특수문자로 구성된 8자리 이상의 문자열)");
	    			document.loginform.password.focus();
	    			return false;
	    		}
	    	}
	    	else {
	    		alert("올바르지 않은 아이디 형식(영어,숫자,특수문자1개로 구성된 5~8자리의 문자열)");
	    		 document.loginform.id.focus();
	    		 return false;
	    	}
	      }
	    
	    window.onload = function(){
	    	setDateSelectBox();
	    };    

	    function setDateSelectBox(){
	    	var now = new Date();
	    	var now_year = now.getFullYear();
	    	var selbox_year = document.loginform.year;
	    	var selbox_day = document.loginform.day;
			var selbox_month = document.loginform.month;
	    	
	    	var optgp_year = document.createElement("optgroup");
	    	optgp_year.label = "출생년도";
	    	for(var i = now_year; i >= 1900; i--){
	    		var option = document.createElement("option");
	    		option.value = i.toString();
	    		option.text = i.toString()+"년";
	    		optgp_year.appendChild(option);
	    	}
	    	selbox_year.appendChild(optgp_year);
	    	
	    	var optgp_day = document.createElement("optgroup");
	    	optgp_day.label = "출생일";
	    	for(var i = 1; i <= 31; i++){
	    		var option = document.createElement("option");
	    		option.value = i.toString().padStart(2, "0");
	    		option.text = i.toString().padStart(2, "0")+"일";
	    		optgp_day.appendChild(option);
	    	}
	    	selbox_day.appendChild(optgp_day);
	    	
	    	var optgp_month = document.createElement("optgroup");
	    	optgp_month.label = "출생월";
	    	for(var i = 1; i <= 12; i++){
	    		var option = document.createElement("option");
	    		option.value = i.toString().padStart(2, "0");
	    		option.text = i.toString().padStart(2, "0")+"월";
	    		optgp_month.appendChild(option);
	    	}
	    	selbox_month.appendChild(optgp_month);
	    }
	</script>	
</body>
</html>