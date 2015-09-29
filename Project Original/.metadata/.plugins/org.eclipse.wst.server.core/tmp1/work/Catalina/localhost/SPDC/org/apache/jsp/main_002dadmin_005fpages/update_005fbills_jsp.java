package org.apache.jsp.main_002dadmin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;

public final class update_005fbills_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


double lt_first,lt_second,lt_third,lt_fourth,lt_meter,lt_sms,fine_amount=0;

public void send_sms(int unit,double amount,int current_unit,int previous_unit,String mobile_number,String gsm,String pay_without_fail,String pay_with_fail,double fine_amount)
{
	String requestUrl ;	
	String recipient =mobile_number;
	String message = "Electricity Bill:\n GSM ID:" +gsm+"\n Previous Reading:"+previous_unit+"\n Current Reading:"+current_unit+"\n Consumed Unit:"+unit+"\n Amount to be paid:"+amount+"\n last date without due:"+pay_without_fail+"\n last date with fine:"+pay_with_fail+"\n Fine Amount:"+fine_amount;
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

public boolean isNumeric(String str)
{
    for (char c : str.toCharArray())
    {
        if (!Character.isDigit(c)) return false;
    }
    return true;
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
      out.write("\t");

	
	
	/*-------------------------Variables------------------*/	
	int previous_unit = 0;
	int current_unit = 0;
	int unit = 0;
	double amount = 0;
	String type_connection,mobile_number = null;
	
	
	

	PreparedStatement ps = null;
	ResultSet rs = null;

	

	/*---------------------------DB Connection -----------------------------*/
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
		+"user=root&password=jishnu");


	Calendar c = Calendar.getInstance();
	/*---------------------Current month and year------------------------*/
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
	String current_month = sdf.format(Calendar.getInstance().getTime());
	System.out.println(current_month);

	/*---------------------Previous month and year------------------------*/
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.MONTH, -1);
	String previous_month = new SimpleDateFormat("yy-MM").format(cal.getTime());
	System.out.println(previous_month);

	
	/*---------------------pay_without_fail------------------------*/
	Calendar cale = Calendar.getInstance();
	cale.add(Calendar.DAY_OF_MONTH, +15);
	java.util.Date ccc= cale.getTime();
	java.sql.Date pay_without_fail = new java.sql.Date (ccc.getTime());
	
	String pay_without_fail1 = new SimpleDateFormat("yyyy-MM-dd").format(cale.getTime());
	System.out.println(pay_without_fail);
	
	
	/*---------------------pay_with_fail------------------------*/
	Calendar calen = Calendar.getInstance();
	calen.add(Calendar.DAY_OF_MONTH, +25);
	java.util.Date cc= calen.getTime();
	java.sql.Date pay_with_fail = new java.sql.Date (cc.getTime());
	String pay_with_fail1 = new SimpleDateFormat("yyyy-MM-dd").format(calen.getTime());
	
	System.out.println(pay_with_fail);
	

	/*---------------------------DB Date format-------------------*/
	java.util.Date date = Calendar.getInstance().getTime();
	java.sql.Date sqlDate = new java.sql.Date(date.getTime()); 

	/*---------------current date-------*/
	SimpleDateFormat sdf_date = new SimpleDateFormat("dd");
	String current_date = sdf_date.format(Calendar.getInstance().getTime());
	
	System.out.println("checking");
	
	File file = new File("E:\\inputsms.txt");
	
	if(current_date.equals("27"))
	{
		
	
	/*------------------ rates----------------------*/
	ps = connection.prepareStatement("select * from SPDC_LT");
	rs = ps.executeQuery();
	while(rs.next())
	{
		if(rs.getString(2).equals("LT1A"))
		{
			lt_first = rs.getDouble(3);
			lt_second = rs.getDouble(4);
			lt_third = rs.getDouble(5);
			lt_fourth = rs.getDouble(6);
			lt_meter = rs.getInt(7);
			lt_sms = rs.getInt(8);
		}
		/* else
		{
			lt5_first = rs.getDouble(3);	
			lt5_meter = rs.getInt(7);
			lt5_sms = rs.getInt(8);
		} */
	}

	/*--------------------------------File Reading------------------------------------*/
	
	
	
	if(file.exists())
	{
	FileReader fr = new FileReader("E:/inputsms.txt");
		BufferedReader br = new BufferedReader(fr);
		String line = br.readLine();
		while (line != null) {
			String[] parts = line.split(" ");
			System.out.println(parts[0]);// mobile number
			System.out.println(parts[1]);// reading
			
			boolean check = isNumeric(parts[1]);
			if(check == true)
			{
				/*------------------------ Checks the gsm id is registered with us -----------------*/

			ps = connection.prepareStatement("select * from spdc_user_profile where gsm_id = ?");
			ps.setString(1, parts[0]);
			rs = ps.executeQuery();
			if (rs.next()) {
					type_connection = rs.getString(15);
					mobile_number = rs.getString(5);
					
					/*------------------ rates----------------------*/
					/* ps = connection.prepareStatement("select * from SPDC_LT where connection_type = ?");
					ps.setString(1, type_connection);
					rs = ps.executeQuery();
					if(rs.next())
					{
						if(type_connection.equals("LT1A"))
						{
							lt_first = rs.getDouble(3);
							lt_second = rs.getDouble(4);
							lt_third = rs.getDouble(5);
							lt_fourth = rs.getDouble(6);
							lt_meter = rs.getInt(7);
							lt_sms = rs.getInt(8);
						}
						else
						{
							lt_first = rs.getDouble(3);	
							lt_meter = rs.getInt(7);
							lt_sms = rs.getInt(8);
						}
					} */
					
					
					/*------------------ checks whether the bill is genereted for the current month --------------------*/
					ps = connection.prepareStatement("select * from spdc_bills where gsm_id = ? and insert_date like '%"+current_month+"%'");
					ps.setString(1, parts[0]);
					rs = ps.executeQuery();
					if (!rs.next()) {

							/*-----------------------------Collecting previous bill data-------------------------------*/
							ps = connection.prepareStatement("select * from spdc_bills where gsm_id = ? and insert_date like '%"+previous_month+"%'");
							ps.setString(1, parts[0]);
							rs = ps.executeQuery();
							if (rs.next()) {
									previous_unit = rs.getInt(4);
									current_unit = Integer.parseInt(parts[1]);
									unit = current_unit - previous_unit;
							}
							else
							{	previous_unit = 0;
								current_unit = Integer.parseInt(parts[1]);
								unit = 	current_unit - previous_unit;
							}
							if (type_connection.equals("LT1A"))
							{	
								for (int i = 0; i < unit; i++)
								{
									if(i > 150)
										amount = amount + lt_fourth;
									else if(i > 120)
										amount = amount + lt_third;
									else if(i > 80)
										amount = amount + lt_second;
									else
										amount = amount + lt_first;
								}
								amount = amount+lt_meter;
								amount = amount+lt_sms;
								amount = amount+(amount * 0.1);
							}
							
							fine_amount = amount + 50;
							ps = connection.prepareStatement("insert into SPDC_BILLS (GSM_ID,UNIT,AMOUNT,INSERT_DATE,current_reading, previous_reading,without_fine,with_fine) values (?,?,?,?,?,?,?,?)");
							ps.setString(1, parts[0]);
							ps.setInt(2, unit );
							ps.setDouble(3, amount);
							ps.setDate(4,sqlDate);
							ps.setInt(5, current_unit);
							ps.setInt(6, previous_unit);
							ps.setDate(7,pay_without_fail);
							ps.setDate(8,pay_with_fail);
							ps.execute(); 
							send_sms(unit,amount,current_unit,previous_unit,mobile_number,parts[0],pay_without_fail1,pay_with_fail1,fine_amount);
							
							/*--------------sending code pending--------------------*/
					}
			}
			
		}	
			line = br.readLine();
		}
		fr.close();
		}
		
		
	
	}
		if(file.delete())
		{
			System.out.println("File Deleted Successfully");
		}
		else{
			System.out.println("File not Deleted Successfully");	
		} 
		
	
	
	
		/* // Creating table name for bills table by the current month and year
		Calendar calendar = Calendar.getInstance();//calender oblect
		int yr = calendar.get(Calendar.YEAR);//current year datatype in INT
		int current_mth = calendar.get(Calendar.MONTH) + 1;//current month datatype in INT
		int previous_mth = current_mth - 1;//previous month datatype in INT

		//Converting current month, previous month and year to String Format
		String current_year = Integer.toString(yr);
		String current_month = Integer.toString(current_mth);
		String previous_month = Integer.toString(previous_mth);

		//Table name creation for Current month
		String bill = "BILLS_" + current_month + "_" + current_year;
		System.out.println(bill);
		//Table name creation for previous month
		String previous_bill = "BILLS_" + previous_month + "_"
				+ current_year;
		System.out.println(previous_bill);

		//DB connection
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "jishnu");

		//Query section

		String query_previous_reading = "select * from " + previous_bill
				+ " where gsm_id=?";
		String query_insert_current_bill = "insert into " + bill
				+ " values(?,?,?,?,?,?)";
		String query_current_table = "select * from " + bill;
		String query_table_creation = "create table "
				+ bill
				+ " (gsm_id varchar2(10) primary key references user_profile(gsm_id) ,previous_reading number default 0, current_reading number,unit number, amount number, paid varchar2(10) default 'not paid')";
		String query_user_exists_in_user_table = "select * from user_profile where gsm_id=?";
		String query_user_exists_in_current_bill_table = "select * from "
				+ bill + " where gsm_id=?";

		System.out.println(query_current_table);

		// variable declaration
		PreparedStatement ps = null;
	
		// for file contents variable
		String from_file_gsm_id = null;
		int from_file_reading;
		File file = new File("c:/inputsms.txt");

		int previous_reading = 0;
		int unit = 0;
		int amount = 0;

		//Creating Table if the table is not existing.
		ps = connection.prepareStatement("select * from USER_TABLES where table_name ='"+ bill + "'");
		ResultSet rs_check_current_table = ps.executeQuery();
		//System.out.println(rs_check_current_table);
		if (rs_check_current_table.next()) {
			//table exists
			System.out.println("Table exists");
		} else {
			//table not exists
			System.out.println("Table not exists");
			ps = connection.prepareStatement(query_table_creation);
			System.out.println(ps.executeQuery());

		}

		//reading message form the file
		FileReader fr = new FileReader("E:/inputsms.txt");
		BufferedReader br = new BufferedReader(fr);
		String line = br.readLine();
		while (line != null) {
			String[] parts = line.split(" ");
			System.out.println(parts[0]);
			System.out.println(parts[1]);

			previous_reading = 0;
			unit = 0;
			amount = 0;
			from_file_gsm_id = parts[0];// copying gsm_id
			from_file_reading = Integer.parseInt(parts[1]);// copying reading after converting to integer

			//checking gsm_id is exists or not in user_profile table
			ps = connection.prepareStatement(query_user_exists_in_user_table);
			ps.setString(1, from_file_gsm_id);
			ResultSet user_exists_in_user_table = ps.executeQuery();

			if (user_exists_in_user_table.next()) {
				//checking gsm_id is exists or not in bill table
				ps = connection.prepareStatement(query_user_exists_in_current_bill_table);
				ps.setString(1, from_file_gsm_id);
				ResultSet user_exists_in_current_bill_table = ps.executeQuery();
				if (!user_exists_in_current_bill_table.next()) {

					//Checking Previous Table to collect previous reading
					ps = connection.prepareStatement(query_previous_reading);
					ps.setString(1, from_file_gsm_id);
					ResultSet rs_previous_reading = ps.executeQuery();
					while (rs_previous_reading.next()) {
						System.out.println("table exists");
						previous_reading = rs_previous_reading.getInt(3);
						System.out.println("inside" + previous_reading);
					}
					System.out.println(previous_reading);

					//finding consuming unit
					unit = from_file_reading - previous_reading;

					//finding amount to pay unit charge = 2
					amount = unit * 2;

					//inserting to table
					ps = connection.prepareStatement(query_insert_current_bill);
					ps.setString(1, from_file_gsm_id);
					ps.setInt(2, previous_reading);
					ps.setInt(3, from_file_reading);
					ps.setInt(4, unit);
					ps.setInt(5, amount);
					ps.setString(6, "not paid");
					ps.execute();

				}
			}
			line = br.readLine();//next line
			//end of file reading
		}
		
		//delete the inbox file
		if(file.delete())
		{
			System.out.println("File Deleted Successfully");
		}
		else{
			System.out.println("File not Deleted Successfully");	
		} */
	
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
