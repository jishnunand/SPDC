<%@page import="java.sql.*"%>
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
String[] checkbox = request.getParameterValues("checkbox");
int length = checkbox.length;
System.out.println(length);
for(int i=0;i<checkbox.length;i++)
{
	
	ps = connection.prepareStatement("delete from SPDC_QUERY where id = ?");
	ps.setInt(1,Integer.parseInt(checkbox[i]));
	ps.execute();
}
out.write("<script type='text/javascript'>\n");
out.write("alert('Query Deleted Successfully !!!!!');\n");
out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
out.write("</script>\n");
%>
</body>
</html>