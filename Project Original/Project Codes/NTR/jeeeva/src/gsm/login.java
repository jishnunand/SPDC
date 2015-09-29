package gsm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	PreparedStatement ps;
	ResultSet  rs;
	
       
	public void init(ServletConfig config)throws ServletException
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","oracle10g");
			Statement st=conn.createStatement();
			 rs=st.executeQuery("Select username,password from login");
			
		}
		catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}
		
		catch(SQLException e)
		{
			System.out.println(e);
		}
	}
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		
		doPost(req,res);
		
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		res.setContentType("text/html");
		PrintWriter pw=res.getWriter();
		String username=req.getParameter("uname");
		String password=req.getParameter("password");
		pw.println("<html><boby>");
		
		try
		{
			ps=conn.prepareStatement("select * from login where username=? and password=?");
			ps.setString(1,username);
			ps.setString(2,password);
			rs=ps.executeQuery();
			if(rs.next())
			{
				pw.println("<h3>welcome"+" "+username+"</h3>");
				RequestDispatcher rd1=req.getRequestDispatcher("index1.html");
				rd1.include(req,res);
				
			}
			else
			{
				pw.println("<center><h3>invalid username/password enter correct username/password </h3>)</center>" );
				RequestDispatcher rd2=req.getRequestDispatcher("index.html");
				rd2.include(req,res);
						
			}
				
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
	}
	
	
	

}
