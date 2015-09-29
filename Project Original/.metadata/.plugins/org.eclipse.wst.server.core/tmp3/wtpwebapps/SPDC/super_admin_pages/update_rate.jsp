<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
int id = 1;
double first = Double.parseDouble(request.getParameter("first"));
double second = Double.parseDouble(request.getParameter("second"));
double third = Double.parseDouble(request.getParameter("third"));
double fourth = Double.parseDouble(request.getParameter("fourth"));
double meter = Double.parseDouble(request.getParameter("meter"));
double sms = Double.parseDouble(request.getParameter("sms"));

PreparedStatement ps = null;
ResultSet rs = null;

		
		
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

ps = connection.prepareStatement("update spdc_lt set first=?,second=?,third=?,fourth=?,meter=?,sms=? where id =?");
ps.setDouble(1, first);
ps.setDouble(2, second);
ps.setDouble(3, third);
ps.setDouble(4, fourth);
ps.setDouble(5, meter);
ps.setDouble(6, sms);
ps.setInt(7, id);
ps.execute();


out.write("<script type='text/javascript'>\n");
out.write("alert('User Profile Updated Successfully Successfully!!!!!');\n");
out.write("window.location.href='http://localhost:9895/SPDC/super_admin_pages/Manage_admin.jsp';");
out.write("</script>\n");
%>

</body>
</html>