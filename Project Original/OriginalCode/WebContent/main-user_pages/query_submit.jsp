<%@page import="java.sql.*"%>
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

//DB CONNECTION
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu"); 
		
		
PreparedStatement ps = null;
java.util.Date date = Calendar.getInstance().getTime();
java.sql.Date sqlDate = new java.sql.Date(date.getTime()); 
String username=(String)session.getAttribute("spdc");
System.out.println(username);
String subject=request.getParameter("subject");
String message=request.getParameter("message");
String insert_data="insert into SPDC_QUERIES (GSM_ID,SUBJECT,MESSAGE,USER_MESSAGE_DATE) values(?,?,?,?)";
ps = connection.prepareStatement(insert_data);
ps.setString(1, username);
ps.setString(2, subject);
ps.setString(3, message );
ps.setDate(4, sqlDate);
/*ps.setString(6, null_value);
ps.setString(7, null_value);
ps.setString(8, null_value);
ps.setString(9, null_value);
ps.setString(10, null_value); 
ps.setString(11, null_value); */
//ps.setString(2, "123456");
ps.execute();

out.write("<script type='text/javascript'>\n");
	out.write("alert('Query Send Successfully!!!!!');\n");
	out.write("window.location.href='http://localhost:9895/Original_Code/main-user_pages/queries.jsp';");
	out.write("</script>\n");

%>

</body>
</html>