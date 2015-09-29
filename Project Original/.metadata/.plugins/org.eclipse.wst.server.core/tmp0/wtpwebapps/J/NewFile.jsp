<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.FileWriter" %>
<%@page import="java.io.BufferedWriter"%>
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
	/* File file = new File("E:/ji.txt");
	if(!file.exists())
	{
		file.createNewFile();
	}
	FileWriter fw = new FileWriter(file.getAbsoluteFile());
	BufferedWriter bw = new BufferedWriter(fw);
	bw.write("hai jishnu");
	bw.close();
	System.out.println("Done"); */
	
	
	/* Calendar c = Calendar.getInstance();
	String month = Integer.toString(c.get(Calendar.MONTH));
	String year = Integer.toString(c.get(Calendar.YEAR));
	out.print(month);
	out.print(year);
	
	String m = c.getDisplayName(Calendar.MONTH, Calendar.SHORT, Locale.getDefault()).toUpperCase();
	out.print(m);
	String mm = m.toUpperCase();
	out.print(mm);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy");
	String y = sdf.format(Calendar.getInstance().getTime());
	out.print(y); */
	
	
	
	/* Calendar cal = Calendar.getInstance();
	cal.add(Calendar.MONTH, -1);
	String previous_month = new SimpleDateFormat("MMM-yy").format(cal.getTime()).toUpperCase();
	out.println(previous_month); */
	
	
	
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.MONTH, -1);
	String previous_month = new SimpleDateFormat("MM-yy").format(cal.getTime());
	out.println(previous_month);
	
	
	
	Calendar c = Calendar.getInstance();

	/*------------------------Year---------------------*/
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
	String year = sdf.format(Calendar.getInstance().getTime());
	
	System.out.println("year----"+year);
	/*------------------------Month-------------------*/
	String month = c.getDisplayName(Calendar.MONTH, Calendar.SHORT, Locale.getDefault()).toUpperCase();
	
	
	String current_date = month+"-"+year;
	
	
	//c.add(Calendar.MONTH, -1);
	String current = new SimpleDateFormat("MMM-yy").format(c.getTime()).toUpperCase();
	System.out.println(current);
	
	
	String s="select * from spdc_bills where gsm_id = ? and insert_date like '%"+current_date+"%'";
	
	out.print(s);
	
	c.add(Calendar.MONTH, -1);
	String previous = new SimpleDateFormat("MMM-yy").format(c.getTime()).toUpperCase();
	out.println(previous);
	
	System.out.println(12*1.20);
	
	int id =10;
	
	out.println("window.location.href='http://localhost:9895/SPDC/main-admin_pages/edit_customers_form.jsp?id="+id+";");
	
%>
</body>
</html>