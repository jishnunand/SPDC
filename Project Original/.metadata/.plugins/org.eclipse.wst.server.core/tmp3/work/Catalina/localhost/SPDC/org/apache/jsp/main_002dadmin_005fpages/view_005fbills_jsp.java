package org.apache.jsp.main_002dadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.io.*;
import java.util.*;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.sql.*;
import java.util.Properties;
import java.net.*;

public final class view_005fbills_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("\t<meta charset=\"utf-8\" />\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("\t<title>UserPage</title>\r\n");
      out.write("\t<!-- BOOTSTRAP STYLES-->\r\n");
      out.write("\t<link href=\"assets/css/bootstrap.css\" rel=\"stylesheet\" />\r\n");
      out.write("\t<!-- FONTAWESOME ICONS STYLES-->\r\n");
      out.write("\t<link href=\"assets/css/font-awesome.css\" rel=\"stylesheet\" />\r\n");
      out.write("\t<!--CUSTOM STYLES-->\r\n");
      out.write("\t<link href=\"assets/css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("\t\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
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
      out.write("\t\t\t<a class=\"navbar-brand\" href=\"customers.jsp\">SPDC </a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"notifications-wrapper\">\r\n");
      out.write("\t\t\t<ul class=\"nav\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<li class=\"dropdown\"><a class=\"dropdown-toggle\"\r\n");
      out.write("\t\t\t\t\tdata-toggle=\"dropdown\" href=\"#\"> <B>SETTINGS </B> <i\r\n");
      out.write("\t\t\t\t\t\tclass=\"fa fa-user-plus\"></i> <i class=\"fa fa-caret-down\"></i>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"dropdown-menu dropdown-user\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"editprofile.jsp\"><i class=\"fa fa-user-plus\"></i>\r\n");
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
      out.write("\t\t\t\t");

				String username=(String)session.getAttribute("spdc");
				
      out.write("\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t<li><a> <strong> Welcome ");
      out.print(username);
      out.write(" </strong></a></li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<li><a class=\"active-menu\" href=\"customers.jsp\">Customers</a></li>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<li><a href=\"Registration_form.jsp\">Registration</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!-- <li><a href=\"Payment.html\">Payments</a></li> -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<li><a>Bill Details <span><i\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"fa fa-caret-down\"></i></span></a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-second-level\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"view_bills.jsp\">View Bill</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"meterproblem.jsp\">Meter Issues</a></li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul></li>\r\n");
      out.write("\t\t\t\t<li><a  href=\"queries_main.jsp\">Read Queries</a>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t</nav>\r\n");
      out.write("\t\t<!-- /. SIDEBAR MENU (navbar-side) -->\r\n");
      out.write("\t\t<div id=\"page-wrapper\" class=\"page-wrapper-cls\">\r\n");
      out.write("\t\t\t<div id=\"page-inner\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t\t\t<!-- <div class=\"panel-heading\">Current Bills Not Paid</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"panel-body\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"table-responsive\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<table class=\"table table-striped table-bordered table-hover\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<th>GSM_ID</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<th>Bill No</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<th>Unit</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<th>Amount</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<th>Payment</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>NEC0912016</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>1</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>121</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td>1000</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<td><button>Pay Bill</button></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div> \r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<hr />\r\n");
      out.write("\t\t\t\t\t\t<hr />-->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<form>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"radio\" name=\"full\" value=\"his\"><b>By\r\n");
      out.write("\t\t\t\t\t\t\t\tLast 6 Months &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type=\"radio\"\r\n");
      out.write("\t\t\t\t\t\t\t\tname=\"full\" value=\"her\">All Bills \r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<hr />\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");

						Calendar c = Calendar.getInstance();
						/*---------------------Current month and year------------------------*/
						/* String current_month = new SimpleDateFormat("yyyy-MMM").format(c.getTime()).toUpperCase();
						System.out.println(current_month); */
						
						SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
						String current_month = sdf.format(Calendar.getInstance().getTime());
						
						PreparedStatement ps =null;
						ResultSet rs = null;
						
						Class.forName("com.mysql.jdbc.Driver");
						Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
								+"user=root&password=jishnu");
						
						
						String all_bills = "select * from spdc_bills";
						ps = connection.prepareStatement("select * from spdc_bills where insert_date like '%"+current_month+"%'");
						rs = ps.executeQuery();
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"panel-heading\">Customers</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"panel-body\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"table-responsive\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<table class=\"table table-striped table-bordered table-hover\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>GSM ID</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Previous Reading</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Current Reading</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Unit Consumed</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Amount</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Payment</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
while(rs.next())
										{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print(rs.getString(2) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print(rs.getInt(3) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print(rs.getInt(4) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print(rs.getInt(5) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>");
      out.print(rs.getInt(6) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
if(rs.getString(7).equals("not paid")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<a href='http://localhost:9895/SPDC/payment/payment.jsp?id=");
      out.print(rs.getInt(1) );
      out.write("'><button type=\"button\">Pay Bill</button></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

										}
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<footer> &copy; 2015 YourCompany | By : <a\r\n");
      out.write("\t\t\t\thref=\"http://www.designbootstrap.com/\" target=\"_blank\"></a> </footer>\r\n");
      out.write("\t\t\t<!-- /. FOOTER  -->\r\n");
      out.write("\t\t\t<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->\r\n");
      out.write("\t\t\t<!-- JQUERY SCRIPTS -->\r\n");
      out.write("\t\t\t<script src=\"assets/js/jquery-1.11.1.js\"></script>\r\n");
      out.write("\t\t\t<!-- BOOTSTRAP SCRIPTS -->\r\n");
      out.write("\t\t\t<script src=\"assets/js/bootstrap.js\"></script>\r\n");
      out.write("\t\t\t<!-- METISMENU SCRIPTS -->\r\n");
      out.write("\t\t\t<script src=\"assets/js/jquery.metisMenu.js\"></script>\r\n");
      out.write("\t\t\t<!-- CUSTOM SCRIPTS -->\r\n");
      out.write("\t\t\t<script src=\"assets/js/custom.js\"></script>\r\n");
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
