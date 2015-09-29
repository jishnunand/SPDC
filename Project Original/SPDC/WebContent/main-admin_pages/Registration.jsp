<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.net.*"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
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
		int mob_flag,email_flag=0;
		//Statement stmt = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
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
		
		
		/*-------------------------------FUNCTION FOR EMAIL----------------------------*/

		public void send_mail(String email,String pass,String user)
		{
			final String username = "spdcnttf@gmail.com";
			final String password = "spdc@dmin";

				Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

				Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });

				try {

					Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("from-email@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
				message.setSubject("SPDC Welcome Message");
				message.setText("Hi "+user+",\n\n"+
				"Now You are a valuable Customer of SPDC.\n\n"
				+"Your Login Id is: "+user
				+"\nYour New password is: "+pass+"\n"
				+"URL:http://localhost:9895/SPDC/main_web_pages/indexlog.html"+"\n\n\n"
				+"Thanks For using SPDC Service\n"
				+"The Team Awesome!");

					Transport.send(message);

					System.out.println("Done");

				} catch (MessagingException e) {
				throw new RuntimeException(e);
			}

			
		}

		%>

		<%
		gsm_flag=0;
		mob_flag=0;
	
		//DB CONNECTION
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");
		String ss = "+91";
  		String gsm=ss+request.getParameter("gsm_id");
  		String mob=ss+request.getParameter("mob");
  		String type=request.getParameter("type_connection");
  		String email = request.getParameter("email");
  		String pass=String.valueOf(password_gen());
  		System.out.println(gsm);
  		System.out.println(mob);
  		System.out.println(pass);
  		
  		
  		if(gsm.length()==13)
  			
  		{
  			if(mob.length()==13)
  			{
  		//CHECKING GSM-ID WHETHER ITS ALREADY REGISTERED WITH US
  		ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where gsm_id=?");
  		ps.setString(1, gsm);
  		ResultSet rs = ps.executeQuery();
  		if (rs.next())
  		{
			System.out.println("gsm id exists");
	  		gsm_flag = 1;
	  		out.write("<script type='text/javascript'>\n");
	  		out.write("alert(' Entered GSM ID is already exists ');\n");
	  		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/Registration_form.jsp';");
	  		out.write("</script>\n");
  		}
 
  		//CHECKING MOBILE NUMBER IS ALREADY REGISTERED WITH US
  		
  		ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where mobile_number=?");
  		ps.setString(1, mob);
  		rs = ps.executeQuery();
  		if (rs.next())
  		{
  			System.out.println("inside mobile number check");
  	  		mob_flag = 1;
  	  		out.write("<script type='text/javascript'>\n");
      		out.write("alert(' Entered Mobile Number is already exists ');\n");
      		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/Registration_form.jsp';");
      		out.write("</script>\n");
  		}
//CHECKING MOBILE NUMBER IS ALREADY REGISTERED WITH US
  		
  		ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where email=?");
  		ps.setString(1, mob);
  		rs = ps.executeQuery();
  		if (rs.next())
  		{
  			System.out.println("inside Email check");
  	  		email_flag = 1;
  	  		out.write("<script type='text/javascript'>\n");
      		out.write("alert(' Entered Email ID is already exists ');\n");
      		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/Registration_form.jsp';");
      		out.write("</script>\n");
  		}
 
    	//SAVING CUSTOMER DETAILS TO DB
  		if (mob_flag==0 && gsm_flag==0 && email_flag==0)
  		{	  
	  		System.out.println("inside ok");
	  		try
	  		{  
				/* String null_value = null; */
				String insert_data="insert into SPDC_USER_PROFILE (GSM_ID,PASSWORD,MOBILE_NUMBER,CONNECTION_TYPE,EMAIL) values(?,?,?,?,?)";
				ps=connection.prepareStatement(insert_data);
				ps.setString(1, gsm);
				ps.setString(2, pass);
				ps.setString(3, mob);
				ps.setString(4, type);
				ps.setString(5, email);
				ps.execute();
		
				//SENDING SMS AFTER SAVING CUSTIOMER DETAILS
				send_sms(gsm,pass,mob);
				send_mail(email, pass, gsm);
				out.write("<script type='text/javascript'>\n");
		  		out.write("alert('Registration Completed Successfully!!!!!');\n");
		  		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/customers.jsp';");
		  		out.write("</script>\n");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
  		}
    	
  		}
  			else
  			{
  				out.write("<script type='text/javascript'>\n");
		  		out.write("alert('Mobile Number not valid!!!!!');\n");
		  		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/Registration_form.jsp';");
		  		out.write("</script>\n");
  			}
  		}
  		else
			{
				out.write("<script type='text/javascript'>\n");
	  		out.write("alert('GSM ID not valid!!!!!');\n");
	  		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/form.jsp';");
	  		out.write("</script>\n");
			}
		%>
	</body>
</html>