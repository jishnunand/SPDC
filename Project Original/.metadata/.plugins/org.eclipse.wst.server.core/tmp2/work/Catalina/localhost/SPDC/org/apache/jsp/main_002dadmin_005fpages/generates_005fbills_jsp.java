package org.apache.jsp.main_002dadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;

public final class generates_005fbills_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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
