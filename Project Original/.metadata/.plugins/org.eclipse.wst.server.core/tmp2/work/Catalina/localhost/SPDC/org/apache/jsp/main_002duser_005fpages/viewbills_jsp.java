package org.apache.jsp.main_002duser_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import java.net.*;
import java.text.SimpleDateFormat;

public final class viewbills_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t\t");

        String username=(String)session.getAttribute("spdc");
        
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("    <title>Hai ");
      out.print(username);
      out.write("</title>\r\n");
      out.write("    <!-- BOOTSTRAP STYLES-->\r\n");
      out.write("    <link href=\"assets/css/bootstrap.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <!-- FONTAWESOME ICONS STYLES-->\r\n");
      out.write("    <link href=\"assets/css/font-awesome.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <!--CUSTOM STYLES-->\r\n");
      out.write("    <link href=\"assets/css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <script src=\"assets/js/jquery-1.10.2.js\"></script>\r\n");
      out.write("  <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("    $(document).ready(function(){\r\n");
      out.write("    \t$(\".all_bills\").hide();\r\n");
      out.write("    \t$(\".all_bills_btn\").click(function(){\r\n");
      out.write("        \t$(\".all_bills\").toggle();\r\n");
      out.write("    });\r\n");
      out.write("    });\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"wrapper\">\r\n");
      out.write("        <nav class=\"navbar navbar-default navbar-cls-top \" role=\"navigation\" style=\"margin-bottom: 0\">\r\n");
      out.write("            <div class=\"navbar-header\">\r\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".sidebar-collapse\">\r\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                </button>\r\n");
      out.write("                <a  class=\"navbar-brand\" href=\"index.jsp\">SPDC\r\n");
      out.write("\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"notifications-wrapper\">\r\n");
      out.write("<ul class=\"nav\">\r\n");
      out.write("               \r\n");
      out.write("                              <li class=\"dropdown float\">\r\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n");
      out.write("                    <B>SETTINGS </B>\r\n");
      out.write("                        <i class=\"fa fa-user-plus\"></i>  <i class=\"fa fa-caret-down\"></i>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu dropdown-user\">\r\n");
      out.write("                     <li><a href=\"editprofile.jsp\"><i class=\"fa fa-user-plus\"></i> Edit Profile</a></li>\r\n");
      out.write("                        <li class=\"divider\"></li>\r\n");
      out.write("                        <li><a href=\"changepw.jsp\"><i class=\"fa fa-user-plus\"></i> Change Password</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"divider\"></li>\r\n");
      out.write("                        <li><a href=\"logout.jsp\"><i class=\"fa fa-sign-out\"></i> Logout</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("        <!-- /. NAV TOP  -->\r\n");
      out.write("        <nav  class=\"navbar-default navbar-side\" role=\"navigation\">\r\n");
      out.write("            <div class=\"sidebar-collapse\">\r\n");
      out.write("                <ul class=\"nav\" id=\"main-menu\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <div class=\"user-img-div\">\r\n");
      out.write("                            <img src=\"assets/img/default.jpg\" class=\"img-circle\" />\r\n");
      out.write("\r\n");
      out.write("                           \r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                    </li>\r\n");
      out.write("                     <li>\r\n");
      out.write("                      <a>  <strong> Welcome ");
      out.print(username);
      out.write(" </strong></a>\r\n");
      out.write("                    </li>\r\n");
      out.write("\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"index.jsp\">");
      out.print(username);
      out.write(" Home</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    \r\n");
      out.write("                   \r\n");
      out.write("                    \r\n");
      out.write("                        \r\n");
      out.write("                    \r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a >Bill Details <span ><i class=\"fa fa-caret-down\"></i></span></a>\r\n");
      out.write("                         <ul class=\"nav nav-second-level\">\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a class=\"active-menu\" href=\"viewbills.jsp\">View Bill</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            \r\n");
      out.write("                            \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a  href=\"Query view.jsp\">Connect Us</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                 \r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </nav>\r\n");
      out.write("        <!-- /. SIDEBAR MENU (navbar-side) -->\r\n");
      out.write("        <div id=\"page-wrapper\" class=\"page-wrapper-cls\">\r\n");
      out.write("            <div id=\"page-inner\">\r\n");
      out.write("                <div class=\"row\">\r\n");
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
						
						
						
						ps = connection.prepareStatement("select * from spdc_bills where gsm_id=? and insert_date like '%"+current_month+"%'");
						ps.setString(1, username);
						rs = ps.executeQuery();
						
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"panel panel-default\">\r\n");
      out.write("                        <div class=\"panel-heading\">\r\n");
      out.write("                            Current Bill\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"panel-body\">\r\n");
      out.write("                            <div class=\"table-responsive\">\r\n");
      out.write("                                <table class=\"table table-striped table-bordered table-hover\">\r\n");
      out.write("                                    <thead>\r\n");
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
      out.write("                                </table>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("<hr/>\r\n");
      out.write("      \r\n");
      out.write("\r\n");
      out.write("           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type=\"button\" value=\"All Bills\" class=\"all_bills_btn\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("      <hr/>\r\n");
      out.write("\r\n");

ps = connection.prepareStatement("select * from spdc_bills where gsm_id=?");
ps.setString(1, username);
rs = ps.executeQuery();

      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"panel panel-default all_bills\">\r\n");
      out.write("                        <div class=\"panel-heading\">\r\n");
      out.write("                            All Bills\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"panel-body\">\r\n");
      out.write("                            <div class=\"table-responsive\">\r\n");
      out.write("                                <table class=\"table table-striped table-bordered table-hover\">\r\n");
      out.write("                                    <thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>GSM ID</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Previous Reading</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Current Reading</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Unit Consumed</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Date</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Amount</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<th>Status</th>\r\n");
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
      out.print(rs.getDate(9) );
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
}else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
      out.print(rs.getString(7) );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

										}
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("                                </table>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <footer >\r\n");
      out.write("        &copy; 2015 YourCompany | By : <a href=\"http://www.designbootstrap.com/\" target=\"_blank\"></a>\r\n");
      out.write("    </footer>\r\n");
      out.write("    <!-- /. FOOTER  -->\r\n");
      out.write("    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->\r\n");
      out.write("    <!-- JQUERY SCRIPTS -->\r\n");
      out.write("    <script src=\"assets/js/jquery-1.11.1.js\"></script>\r\n");
      out.write("    <!-- BOOTSTRAP SCRIPTS -->\r\n");
      out.write("    <script src=\"assets/js/bootstrap.js\"></script>\r\n");
      out.write("    <!-- METISMENU SCRIPTS -->\r\n");
      out.write("    <script src=\"assets/js/jquery.metisMenu.js\"></script>\r\n");
      out.write("    <!-- CUSTOM SCRIPTS -->\r\n");
      out.write("    <script src=\"assets/js/custom.js\"></script>\r\n");
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
