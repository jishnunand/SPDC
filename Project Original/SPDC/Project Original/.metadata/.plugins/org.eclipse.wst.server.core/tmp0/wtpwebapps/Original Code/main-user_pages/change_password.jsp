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
<%	//taking from change password.jsp
	String new_password = request.getParameter("new_password");
	String repeat_password = request.getParameter("repeat_password");
	
	//varibale and object declarations
	PreparedStatement ps = null;
	String username=(String)session.getAttribute("spdc");
	
	//Queries
	String query_find_user_details = "select * from admin where username=?";
	String query_update_password = "update admin set password=? where username=?";
	
	
	//DB Connection
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE", "system", "jishnu");
    
    
    //Checking the password is matched or not by calling the function : check_password
    if(!new_password.equals(repeat_password))
    {
    	out.write("<script type='text/javascript'>\n");
  		out.write("alert('Password not matches!!!!!');\n");
  		out.write("window.location.href='http://localhost:9895/Original_Code/main-user_pages/change_password.jsp';");
  		out.write("</script>\n");
    }
    ps=con.prepareStatement(query_find_user_details);
    ps.setString(1,username);
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    	{
    		ps=con.prepareStatement(query_update_password);
    		ps.setString(1, new_password);
    		ps.setString(2, username);
    		ps.executeQuery();
    		out.write("<script type='text/javascript'>\n");
      		out.write("alert('Password Changed Successfully!!!!!');\n");
      		out.write("window.location.href='http://localhost:9895/Original_Code/main-user_pages/change_password.jsp';");
      		out.write("</script>\n");
    	}
		
%>
</body>
</html>