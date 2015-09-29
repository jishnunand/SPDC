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

Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

PreparedStatement ps =null;
ResultSet rs = null;

int id = Integer.parseInt(request.getParameter("id"));








ps = connection.prepareStatement("delete from SPDC_USER_PROFILE where id = ?");
ps.setInt(1,id);
ps.execute();

	
		out.write("<script type='text/javascript'>\n");
		out.write("alert('User Deleted Successfully !!!!!');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/customers.jsp';");
		out.write("</script>\n");
	

	

%>
</body>
</html>