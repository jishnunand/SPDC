<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.FileWriter" %>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.net.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
/*-------------------------Variables------------------*/	
int previous_unit = 0;
int current_unit = 0;
int unit = 0;
double amount = 0;
String type_connection = null;

PreparedStatement ps = null;
ResultSet rs = null;



/*---------------------------DB Connection -----------------------------*/
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu"); 


Calendar c = Calendar.getInstance();
/*---------------------Current month and year------------------------*/
String current_month = new SimpleDateFormat("MMM-yy").format(c.getTime()).toUpperCase();
System.out.println(current_month);

/*---------------------Previous month and year------------------------*/
Calendar cal = Calendar.getInstance();
cal.add(Calendar.MONTH, -1);
String previous_month = new SimpleDateFormat("MMM-yy").format(cal.getTime()).toUpperCase();
out.println(previous_month);


/*---------------------------DB Date format-------------------*/
java.util.Date date = Calendar.getInstance().getTime();
java.sql.Date sqlDate = new java.sql.Date(date.getTime()); 


/*--------------------------------File Reading------------------------------------*/
FileReader fr = new FileReader("E:/inputsms.txt");
	BufferedReader br = new BufferedReader(fr);
	String line = br.readLine();
	while (line != null) {
		String[] parts = line.split(" ");
		System.out.println(parts[0]);// mobile number
		System.out.println(parts[1]);// reading


			/*------------------------ Checks the gsm id is registered with us -----------------*/

		ps = connection.prepareStatement("select * from spdc_user_profile where gsm_id = ?");
		ps.setString(1, parts[0]);
		rs = ps.executeQuery();
		if (rs.next()) {
				type_connection = rs.getString(13);
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
								previous_unit = rs.getInt(3);
								current_unit = Integer.parseInt(parts[1]);
								unit = current_unit - previous_unit;
						}
						else
						{
							unit = 	Integer.parseInt(parts[1]);
						}
						if (type_connection.equals("LT1A"))
						{
							for (int i = 0; i < unit; i++)
							{
								if(i > 150)
									amount = amount + 1.2;
								else if(i > 120)
									amount = amount + 1.5;
								else if(i > 80)
									amount = amount + 1.6;
								else
									amount = amount + 1.8;
							}
						}
						ps = connection.prepareStatement("insert into SPDC_BILLS (GSM_ID,UNIT,AMOUT,INSERT_DATE) values (?,?,?,?)");
						ps.setString(1, parts[0]);
						ps.setInt(2, unit );
						ps.setDouble(3, amount);
						ps.setDate(4,sqlDate);
						ps.execute(); 
						
						/*--------------sending code pending--------------------*/
				}
		}
		line = br.readLine();
	}	
%>
</body>
</html>