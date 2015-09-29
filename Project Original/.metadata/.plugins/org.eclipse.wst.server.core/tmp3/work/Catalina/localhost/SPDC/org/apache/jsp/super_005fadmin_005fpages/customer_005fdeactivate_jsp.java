package org.apache.jsp.super_005fadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import java.net.*;

public final class customer_005fdeactivate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


boolean status,active;

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
      out.write('\r');
      out.write('\n');


Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");

PreparedStatement ps =null;
ResultSet rs = null;

int id = Integer.parseInt(request.getParameter("id"));
String mobile_number = null;


/* ps = connection.prepareStatement("select * from SPDC_ADMIN where id=?");
ps.setInt(1, id);
rs = ps.executeQuery();
while(rs.next())
{
mobile_number = rs.getString(5);
} */

ps = connection.prepareStatement("select * from SPDC_ADMIN where id =?");
ps.setInt(1,id);
rs = ps.executeQuery();

while(rs.next())
{
status = rs.getBoolean(6);
}

if(status==true)
{
	active=false;
}
else
{
	active=true;
}


ps = connection.prepareStatement("update SPDC_ADMIN set status = ? where id = ?");
ps.setBoolean(1, active);
ps.setInt(2,id);
ps.execute();

	if(active==true)
	{
		out.write("<script type='text/javascript'>\n");
		out.write("alert('User Activated Successfully !!!!!');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/super_admin_pages/Manage_admin.jsp';");
		out.write("</script>\n");
	}
	else
	{
		out.write("<script type='text/javascript'>\n");
		out.write("alert('User Deactivated Successfully !!!!!');\n");
		out.write("window.location.href='http://localhost:9895/SPDC/super_admin_pages/Manage_admin.jsp';");
		out.write("</script>\n");
	}

	


      out.write("\r\n");
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
