<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<%@page import="java.sql.*"%>

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
/*---------------------------DB Connection -----------------------------*/
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
	+"user=root&password=jishnu");


Calendar c = Calendar.getInstance();
/*---------------------Current month and year------------------------*/
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
String current_month = sdf.format(Calendar.getInstance().getTime());
System.out.println(current_month);


/*---------------current date-------*/
SimpleDateFormat sdf_date = new SimpleDateFormat("yyyy-MM-dd");
String current_date = sdf_date.format(Calendar.getInstance().getTime());



PreparedStatement ps = null;
ResultSet rs = null;

double amount = 0;




/*------------------ checks whether the bill is genereted for the current month --------------------*/
ps = connection.prepareStatement("select * from spdc_bills where padi='not paid' and insert_date like '%"+current_month+"%'");
rs = ps.executeQuery();
		
while(rs.next())
{
	if(rs.getDate(10).equals(current_date))
	{
		amount = rs.getDouble(6);
		amount = amount + 50;
		ps = connection.prepareStatement("update spdc_bills set amount = ? where id = ?");
		ps.setDouble(1, amount);
		ps.setInt(2, rs.getInt(1));
		ps.execute();
	}
}

%>


</body>
</html>