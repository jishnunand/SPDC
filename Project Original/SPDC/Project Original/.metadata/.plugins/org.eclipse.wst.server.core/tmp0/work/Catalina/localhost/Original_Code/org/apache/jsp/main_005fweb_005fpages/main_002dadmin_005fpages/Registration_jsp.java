package org.apache.jsp.main_005fweb_005fpages.main_002dadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import java.net.*;
import javax.servlet.*;

public final class Registration_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
			String recipient ="+91"+ mob;
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
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("\t\t<title>Insert title here</title>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t");

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
  		String check_gsm = "select * from user_profile where gsm_id=?";
  		ps=con.prepareStatement(check_gsm);
  		ps.setString(1, gsm);
  		ResultSet resultset_gsm = ps.executeQuery();
  		if (resultset_gsm.next())
  		{
			System.out.println("gsm id exists");
	  		gsm_flag = 1;
	  		out.write("<script type='text/javascript'>\n");
	  		out.write("alert(' Entered GSM ID is already exists ');\n");
	  		out.write("window.location.href='http://localhost:9895/Original_Code/main_web_pages/index.html';");
	  		out.write("</script>\n");
  		}
 
  		//CHECKING MOBILE NUMBER IS ALREADY REGISTERED WITH US
  		String check_mobile = "select * from user_profile where mobile_number=?";
  		ps=con.prepareStatement(check_mobile);
  		ps.setString(1, mob);
  		ResultSet resultset_mobile_number = ps.executeQuery();
  		if (resultset_mobile_number.next())
  		{
  			System.out.println("inside mobile number check");
  	  		mob_flag = 1;
  	  		out.write("<script type='text/javascript'>\n");
      		out.write("alert(' Entered Mobile Number is already exists ');\n");
      		out.write("window.location.href='http://localhost:9895/Original_Code/main_web_pages/index.html';");
      		out.write("</script>\n");
  		}
 
    	//SAVING CUSTOMER DETAILS TO DB
  		if (mob_flag==0 && gsm_flag==0)
  		{	  
	  		System.out.println("inside ok");
	  		try
	  		{  
				String null_value = null;
				String insert_data="insert into user_profile values(?,?,?,?,?,?,?,?,?,?,?)";
				ps=con.prepareStatement(insert_data);
				ps.setString(1, gsm);
				ps.setString(2, pass);
				ps.setString(3, mob);
				ps.setString(4, null_value );
				ps.setString(5, null_value);
				ps.setString(6, null_value);
				ps.setString(7, null_value);
				ps.setString(8, null_value);
				ps.setString(9, null_value);
				ps.setString(10, null_value); 
				ps.setString(11, null_value);
				//ps.setString(2, "123456");
				//ps.execute();
		
				//SENDING SMS AFTER SAVING CUSTIOMER DETAILS
				//send_sms(gsm,pass,mob);
				//response.sendRedirect("index.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
  		}
		
      out.write("\r\n");
      out.write("\t</body>\r\n");
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
