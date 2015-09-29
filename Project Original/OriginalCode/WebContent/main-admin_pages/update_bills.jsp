<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.Calendar"%>
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
		// Creating table name for bills table by the current month and year
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
		}
	%>

</body>
</html>