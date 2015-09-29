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
   
   String ad_name,ad_pass;
	
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","oracle10g");
out.println(con);

//String a="create table gsm_id(gsm_id varchar2(13) primary key)";
//Statement st=con.createStatement();
//boolean b=st.execute(a);

String c="alter table user_profile add constraint fk foreign key (gsm_id) references gsm_id(gsm_id)";

Statement st=con.createStatement();
System.out.println(st.execute(c));
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>