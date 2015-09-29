package org.apache.jsp.super_005fadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import java.net.*;

public final class view_005fadmin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


		boolean status; 
		
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
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("<title>UserPage</title>\r\n");
      out.write("<!-- BOOTSTRAP STYLES-->\r\n");
      out.write("<link href=\"assets/css/bootstrap.css\" rel=\"stylesheet\" />\r\n");
      out.write("<!-- FONTAWESOME ICONS STYLES-->\r\n");
      out.write("<link href=\"assets/css/font-awesome.css\" rel=\"stylesheet\" />\r\n");
      out.write("<!--CUSTOM STYLES-->\r\n");
      out.write("<link href=\"assets/css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"wrapper\">\r\n");
      out.write("\t\t<nav class=\"navbar navbar-default navbar-cls-top \" role=\"navigation\"\r\n");
      out.write("\t\t\tstyle=\"margin-bottom: 0\">\r\n");
      out.write("\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\"\r\n");
      out.write("\t\t\t\tdata-target=\".sidebar-collapse\">\r\n");
      out.write("\t\t\t\t<span class=\"sr-only\">Toggle navigation</span> <span\r\n");
      out.write("\t\t\t\t\tclass=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span\r\n");
      out.write("\t\t\t\t\tclass=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t\t<a class=\"navbar-brand\" href=\"Manage_admin.jsp\">SPDC </a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"notifications-wrapper\">\r\n");
      out.write("\t\t\t<ul class=\"nav\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<li class=\"dropdown float\"><a class=\"dropdown-toggle\"\r\n");
      out.write("\t\t\t\t\tdata-toggle=\"dropdown\" href=\"#\"> <B>SETTINGS </B> <i\r\n");
      out.write("\t\t\t\t\t\tclass=\"fa fa-user-plus\"></i> <i class=\"fa fa-caret-down\"></i>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"dropdown-menu dropdown-user\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"update.html\"><i class=\"fa fa-user-plus\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\tMy Profile</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"divider\"></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"change_password.jsp\"><i class=\"fa fa-user-plus\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\tChange Password</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"divider\"></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"logout.jsp\"><i class=\"fa fa-sign-out\"></i> Logout</a></li>\r\n");
      out.write("\t\t\t\t\t</ul></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t</nav>\r\n");
      out.write("\t\t<!-- /. NAV TOP  -->\r\n");
      out.write("\t\t<nav class=\"navbar-default navbar-side\" role=\"navigation\">\r\n");
      out.write("\t\t<div class=\"sidebar-collapse\">\r\n");
      out.write("\t\t\t<ul class=\"nav\" id=\"main-menu\">\r\n");
      out.write("\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t<div class=\"user-img-div\">\r\n");
      out.write("\t\t\t\t\t\t<img src=\"assets/img/default.jpg\" class=\"img-circle\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");

				String username=(String)session.getAttribute("spdc");
				
      out.write("\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("                     <li>\r\n");
      out.write("                       <a> <strong> Welcome Super ");
      out.print(username );
      out.write(" </strong></a>\r\n");
      out.write("                    </li>\r\n");
      out.write("\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"Create_admin.jsp\">Create Admin Account</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    \r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"Manage_admin.jsp\">Manage Admin Account</a>\r\n");
      out.write("                        \r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"Manage_rate_cut.jsp\">Manage Rate Cut</a>\r\n");
      out.write("                        \r\n");
      out.write("                    </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t</nav>\r\n");
      out.write("\t\t<!-- /. SIDEBAR MENU (navbar-side) -->\r\n");
      out.write("\t\t");
      out.write("\r\n");
      out.write("\t\t");

		PreparedStatement ps = null;
		ResultSet rs = null;
		
				
				
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
				+"user=root&password=jishnu");
		
		int id = Integer.parseInt(request.getParameter("id"));
		
			
			ps = connection.prepareStatement("select * from SPDC_ADMIN where id =?");
			ps.setInt(1,id);
			rs = ps.executeQuery();
		
      out.write("\r\n");
      out.write("\t\t<div id=\"page-wrapper\" class=\"page-wrapper-cls\">\r\n");
      out.write("\t\t\t<div id=\"page-inner\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"panel-heading\">CUSTOMER DETAILS</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"panel-body\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"table-responsive\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<form method=\"post\" action=\"update_customer_details.jsp?id=");
      out.print(id);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
while(rs.next())
									{
									status = rs.getBoolean(6);
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>USERNAME</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type =\"text\" value=\"");
      out.print(rs.getString(2) );
      out.write("\" name = \"gsm_id\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>Email</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type =\"text\" value=\"");
      out.print(rs.getString(5) );
      out.write("\" name=\"email\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>Mobile Number</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type =\"text\" value=\"");
      out.print(rs.getString(4) );
      out.write("\" name=\"mobile_number\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><a><input type=\"Submit\" value=\"Update\"></a></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><a href=\"customer_reset_password.jsp?id=");
      out.print(id);
      out.write("\"><input type=\"button\" value=\"Reset Password\"></a></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
if(status==true){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"customer_deactivate.jsp?id=");
      out.print(id);
      out.write("\"><input type=\"button\" value=\"Deactivate\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
}
								else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"customer_deactivate.jsp?id=");
      out.print(id);
      out.write("\"><input type=\"button\" value=\"Activate\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><a href=\"delete_customer.jsp?id=");
      out.print(id);
      out.write("\"><input type=\"button\" value=\"Delete\"></a></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><a href=\"customers.jsp\"><input type=\"button\" value=\"cancel\"></a></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<footer> &copy; 2015 YourCompany | By : <a\r\n");
      out.write("\t\t\thref=\"http://www.designbootstrap.com/\" target=\"_blank\"></a> </footer>\r\n");
      out.write("\t\t<!-- /. FOOTER  -->\r\n");
      out.write("\t\t<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->\r\n");
      out.write("\t\t<!-- JQUERY SCRIPTS -->\r\n");
      out.write("\t\t<script src=\"assets/js/jquery-1.11.1.js\"></script>\r\n");
      out.write("\t\t<!-- BOOTSTRAP SCRIPTS -->\r\n");
      out.write("\t\t<script src=\"assets/js/bootstrap.js\"></script>\r\n");
      out.write("\t\t<!-- METISMENU SCRIPTS -->\r\n");
      out.write("\t\t<script src=\"assets/js/jquery.metisMenu.js\"></script>\r\n");
      out.write("\t\t<!-- CUSTOM SCRIPTS -->\r\n");
      out.write("\t\t<script src=\"assets/js/custom.js\"></script>\r\n");
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
