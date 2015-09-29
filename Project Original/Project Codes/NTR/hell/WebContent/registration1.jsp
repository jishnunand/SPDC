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
  //String gsm=request.getParameter("gsmid");
   //String mob=request.getParameter("mobile");
   
   //String ad_name,ad_pass;
	
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","oracle10g");
out.println(con);

//String a="create table registration(gsmid varchar2(30),mobile varchar2(30))";
Statement st=con.createStatement();
//boolean b=st.execute(a);
PreparedStatement pt=con.prepareStatement("insert into registration values ")
//String c="insert into admin values('admin','admin')";
//int b=st.executeUpdate(c);

//ResultSet rs=st.executeQuery("select * from registration where gsmid='"+usn+"' and mobile='"+pass+"'");
//String s=null;
//String g=null;

 
}

catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>