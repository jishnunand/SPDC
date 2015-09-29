package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;

public final class payment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("  \r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\r\n");
      out.write("    \r\n");
      out.write("    <script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600' rel='stylesheet' type='text/css'>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

String id = request.getParameter("id");

      out.write("\r\n");
      out.write("<div class=\"column column2 center\">\r\n");
      out.write("\t\t<div class=\"content\" id=\"payment\">\r\n");
      out.write("\t\t\t<div class=\"left\">\r\n");
      out.write("\t\t\t<form action=\"http://localhost:9895/SPDC/payment/paycon.jsp?\" class=\"go-right\" method=\"post\">\r\n");
      out.write("\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"");
      out.print(id);
      out.write("\" name=\"id\">\r\n");
      out.write("\t\t\t\t<input  type=\"text\" name=\"card_number\" value=\"\" id=\"card_number\" placeholder=\"xxxx-xxxx-xxxx-xxxx\" data-trigger=\"change\" data-validation-minlength=\"1\" data-type=\"name\" data-required=\"true\" data-error-message=\"Enter Your Credit Card Number\" /><label >Card Number</label>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t  <div class=\"expiry\">\t\r\n");
      out.write("\t\t\t\t      <div class=\"month_select\">\r\n");
      out.write("\t\t\t\t        <select required name=\"exp_month\" value=\"\" id=\"exp_month\" placeholder=\"\" data-trigger=\"change\" data-type=\"name\" data-required=\"true\" data-error-message=\"Enter Your Credit Card Expiration Date\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value = \"1\">01 (Jan)</option>\r\n");
      out.write("                   \t\t\t<option value = \"2\">02 (Feb)</option>\r\n");
      out.write("                   \t\t\t<option value = \"3\">03 (Mar)</option>\r\n");
      out.write("                   \t\t\t<option value = \"4\">04 (Apr)</option>\r\n");
      out.write("                   \t\t\t<option value = \"5\">05 (May)</option>\r\n");
      out.write("                   \t\t\t<option value = \"6\">06 (Jun)</option>\r\n");
      out.write("                   \t\t\t<option value = \"7\">07 (Jul)</option>\r\n");
      out.write("                   \t\t\t<option value = \"8\">08 (Aug)</option>\r\n");
      out.write("                   \t\t\t<option value = \"9\">09 (Sep)</option>\r\n");
      out.write("                   \t\t\t<option value = \"10\">10 (Oct)</option>\r\n");
      out.write("                   \t\t\t<option value = \"11\">11 (Nov)</option>\r\n");
      out.write("                   \t\t\t<option value = \"12\">12 (Dec)</option>\r\n");
      out.write("                        </select>\r\n");
      out.write("                      </div>\r\n");
      out.write("                      <div class=\"year_select\">\r\n");
      out.write("\t\t\t\t        <select name=\"exp_year\" value=\"\" id=\"exp_year\" placeholder=\"\" data-trigger=\"change\" data-type=\"name\" data-required=\"true\" data-error-message=\"Enter Your Credit Card Expiration Date\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value = \"1\">14 </option>\r\n");
      out.write("                   \t\t\t<option value = \"2\">15 (Feb)</option>\r\n");
      out.write("                   \t\t\t<option value = \"3\">16 (Mar)</option>\r\n");
      out.write("                   \t\t\t<option value = \"4\">17 (Apr)</option>\r\n");
      out.write("                   \t\t\t<option value = \"5\">18 (May)</option>\r\n");
      out.write("                   \t\t\t<option value = \"6\">19 (Jun)</option>\r\n");
      out.write("                   \t\t\t<option value = \"7\">20 (Jul)</option>\r\n");
      out.write("                   \t\t\t<option value = \"8\">22 (Aug)</option>\r\n");
      out.write("                   \t\t\t<option value = \"9\">23 (Sep)</option>\r\n");
      out.write("                   \t\t\t<option value = \"10\">24 (Oct)</option>\r\n");
      out.write("                   \t\t\t<option value = \"11\">25 (Nov)</option>\r\n");
      out.write("                   \t\t\t<option value = \"12\">26 (Dec)</option>\r\n");
      out.write("                        </select>\r\n");
      out.write("            \t      </div>\r\n");
      out.write("                  <label class=\"exp_date\" for=\"Exp_Date\">Exp Date</label>\r\n");
      out.write("            \t    </div>\r\n");
      out.write("            \t  </div>\r\n");
      out.write("            \t<div class=\"sec_num\">\r\n");
      out.write("              <div>\r\n");
      out.write("\t\t\t\t        <input  type=\"text\" name=\"ccv\" value=\"\" id=\"ccv\" placeholder=\"123\" data-trigger=\"change\" data-validation-minlength=\"3\" data-type=\"name\" data-required=\"true\" data-error-message=\"Enter Your Card Security Code\"/><label for=\"ccv\">Security Code</label>\r\n");
      out.write("\t\t\t\t      </div>\r\n");
      out.write("\t\t\t\t      </div>\r\n");
      out.write("\t\t\t\t      <div class=\"right\">\r\n");
      out.write("\t\t\t\t<div class=\"accepted\">\r\n");
      out.write("\t\t\t\t\t<span><img src=\"img/Z5HVIOt.png\"></span>\r\n");
      out.write("\t\t\t\t\t<span><img src=\"img/Le0Vvgx.png\"></span>\r\n");
      out.write("\t\t\t\t\t<span><img src=\"img/D2eQTim.png\"></span>\r\n");
      out.write("\t\t\t\t\t<span><img src=\"img/Pu4e7AT.png\"></span>\r\n");
      out.write("\t\t\t\t\t<span><img src=\"img/ewMjaHv.png\"></span>\r\n");
      out.write("\t\t\t\t\t<span><img src=\"img/3LmmFFV.png\"></span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"secured\">\r\n");
      out.write("\t\t\t\t\t<img class=\"lock\" src=\"img/lock.png\">\r\n");
      out.write("\t\t\t\t\t<p class=\"security info\">What, well you mean like a date? Doc? Am I to understand you're still hanging around with Doctor Emmett Brown, McFly? Tardy slip for you, Miss Parker. And one for you McFly I believe that makes four in a row.</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<input type=\"submit\" value=\"Continue\" class=\"continue\" >\r\n");
      out.write("\t\t\t      </form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write(" \t\t</div>\r\n");
      out.write(" \t</div>\r\n");
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
