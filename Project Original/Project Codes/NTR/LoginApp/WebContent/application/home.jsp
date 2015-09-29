
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Management System</title>
</head>
<body>
<div>
<%@page import="java.util.*"%>
	<% Date d = new Date(); %>
	<div>
		<p style="float:left"><b>Welcome <%= request.getParameter("username").toUpperCase() %>(<a href="/authentication/login.jsp">Logout</a>)</b></p>
		<p style="float:right"><b><%= d.toString() %></b></p>
	</div>
</body>
</html>