package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import java.net.*;

public final class registration_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 public String re;
public int password_gen()
{
Random t=new Random();
return(t.nextInt(100000));

}


public String send_sms(String gsm,String pass,String mob)
{
	String requestUrl ;
	
	String recipient ="+91"+ mob;
	String message = "Login ID:" +gsm+"\n Password:"+pass;
	String username = "admin";
	String password = "admin";
	String originator = "+918281424452";
	

	try {
		requestUrl  = "http://127.0.0.1:9501/api?action=sendmessage&" +
        "username=" + URLEncoder.encode(username, "UTF-8") +
        "&password=" + URLEncoder.encode(password, "UTF-8") + 
        "&recipient=" + URLEncoder.encode(recipient, "UTF-8") + 
        "&messagetype=SMS:TEXT" +
        "&messagedata=" + URLEncoder.encode(message, "UTF-8") +
        "&originator=" + URLEncoder.encode(originator, "UTF-8") +
        "&serviceprovider=SMPP0" +
        "&responseformat=html";
		
		
		
	  URL url = new URL(requestUrl);		  
	  HttpURLConnection uc = (HttpURLConnection)url.openConnection();
	  
	 re=uc.getResponseMessage();
	  
	  
	  

	  uc.disconnect();
	 
	}
	
	
	catch(Exception ex) 
	{
		System.out.println(ex.getMessage());
		
	}
		
	 return re;
}






public void connect()
{
	
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu");
	System.out.println(con);
}
catch(Exception e)
{
	e.printStackTrace();
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

      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

  connect();
  System.out.print("working");
  String gsm=request.getParameter("gsm_id");
  String mob=request.getParameter("mob");
  String pass=String.valueOf(password_gen());
  int flag=0;
  System.out.println(gsm);
  System.out.println(mob);
  System.out.println(pass);
  try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu");
	  System.out.println(con);   
	  Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery("select * from user_profile where mobile_number='"+mob+"'");
	  flag=0;
	  System.out.println(" resultset--------------------->"+ rs);
	 
   
  }
  
  catch(Exception e)
	{
		e.printStackTrace();
	}
  
  try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu");
	  System.out.println(con);   
	  Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery("select * from user_profile where gsm_id='"+gsm+"'");
	  int gsmflag=0;
	  
   
  }
  
  catch(Exception e)
	{
		e.printStackTrace();
	}
 
 
  
  //String sms=send_sms(gsm,pass,mob);
 String sms="k";
  System.out.println(sms);
  
  if (sms!="OK")
  {
	  System.out.println("inside ok");
	  try
	  { 
  		
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu");
		System.out.println(con); 

		//String a="create table registration(gsmid varchar2(30),mobile varchar2(30))";
		//Statement st=con.createStatement();
		//boolean b=st.execute(a);
		System.out.println("GSM--------------------->"+gsm);
		System.out.println("pass--------------------->"+pass);
		System.out.println("mob--------------------->"+mob);
		String sql="insert into USER_PROFILE values(?,?,?)";
		//PreparedStatement pt=con.prepareStatement("insert into USER_PROFILE values(?,?,?)");
		/* System.out.println("pt---------------->"+pt);
		pt.setString(1, gsm);
		pt.setString(2, pass);
		pt.setString(3, mob);
		pt.execute(); */
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, "123456789");
		ps.setString(2, "123456");
		ps.setString(3, "123456");
		ps.setString(4, "123456");
		//ps.setString(5, "123456");
		//ps.setString(6, "123456");
		//ps.setString(7, "123456");
		//ps.setString(8, "123456");
		//ps.setString(9, "123456");
		//ps.setString(10, "123456"); 
		//ps.setString(11, "123456");
		//ps.setString(2, "123456");
		ps.executeUpdate();

 
	}

	catch(Exception e)
	{
		e.printStackTrace();
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
