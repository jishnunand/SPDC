<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.FileWriter" %>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.net.*"%>
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
int id = Integer.parseInt(request.getParameter("id"));
PreparedStatement ps =null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

ps = connection.prepareStatement("update spdc_bills set paid=? where id = ?");
ps.setString(1, "paid");
ps.setInt(2,id);
ps.execute();
out.write("<script type='text/javascript'>\n");
out.write("alert(' Payment Completed ');\n");
out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
out.write("</script>\n");
%>
</body>
</html>