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

//String a="create table admin(adminid varchar2(30),adminpass varchar2(30))";
Statement st=con.createStatement();
//boolean b=st.execute(a);

//String c="insert into admin values('admin','admin')";
//int b=st.executeUpdate(c);

ResultSet rs=st.executeQuery("select * from admin where adminid='"+usn+"' and adminpass='"+pass+"'");
String s=null;
String g=null;
while(rs.next())
{
s=rs.getString(1);
g=rs.getString(2);
	
}
if(s!=null && g!=null)
{ 
           session.setAttribute("adminname",usn);
           response.sendRedirect("index.jsp");
        }
   	else
  	{
   		
     response.sendRedirect("loginerror.jsp");
   	}  
}

catch(Exception e)
{
	//e.printStackTrace();
}
%>
</body>
</html>