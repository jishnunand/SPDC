<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.net.*"%>
<%@page import="javax.servlet.*"%>
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
		int gsm_flag=0;
		int mob_flag=0;
		//Statement stmt = null;
		PreparedStatement ps =null;
		public String re;

		//FUNCTION TO CREATE RANDOM PASSWORD
		public int password_gen()
		{
			Random t=new Random();
			return(t.nextInt(100000));
		}


		// FUNCTION USED FOR SENDING SMS TO CLIENT MONILE NUMBER

		public void send_sms(String gsm,String pass,String mob)
		{
			String requestUrl ;	
			String recipient =mob;
			String message = "Login ID:" +gsm+"\n Password:"+pass;
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
        		"&serviceprovider=GSMModem5" +
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
		gsm_flag=0;
		mob_flag=0;
	
		//DB CONNECTION
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu"); 

	
  		String gsm=request.getParameter("gsm_id");
  		String mob=request.getParameter("mob");
  		String pass=String.valueOf(password_gen());
  		System.out.println(gsm);
  		System.out.println(mob);
  		System.out.println(pass);
 
  		//CHECKING GSM-ID WHETHER ITS ALREADY REGISTERED WITH US
  		String check_gsm = "select * from SPDC_USER_PROFILE where gsm_id=?";
  		ps=con.prepareStatement(check_gsm);
  		ps.setString(1, gsm);
  		ResultSet resultset_gsm = ps.executeQuery();
  		if (resultset_gsm.next())
  		{
			System.out.println("gsm id exists");
	  		gsm_flag = 1;
	  		out.write("<script type='text/javascript'>\n");
	  		out.write("alert(' Entered GSM ID is already exists ');\n");
	  		out.write("window.location.href='http://localhost:9895/Original_Code/main_web_pages/main-admin_pages/Registration_form.jsp';");
	  		out.write("</script>\n");
  		}
 
  		//CHECKING MOBILE NUMBER IS ALREADY REGISTERED WITH US
  		String check_mobile = "select * from SPDC_USER_PROFILE where mobile_number=?";
  		ps=con.prepareStatement(check_mobile);
  		ps.setString(1, mob);
  		ResultSet resultset_mobile_number = ps.executeQuery();
  		if (resultset_mobile_number.next())
  		{
  			System.out.println("inside mobile number check");
  	  		mob_flag = 1;
  	  		out.write("<script type='text/javascript'>\n");
      		out.write("alert(' Entered Mobile Number is already exists ');\n");
      		out.write("window.location.href='http://localhost:9895/Original_Code/main_web_pages/main-admin_pages/Registration_form.jsp';");
      		out.write("</script>\n");
  		}
 
    	//SAVING CUSTOMER DETAILS TO DB
  		if (mob_flag==0 && gsm_flag==0)
  		{	  
	  		System.out.println("inside ok");
	  		try
	  		{  
				/* String null_value = null; */
				String insert_data="insert into SPDC_USER_PROFILE (GSM_ID,PASSWORD,MOBILE_NUMBER) values(?,?,?)";
				ps=con.prepareStatement(insert_data);
				ps.setString(1, gsm);
				ps.setString(2, pass);
				ps.setString(3, mob);
				/* ps.setString(4, null_value );
				ps.setString(5, null_value);
				ps.setString(6, null_value);
				ps.setString(7, null_value);
				ps.setString(8, null_value);
				ps.setString(9, null_value);
				ps.setString(10, null_value); 
				ps.setString(11, null_value); */
				//ps.setString(2, "123456");
				ps.execute();
		
				//SENDING SMS AFTER SAVING CUSTIOMER DETAILS
				send_sms(gsm,pass,mob);
				out.write("<script type='text/javascript'>\n");
		  		out.write("alert('Registration Completed Successfully!!!!!');\n");
		  		out.write("window.location.href='http://localhost:9895/Original_Code/main-admin_pages/Registration_form.jsp';");
		  		out.write("</script>\n");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
  		}
		%>
	</body>
</html>