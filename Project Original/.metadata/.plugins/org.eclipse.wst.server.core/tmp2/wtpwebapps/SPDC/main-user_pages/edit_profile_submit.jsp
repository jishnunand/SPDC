<%@ page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>

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
String old_email,old_mob = null;
int email_flag,mob_flag=0;
%>
<%
String username=(String)session.getAttribute("spdc");

PreparedStatement ps = null;
ResultSet rs = null;

		
		
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");


String customer_name = request.getParameter("customer_name");
String house_no = request.getParameter("house_no");
String post = request.getParameter("post");
String town = request.getParameter("town");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobile_number = request.getParameter("phone_number");
String email = request.getParameter("email");
String district = request.getParameter("district");


ps = connection.prepareStatement("select * from SPDC_USER_PROFILE where gsm_id=?");
ps.setString(1, username);
rs = ps.executeQuery();
while(rs.next())
{
old_mob = rs.getString(5);
old_email = rs.getString(4);
}

//email checks
if(!old_email.equals(email))
{
	ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where gsm_id=?");
	ps.setString(1, username);
	rs = ps.executeQuery();
	if (rs.next())
	{
		System.out.println("gsm id exists");
		email_flag = 1;
		out.write("<script type='text/javascript'>\n");
		out.write("alert(' Entered GSM ID is already exists not able to procced more');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
		out.write("</script>\n");
	}
}

//CHECKING MOBILE NUMBER IS ALREADY REGISTERED WITH US
if(!old_mob.equals(mobile_number))
{

ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where mobile_number=?");
ps.setString(1, mobile_number);
rs = ps.executeQuery();
if (rs.next())
{
System.out.println("inside mobile number check");
mob_flag = 1;
out.write("<script type='text/javascript'>\n");
out.write("alert(' Entered Mobile Number is already exists  not able to procced more ');\n");
out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
out.write("</script>\n");
}


}

if (mob_flag==0 && mob_flag==0)
{
ps = connection.prepareStatement("UPDATE SPDC_USER_PROFILE set customer_name=?,house_no=?,post=?,city=?,districts=?,state=?,country=?,mobile_number=?,email=? where gsm_id=?");

ps.setString(1, customer_name);
ps.setString(2, house_no);
ps.setString(3, post);
ps.setString(4, town);
ps.setString(5, district);
ps.setString(6, state);
ps.setString(7, country);
ps.setString(8, mobile_number);
ps.setString(9, email);
ps.setString(10, username);

ps.execute();

out.write("<script type='text/javascript'>\n");
out.write("alert(' completed ');\n");
out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
out.write("</script>\n");
}
%>
</body>
</html>