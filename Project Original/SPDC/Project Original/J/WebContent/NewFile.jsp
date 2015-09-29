<%@ page import="java.io.File"%>
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
	File file = new File("E:/ji.txt");
	if(!file.exists())
	{
		file.createNewFile();
	}
	FileWriter fw = new FileWriter(file.getAbsoluteFile());
	BufferedWriter bw = new BufferedWriter(fw);
	bw.write("hai jishnu");
	bw.close();
	System.out.println("Done");
%>
</body>
</html>