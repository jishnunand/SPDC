package org.apache.jsp.main_005fweb_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class CheckTable_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("\t\t<title>Insert title here</title>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t");

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
				+"user=root&password=jishnu");

		PreparedStatement ps = null;
		ResultSet rs = null;

		ps = connection.prepareStatement("select * from information_schema.tables where table_schema='SPDC' and table_name='SPDC_ADMIN'");
		rs = ps.executeQuery();
		if (rs.next())
		{
			System.out.println("SPDC_ADMIN Table Exists");
		}
		else
		{
			System.out.println("SPDC_ADMIN Table not Exists");
			ps = connection.prepareStatement("create table SPDC_ADMIN(id int primary key AUTO_INCREMENT, username varchar(30) unique, password varchar(30), mobile_number varchar(13) unique, email varchar(50) unique, status Boolean default true,super_user Boolean default false)");
			ps.execute();
			ps = connection.prepareStatement("insert into spdc_admin(username,password,super_user) values('admin','admin',true)");
			ps.execute();
		}


		ps = connection.prepareStatement("select * from information_schema.tables where table_schema='SPDC' and table_name='SPDC_USER_PROFILE'");
		rs = ps.executeQuery();
		if (rs.next())
		{
			System.out.println("SPDC_USER_PROFILE Table Exists");
		}
		else
		{
			System.out.println("SPDC_USER_PROFILE Table not Exists");
			ps = connection.prepareStatement("create table SPDC_USER_PROFILE(id int primary key auto_increment,gsm_id varchar(13) unique ,password varchar(50) ,email varchar(50) unique,mobile_number varchar(13) unique,customer_name varchar(50),date_of_birth date,house_no varchar(20),post varchar(20),city varchar(20),districts varchar(20),state varchar(20),country varchar(20),is_active boolean default true ,connection_type varchar(10),status boolean default True) ENGINE=INNODB");
			ps.execute();
		}


		ps = connection.prepareStatement("select * from information_schema.tables where table_schema='SPDC' and table_name='SPDC_BILLS'");
		rs = ps.executeQuery();
		if (rs.next())
		{
			System.out.println("SPDC_BILLS Table Exists");
		}
		else
		{
			System.out.println("SPDC_BILLS Table not Exists");
			ps = connection.prepareStatement("create table SPDC_BILLS(id int primary key auto_increment, gsm_id varchar(13), previous_reading int default 0, current_reading int, unit int,amount double, paid varchar(10) default 'not paid' ,connection_type varchar(10),insert_date date,without_fine date,with_fine date, FOREIGN KEY (gsm_id) references SPDC_USER_PROFILE(gsm_id) ON DELETE CASCADE)ENGINE=INNODB");
			ps.execute();
		}


		ps = connection.prepareStatement("select * from information_schema.tables where table_schema='SPDC' and table_name='SPDC_QUERY'");
		rs = ps.executeQuery();
		if (rs.next())
		{
			System.out.println("SPDC_QUERY Table Exists");
		}
		else
		{
			System.out.println("SPDC_QUERY Table not Exists");
			ps = connection.prepareStatement("create table SPDC_QUERY (id int primary key auto_increment,gsm_id varchar(13), subject text, user_query text, admin_replay text,user_insert date,admin_insert date,FOREIGN KEY (gsm_id) references SPDC_USER_PROFILE(gsm_id) ON DELETE CASCADE) ENGINE=INNODB");
			ps.execute();
		}
		
		
		
		ps = connection.prepareStatement("select * from information_schema.tables where table_schema='SPDC' and table_name='SPDC_LT'");
		rs = ps.executeQuery();
		if (rs.next())
		{
			System.out.println("SPDC_QUERY Table Exists");
		}
		else
		{
			System.out.println("SPDC_LT Table not Exists");
			ps = connection.prepareStatement("create table SPDC_LT (id int primary key auto_increment,connection_type varchar(13), first double, second double, third double, fourth double, meter int,sms int) ENGINE=INNODB");
			ps.execute();
			ps = connection.prepareStatement("insert into spdc_lt(connection_type,first,second,third,fourth,meter,sms) values ('LT1A',1.8,1.5,1.3,1.4,40,20)");
			ps.execute();
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
