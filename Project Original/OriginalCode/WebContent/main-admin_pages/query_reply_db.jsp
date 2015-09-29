<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
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
String msg = request.getParameter("msg");
PreparedStatement ps =null;
java.util.Date date = Calendar.getInstance().getTime();
java.sql.Date sqlDate = new java.sql.Date(date.getTime()); 
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:XE", "system", "jishnu");
	String all_queries = "UPDATE SPDC_QUERIES set REPLY_MESSAGE=?, ADMIN_MESSAGE_DATE=? where ID=?";
	ps=con.prepareStatement(all_queries);
	ps.setString(1, msg );
	ps.setDate(2,sqlDate);
	ps.setInt(3, id);
    ps.executeQuery();
    out.write("<script type='text/javascript'>\n");
	out.write("alert('Query Send Successfully!!!!!');\n");
	out.write("window.location.href='http://localhost:9895/Original_Code/main-admin_pages/queries_main.jsp';");
	out.write("</script>\n");
%>
</body>
</html>