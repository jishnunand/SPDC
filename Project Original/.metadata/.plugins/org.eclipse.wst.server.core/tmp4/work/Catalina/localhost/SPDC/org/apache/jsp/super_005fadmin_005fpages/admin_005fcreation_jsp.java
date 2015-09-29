package org.apache.jsp.super_005fadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import java.net.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public final class admin_005fcreation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
				"Welcome to SPDC.\n\n"
				+"Your Login Id is: "+user
				+"\nYour New password is: "+pass+"\n"
				+"URL:http://localhost:9895/SPDC/main_web_pages/admin.html"+"\n\n\n"
				+"Thanks For using SPDC Service\n"
				+"The Team Awesome!");

					Transport.send(message);

					System.out.println("Done");

				} catch (MessagingException e) {
				throw new RuntimeException(e);
			}

			
		}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write('\r');
      out.write('\n');


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
		send_sms(username, pass, mob);
		send_mail(email, pass, username);
		out.write("<script type='text/javascript'>\n");
		out.write("alert('User Created Successfully !!!!!');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/super_admin_pages/Manage_admin.jsp';");
		out.write("</script>\n");
	 

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
