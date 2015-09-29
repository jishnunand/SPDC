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
try
{
  String usn=request.getParameter("adminid");
   String pass=request.getParameter("adminpass");
   
   //String ad_name,ad_pass;
	
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

PreparedStatement ps = null;
ResultSet rs = null;
ps = connection.prepareStatement("select * from SPDC_ADMIN where username='"+usn+"' and password='"+pass+"'");
rs = ps.executeQuery();


/* String s=null;
String g=null;
 */

	if(rs.next())
      { 
		session.setAttribute("spdc",usn);
		if(rs.getBoolean(7)==true)
		{
			response.sendRedirect("http://localhost:9895/SPDC/super_admin_pages/super_admin_index.jsp");
		}
		else
		{
        response.sendRedirect("http://localhost:9895/SPDC/main-admin_pages/customers.jsp");
		}
      }
   	else
  	 {
   		out.write("<script type='text/javascript'>\n");
  		out.write("alert('Wrong Username or Password !!!!!');\n");
  		out.write("window.location.href='http://localhost:9895/SPDC/main_web_pages/admin.html';");
  		out.write("</script>\n");	
   	}  
}

catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>