<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String username=(String)session.getAttribute("spdc");



String customer_name = request.getParameter("customer_name");
String dob = request.getParameter("dob");
String house_no = request.getParameter("house_no");
String post = request.getParameter("post");
String town = request.getParameter("town");
String state = request.getParameter("state");
String country = request.getParameter("country");
String phone_number = request.getParameter("phone_number");
String email = request.getParameter("email");
String ration_card = request.getParameter("ration_card");



Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "jishnu");
PreparedStatement ps = null;
ResultSet rs =null;
ps = connection.prepareStatement("UPDATE SPDC_USER_PROFILE where gsm_id=?");
ps.setString(1, username);
rs = ps.executeQuery();

%>
</body>
</html>