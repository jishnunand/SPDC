package org.apache.jsp.main_002duser_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.SimpleDateFormat;

public final class edit_005fprofile_005fsubmit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


String old_email,old_mob = null;
int email_flag,mob_flag=0;

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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write('\r');
      out.write('\n');

String username=(String)session.getAttribute("spdc");

PreparedStatement ps = null;
ResultSet rs = null;

		
		
Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");


String customer_name = request.getParameter("customer_name");
String house_no = request.getParameter("house_no");
String post = request.getParameter("post");
String town = request.getParameter("town");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobile_number = request.getParameter("phone_number");
String email = request.getParameter("email");
String district = request.getParameter("district");


ps = connection.prepareStatement("select * from SPDC_USER_PROFILE where gsm_id=?");
ps.setString(1, username);
rs = ps.executeQuery();
while(rs.next())
{
old_mob = rs.getString(5);
old_email = rs.getString(4);
}

//email checks
if(!old_email.equals(email))
{
	ps=connection.prepareStatement("select * from SPDC_USER_PROFILE where gsm_id=?");
	ps.setString(1, username);
	rs = ps.executeQuery();
	if (rs.next())
	{
		System.out.println("gsm id exists");
		email_flag = 1;
		out.write("<script type='text/javascript'>\n");
		out.write("alert(' Entered GSM ID is already exists not able to procced more');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
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
out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
out.write("</script>\n");
}


}

if (mob_flag==0 && mob_flag==0)
{
ps = connection.prepareStatement("UPDATE SPDC_USER_PROFILE set customer_name=?,house_no=?,post=?,city=?,districts=?,state=?,country=?,mobile_number=?,email=? where gsm_id=?");

ps.setString(1, customer_name);
ps.setString(2, house_no);
ps.setString(3, post);
ps.setString(4, town);
ps.setString(5, district);
ps.setString(6, state);
ps.setString(7, country);
ps.setString(8, mobile_number);
ps.setString(9, email);
ps.setString(10, username);

ps.execute();

out.write("<script type='text/javascript'>\n");
out.write("alert(' completed ');\n");
out.write("window.location.href='http://localhost:9895/SPDC/main-user_pages/index.jsp';");
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
