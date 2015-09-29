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
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select * from image");
int i = 0;
while (rs.next()) {
	InputStream in = rs.getBinaryStream(3);
	OutputStream f = new FileOutputStream(new File("E:/test.jpg"));
	int c = 0;
	while ((c = in.read()) > -1) {
		System.out.println(c);
		f.write(c);	
	}
	f.close();
	in.close();
}
%>
</body>
</html>