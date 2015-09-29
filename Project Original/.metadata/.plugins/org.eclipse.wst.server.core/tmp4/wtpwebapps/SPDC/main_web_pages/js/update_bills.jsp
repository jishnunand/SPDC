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

//DB and table connection
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "jishnu");
PreparedStatement ps = null;
ResultSet rs =null;


//variables for file reading
String file_mobile = null;
int file_reading ;

// taking the file
File file = new File("E:/inputsms.txt");

//reading message form the file
		FileReader fr = new FileReader("E:/inputsms.txt");
		BufferedReader br = new BufferedReader(fr);
		String line = br.readLine();
		while (line != null) {
			file_reading = 0;
			String[] parts = line.split(" ");
			System.out.println(parts[0]);
			System.out.println(parts[1]);
			file_mobile = parts[0];
			file_reading = Integer.parseInt(parts[1]);
			ps = connection.prepareStatement("select * from SPDC_USER_PROFILE where GSM_ID=?");
			ps.setString(1, file_mobile);
			rs=ps.executeQuery();
			if(rs.next())
			{
				
			}

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