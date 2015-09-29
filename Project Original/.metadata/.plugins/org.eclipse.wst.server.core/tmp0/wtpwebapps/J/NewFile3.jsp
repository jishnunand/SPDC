<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


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
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/samp?"
	+"user=root&password=jishnu");
Statement st = con.createStatement();
File imgfile = new File("E:/user1.png");

FileInputStream fin = new FileInputStream(imgfile);

PreparedStatement pre =
con.prepareStatement("insert into image values(?,?,?)");

pre.setString(1,"test");
pre.setInt(2,3);
pre.setBinaryStream(3,(InputStream)fin,(int)imgfile.length());
pre.executeUpdate();
System.out.println("Successfully inserted the file into the database!");

pre.close();
con.close(); 



%>
</body>
</html>