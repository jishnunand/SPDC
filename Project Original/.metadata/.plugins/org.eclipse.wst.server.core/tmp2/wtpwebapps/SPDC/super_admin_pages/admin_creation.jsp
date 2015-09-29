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
public int password_gen()
{
	Random t=new Random();
	return(t.nextInt(100000));
}


//FUNCTION USED FOR SENDING SMS TO CLIENT MONILE NUMBER

		public void send_sms(String user,String pass,String mob)
		{
			String requestUrl ;	
			String recipient =mob;
			String message = "Login ID:" +user+"\n Password:"+pass;
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

//DB CONNECTION
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");
		PreparedStatement ps =null;
		ResultSet rs = null;
	
		String username=request.getParameter("username");
		String mob=request.getParameter("mobile_number");
		String email=request.getParameter("email");
		String pass=String.valueOf(password_gen());
		ps = connection.prepareStatement("insert into spdc_admin(username,password,email,mobile_number) values(?,?,?,?)");
		ps.setString(1, username);
		ps.setString(2, pass);
		ps.setString(3,email);
		ps.setString(4,mob);
		ps.execute();
	 
%>
</body>
</html>