<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script type="text/javascript">
	function validate(){
		if(document.loginfrm.username.value==""){
			alert("Username should not be blank");
			document.loginfrm.username.focus();
			return false;
		}else if(document.loginfrm.password.value==""){
			alert("Password should not be blank");
			document.loginfrm.password.focus();
			return false;
		}		
	}	
</script>
</head>
<body>
<h3 align="center">Employee Management System</h3>
<div style="margin:0 auto;width:75%;text-align:left;">
	<center>
	<div id="error" style="color:red"></div>
	<form action="authenticate" name="loginfrm" onsubmit="return validate();" method="post">		
		Username : <input type="text" name="username"/><br>
		Password : <input type="password" name="password"/><br>
		<input type="submit" value="Login" name="submit"/><br>			
	</form>
	
	</center>
</div>
<%
String loginStatus = "";
if(request.getAttribute("loginstatus")!=null){
	loginStatus = request.getAttribute("loginstatus").toString();
}
%>
<script type="text/javascript">
	window.onload = function(){
		var loginStatus = '<%= loginStatus %>';
		if(loginStatus.length > 0){
			document.getElementById("error").appendChild(document.createTextNode(loginStatus));						
		}
				
	}
</script>
</body>
</html>