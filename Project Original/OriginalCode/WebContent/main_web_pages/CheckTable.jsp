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
			ps = connection.prepareStatement("create table SPDC_ADMIN(id int primary key AUTO_INCREMENT, username varchar(30) unique, password varchar(30), mobile_number varchar(12) unique, email varchar(50) unique, status Boolean default true)");
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
			ps = connection.prepareStatement("create table SPDC_USER_PROFILE(id int primary key auto_increment,gsm_id varchar(12) unique ,password varchar(50) ,email varchar(50) unique,mobile_number varchar(12) unique,customer_name varchar(50),date_of_birth date,house_no varchar(20),post varchar(20),city varchar(20),districts varchar(20),state varchar(20),country varchar(20),is_active boolean default true ,connection_type varchar(10),status boolean default True)");
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
			ps = connection.prepareStatement("create table SPDC_BILLS(id int primary key auto_increment, gsm_id varchar(12) references SPDC_USER_PROFILE(gsm_id), previous_reading int default 0, current_reading int, unit int,amount double, paid varchar(10) default 'not paid' ,connection_type varchar(10))");
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
			ps = connection.prepareStatement("create table SPDC_QUERY (id int primary key auto_increment,gsm_id varchar(12) references SPDC_USER_PROFILE(gsm_id), user_query text, admin_replay text,user_insert date,admin_insert date)");
			ps.execute();
		}
		%>
	</body>
</html>