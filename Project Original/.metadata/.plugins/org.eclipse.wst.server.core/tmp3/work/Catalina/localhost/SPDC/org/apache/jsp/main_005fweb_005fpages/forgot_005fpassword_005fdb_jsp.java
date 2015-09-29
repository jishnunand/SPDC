package org.apache.jsp.main_005fweb_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;
import java.util.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.net.*;

public final class forgot_005fpassword_005fdb_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//FUNCTION TO CREATE RANDOM PASSWORD
		public int password_gen()
		{
			Random t=new Random();
			return(t.nextInt(100000));
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
		message.setSubject("SPDC Password Reset");
		message.setText("Hi "+user+",\n\n"+
		"You recently requested a Password Reset.\n\n"
		+"\nYour New password is: "+pass+"\n\n"
		+"Thanks For using SPDC Service\n"
		+"The Team Awesome!");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
		throw new RuntimeException(e);
	}

	
}


//FUNCTION USED FOR SENDING SMS TO CLIENT MONILE NUMBER

		public void send_sms(String name,String pass,String mob)
		{
			String requestUrl ;	
			String recipient =mob;
			String message = "Hi " +name+",\nYou recently requested a Password Reset,\n New Password:"+pass;
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

PreparedStatement ps =null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

String pass = String.valueOf(password_gen());
String user = null;
String email = null;
String mobile = null;

user = request.getParameter("user_name");
ps = connection.prepareStatement("select * from spdc_admin where username=?");
ps.setString(1, user);
rs = ps.executeQuery();
if(rs.next())
{
	email = rs.getString(5);
	mobile = rs.getString(4);
	ps = connection.prepareStatement("update spdc_admin set password = ? where username = ?");
	ps.setString(1, pass);
	ps.setString(2, user);
	ps.execute();
	if(email!=null)
	{
		send_mail(email, pass, user);
	}
	if(mobile!=null)
	{
		
		send_sms(user, pass, mobile);
	}
	
}
else
{
	
	out.write("<script type='text/javascript'>\n");
	out.write("alert('User Not Found!!!!!');\n");
	out.write("window.location.href='http://localhost:9895/SPDC/main_web_pages/index.html';");
	out.write("</script>\n");
}
user = "+91"+user;
ps = connection.prepareStatement("select * from spdc_user_profile where gsm_id=?");
ps.setString(1, user);
rs = ps.executeQuery();
if(rs.next())
{
	
	email = rs.getString(4);
	mobile = rs.getString(5);
	ps = connection.prepareStatement("update spdc_user_profile set password = ? where gsm_id = ?");
	ps.setString(1, pass);
	ps.setString(2, user);
	ps.execute();
	if(email!=null)
	{
		send_mail(email, pass, user);
	}
	if(mobile!=null)
	{
		
		send_sms(user, pass, mobile);
	}
	
}

else
{
	
	out.write("<script type='text/javascript'>\n");
	out.write("alert('User Not Found!!!!!');\n");
	out.write("window.location.href='http://localhost:9895/SPDC/main_web_pages/index.html';");
	out.write("</script>\n");
}

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
