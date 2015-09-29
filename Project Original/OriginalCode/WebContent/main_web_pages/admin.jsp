<%@page import="java.sql.*"%>
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
try
{
  String usn=request.getParameter("adminid");
   String pass=request.getParameter("adminpass");
   
   //String ad_name,ad_pass;
	
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu");



//String a="create table admin(adminid varchar2(30),adminpass varchar2(30))";
Statement st=connection.createStatement();
//boolean b=st.execute(a);

//String c="insert into admin values('admin','admin')";
//int b=st.executeUpdate(c);





ResultSet rs_check_current_table = null;
				PreparedStatement ps = null;
				/*----------------------------Sequence----------------------*/
				String bills_sequence = "create sequence spdc_sequence_bills";
				String queries_sequence = "create sequence spdc_sequence_queries";
				
				
				/*-----------------------Trigger-----------------------------*/
				//String bills_trigger = "CREATE OR REPLACE TRIGGER bills_trigger BEFORE INSERT ON spdc_bills FOR EACH ROW BEGIN SELECT spdc_sequence.NEXTVAL INTO new.id FROM dual; END;/ ";
				
				/*------------------Table Creation queries--------------------*/
				
				/*------------ Admin Table -------------- */
				String admin_table = "create table spdc_admin(username varchar2(20) primary key, password varchar2(50), mobile_number varchar2(15) unique, email varchar2(50) unique)";
				String Create_admin_user = "insert into spdc_admin values('admin','admin','+918281424452','spdcnttf@gmail.com')";
				
				/*-------------- User Profile Table ----------------- */ 
				String user_table = "create table spdc_user_profile(gsm_id varchar2(15) primary key, password varchar2(20), mobile_number varchar2(15) unique, email varchar2(50) unique, name varchar2(50), date_of_birth date, house_number varchar2(50), post varchar2(50), town varchar2(50),state varchar2(50),country varchar2(50))";
				
				
				
				/*------------------- Bills Table------------*/
				String bills_table = "create table spdc_bills(id number primary key, gsm_id varchar2(15) references spdc_user_profile(gsm_id), unit number, amout number, insert_date date, status varchar2(10) default 'not paid', paid_date date)";
				
				
				/*----------------- Queries Table ------------*/
				String queries_table = "create table spdc_queries(id number primary key, gsm_id varchar2(15) references spdc_user_profile(gsm_id), subject varchar2(50), message varchar2(4000), reply_message varchar2(4000),user_message_date date, admin_message_date date)";
				
				
				
				/*--------------Creating Admin Table if the table is not existing.-------------------------*/
				ps = connection.prepareStatement("select * from USER_TABLES where table_name='SPDC_ADMIN'");
				rs_check_current_table = ps.executeQuery();
				System.out.println(rs_check_current_table);
				if (rs_check_current_table.next()) {
					//table exists
					System.out.println("Admin Table exists");
				} else {
					//table not exists
					System.out.println("Admin Table not exists");
					ps = connection.prepareStatement(admin_table);
					System.out.println(ps.executeQuery());
					ps = connection.prepareStatement(Create_admin_user);
					System.out.println(ps.executeQuery());
				}
				
				
				
				/*------------------Creating User Profile Table if the table is not existing-------------------*/
				ps = connection.prepareStatement("select * from USER_TABLES where table_name='SPDC_USER_PROFILE'");
				rs_check_current_table = ps.executeQuery();
				if (rs_check_current_table.next()) {
					//table exists
					System.out.println("user Table exists");
				} else {
					//table not exists
					System.out.println("user Table not exists");
					ps = connection.prepareStatement(user_table);
					System.out.println(ps.executeQuery());
				}
				
				
				/*------------------Creating Bills Table if the table is not existing-------------------*/
				ps = connection.prepareStatement("select * from USER_TABLES where table_name='SPDC_BILLS'");
				rs_check_current_table = ps.executeQuery();
				if (rs_check_current_table.next()) {
					//table exists
					System.out.println("bills Table exists");
				} else {
					//table not exists
					System.out.println("bills Table not exists");
					ps = connection.prepareStatement(bills_table);
					System.out.println(ps.executeQuery());
				}
				
				
				/*------------------Creating Queries Table if the table is not existing-------------------*/
				ps = connection.prepareStatement("select * from USER_TABLES where table_name='SPDC_QUERIES'");
				rs_check_current_table = ps.executeQuery();
				if (rs_check_current_table.next()) {
					//table exists
					System.out.println("queries Table exists");
				} else {
					//table not exists
					System.out.println("queries Table not exists");
					ps = connection.prepareStatement(queries_table);
					System.out.println(ps.executeQuery());
				}
				
				
				
				/*------------------Creating bills if the sequence is not existing-------------------*/
				ps = connection.prepareStatement("select * from user_sequences where sequence_name='SPDC_SEQUENCE_BILLS'");
				rs_check_current_table = ps.executeQuery();
				if (rs_check_current_table.next()) {
					//table exists
					System.out.println("sequence exists");
				} else {
					//table not exists
					System.out.println("sequence not exists");
					ps = connection.prepareStatement(bills_sequence);
					System.out.println(ps.executeQuery());
				}
				
				
				
				/*------------------Creating queries Sequence if the sequence is not existing-------------------*/
				ps = connection.prepareStatement("select * from user_sequences where sequence_name='SPDC_SEQUENCE_QUERIES'");
				rs_check_current_table = ps.executeQuery();
				if (rs_check_current_table.next()) {
					//table exists
					System.out.println("sequence exists");
				} else {
					//table not exists
					System.out.println("sequence not exists");
					ps = connection.prepareStatement(queries_sequence);
					System.out.println(ps.executeQuery());
				}





ResultSet rs=st.executeQuery("select * from SPDC_ADMIN where username='"+usn+"' and password='"+pass+"'");
String s=null;
String g=null;


	if(rs.next())
      { 
		session.setAttribute("spdc",usn);
            response.sendRedirect("http://localhost:9895/Original_Code/main-admin_pages/index.jsp");
        }
   	else
  	 {
   		out.write("<script type='text/javascript'>\n");
  		out.write("alert('Wrong Username or Password !!!!!');\n");
  		out.write("window.location.href='http://localhost:9895/Original_Code/main_web_pages/admin.html';");
  		out.write("</script>\n");	
   	}  
}

catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>