package org.apache.jsp.main_002dadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import java.net.*;

public final class update_005fcustomer_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {



String old_gsm,old_mob = null;
int gsm_flag,mob_flag = 0;
int id = 0;
String gsm_id = null;
String email = null;
String mobile_number = null;
String connection_type = null;


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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");


String pass=String.valueOf(password_gen());

PreparedStatement ps = null;
ResultSet rs = null;

		
		
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");



 id = Integer.parseInt(request.getParameter("id"));
 gsm_id = request.getParameter("gsm_id");
 email = request.getParameter("email");
 mobile_number = request.getParameter("mobile_number");
 connection_type = request.getParameter("connection_type");



ps = connection.prepareStatement("select * from SPDC_USER_PROFILE where id=?");
ps.setInt(1, id);
rs = ps.executeQuery();
while(rs.next())
{
old_gsm = rs.getString(2);
old_mob = rs.getString(5);
}

System.out.println("old_gsm"+old_gsm);
System.out.println("old_mob"+old_mob);
System.out.println("gsm_id"+gsm_id);
System.out.println("mob"+mobile_number);



//CHECKING GSM-ID WHETHER ITS ALREADY REGISTERED WITH US
	
	if(!old_gsm.equals(gsm_id))
	{
		ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where gsm_id=?");
		ps.setString(1, gsm_id);
		rs = ps.executeQuery();
		if (rs.next())
		{
			System.out.println("gsm id exists");
			gsm_flag = 1;
			out.write("<script type='text/javascript'>\n");
			out.write("alert(' Entered GSM ID is already exists not able to procced more');\n");
			out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/customers.jsp';");
			out.write("</script>\n");
		}
	}


	//CHECKING MOBILE NUMBER IS ALREADY REGISTERED WITH US
	if(!old_mob.equals(mobile_number))
	{
	
	ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where mobile_number=?");
	ps.setString(1, mobile_number);
	rs = ps.executeQuery();
	if (rs.next())
	{
		System.out.println("inside mobile number check");
		mob_flag = 1;
		out.write("<script type='text/javascript'>\n");
		out.write("alert(' Entered Mobile Number is already exists  not able to procced more ');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/customers.jsp';");
		out.write("</script>\n");
	}


	}




if (gsm_flag==0 && mob_flag==0)
{
	
	System.out.println("insde system flag");
	System.out.println("gsm_id"+gsm_id);
	System.out.println("mob"+mobile_number);
	
ps = connection.prepareStatement("update SPDC_USER_PROFILE set gsm_id = ?,email = ?,mobile_number = ?,connection_type = ? where id = ?");
ps.setString(1, gsm_id);
ps.setString(2, email);
ps.setString(3, mobile_number);
ps.setString(4, connection_type);
ps.setInt(5, id);
ps.execute();


if(!old_gsm.equals(gsm_id))
{
	ps = connection.prepareStatement("update SPDC_USER_PROFILE set password = ? where id = ?");
	ps.setString(1, pass);
	ps.setInt(2,id);
	ps.execute();
	//send_sms(gsm_id,pass,mobile_number);
}


	out.write("<script type='text/javascript'>\n");
	out.write("alert('User Profile Updated Successfully Successfully!!!!!');\n");
	out.write("window.location.href='http://localhost:9895/SPDC/main-admin_pages/index.jsp';");
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
