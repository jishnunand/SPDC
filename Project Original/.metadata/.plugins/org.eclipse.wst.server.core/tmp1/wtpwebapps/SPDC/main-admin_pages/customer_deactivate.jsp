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
<%!
boolean status,active;
%>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

PreparedStatement ps =null;
ResultSet rs = null;

int id = Integer.parseInt(request.getParameter("id"));
String mobile_number = null;


ps = connection.prepareStatement("select * from SPDC_USER_PROFILE where id=?");
ps.setInt(1, id);
rs = ps.executeQuery();
while(rs.next())
{
mobile_number = rs.getString(5);
}

ps = connection.prepareStatement("select * from SPDC_USER_PROFILE where id =?");
ps.setInt(1,id);
rs = ps.executeQuery();

while(rs.next())
{
status = rs.getBoolean(14);
}

if(status==true)
{
	active=false;
}
else
{
	active=true;
}


ps = connection.prepareStatement("update SPDC_USER_PROFILE set is_active = ? where id = ?");
ps.setBoolean(1, active);
ps.setInt(2,id);
ps.execute();

	if(active==true)
	{
		out.write("<script type='text/javascript'>\n");
		out.write("alert('User Activated Successfully !!!!!');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/customers.jsp';");
		out.write("</script>\n");
	}
	else
	{
		out.write("<script type='text/javascript'>\n");
		out.write("alert('User Deactivated Successfully !!!!!');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/customers.jsp';");
		out.write("</script>\n");
	}

	

%>

</body>
</html>