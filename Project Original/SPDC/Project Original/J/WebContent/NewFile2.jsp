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
			/* File file = new File("C:/inputsms.txt");
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				System.out.println(stringBuffer.append(line));
				stringBuffer.append("\n");
			}
			fileReader.close();
			System.out.println("Contents of file:");
			System.out.println(stringBuffer.toString()); */
			FileReader fr = new FileReader("C:/inputsms.txt");
			BufferedReader br = new BufferedReader(fr);

			String line = br.readLine();
			while (line != null) {
				String[] parts = line.split(" ");
				/* for (String w : parts) {
					System.out.println(w);
				} */
				System.out.println(parts[0]);
				System.out.println(parts[1]);
				line = br.readLine();
			}
			
			//  by word by word
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu");
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH);
			month=month+1;
			System.out.println(year);
			System.out.println(month);
			String yr = Integer.toString(year);
			String mt = Integer.toString(month);
			System.out.println(yr);
			System.out.println(mt);
			String bills = "bills_"+mt+"_"+yr;
			System.out.println(bills);
			Statement st = con.createStatement();
			String s="select * from "+bills;
			if (st.execute(s)) {
			  // Table exists
			  System.out.println("table exists");
			}
			else {
			  // Table does not exist
			  System.out.println("table not exists");
			  String query = "create table "+bills+" (id number primary key, gsm_id varchar2(10),previous_reading number, current_reading number,unit number, amount number, paid varchar(10) default 'not paid', constraint fky_gsm foreign key(gsm_id) references user_profile(gsm_id))";
			  System.out.println(query);
			  st.executeUpdate(query);
			}
%>
</body>
</html>