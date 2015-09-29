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
<%!
double lt_first,lt_second,lt_third,lt_fourth,lt_meter,lt_sms=0;

public void send_sms(String gsm)
{
	String requestUrl ;	
	String recipient =gsm;
	String message = "1010110";
	String username = "admin";
	String password = "admin";
	String originator = "+918281424452";
	try 
	{
		requestUrl  = "http://127.0.0.1:9501/api?action=sendmessage&" +
		"username=" + URLEncoder.encode(username, "UTF-8") +
		"&password=" + URLEncoder.encode(password, "UTF-8") + 
		"&recipient=" + URLEncoder.encode(recipient, "UTF-8") + 
		"&messagetype=SMS:TEXT" +
		"&messagedata=" + URLEncoder.encode(message, "UTF-8") +
		"&originator=" + URLEncoder.encode(originator, "UTF-8") +
		"&serviceprovider=GSMModem4" +
		"&responseformat=html";		
			URL url = new URL(requestUrl);		  
			HttpURLConnection uc = (HttpURLConnection)url.openConnection();
			uc.getResponseMessage();
			uc.disconnect();
	}
	catch(Exception ex) 
	{
		System.out.println(ex.getMessage());	
	}
}
%>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

PreparedStatement ps =null;
ResultSet rs = null;




Calendar c = Calendar.getInstance();
/*---------------------Current month and year------------------------*/
 SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
String current_month = sdf.format(Calendar.getInstance().getTime());

SimpleDateFormat sdf_date = new SimpleDateFormat("dd");
String current_date = sdf_date.format(Calendar.getInstance().getTime());

System.out.println("hai"+current_date); 




/* String current_date,current_month="11"; */


if(current_date.equals("28"))
{
	

	ps = connection.prepareStatement("select * from SPDC_USER_PROFILE where gsm_id not in(select gsm_id from SPDC_BILLS where insert_date like '%"+current_month+"%' )");
	rs = ps.executeQuery();
	while(rs.next())
	{
		send_sms(rs.getString(2));
		System.out.println(rs.getString(2));
	}
}
%>
</body>
</html>