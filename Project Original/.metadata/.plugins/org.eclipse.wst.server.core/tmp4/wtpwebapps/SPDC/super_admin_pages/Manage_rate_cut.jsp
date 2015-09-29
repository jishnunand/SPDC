<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.net.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>UserPage</title>
<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME ICONS STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!--CUSTOM STYLES-->
<link href="assets/css/style.css" rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Manage_admin.jsp">SPDC </a>
		</div>

		<div class="notifications-wrapper">
			<ul class="nav">

				<li class="dropdown float"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <B>SETTINGS </B> <i
						class="fa fa-user-plus"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="update.html"><i class="fa fa-user-plus"></i>
								My Profile</a></li>
						<li class="divider"></li>
						<li><a href="change_password.jsp"><i class="fa fa-user-plus"></i>
								Change Password</a></li>
						<li class="divider"></li>
						<li><a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a></li>
					</ul></li>
			</ul>
		</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<img src="assets/img/default.jpg" class="img-circle" />


					</div>
				
				<%
				String username=(String)session.getAttribute("spdc");
				%>
				</li>
                     <li>
                       <a> <strong> Welcome Super <%=username %> </strong></a>
                    </li>

                    <li>
                        <a href="Create_admin.jsp">Create Admin Account</a>
                    </li>
                    
                    <li>
                        <a href="Manage_admin.jsp">Manage Admin Account</a>
                        
                    </li>
                    <li>
                        <a href="Manage_rate_cut.jsp">Manage Rate Cut</a>
                        
                    </li>
                    </ul>
		</div>

		</nav>
		<!-- /. SIDEBAR MENU (navbar-side) -->
		<%!
		boolean status; 
		%>
		<%
		PreparedStatement ps = null;
		ResultSet rs = null;
		
				
				
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
				+"user=root&password=jishnu");
		
		int id ;
		
			
			ps = connection.prepareStatement("select * from SPDC_LT ");
			
			rs = ps.executeQuery();
		%>
		<div id="page-wrapper" class="page-wrapper-cls">
			<div id="page-inner">
				<div class="row">


					<div class="panel panel-default">
						<div class="panel-heading">CUSTOMER DETAILS</div>
						<div class="panel-body">
							<div class="table-responsive">
								
								<form method="post" action="update_rate.jsp">
								<table>
								<%while(rs.next())
									{
									id=rs.getInt(1);
									%>
								<tr>
								
								<td>CONNECTION TYPE</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(2) %></td>
								</tr>
								
								<tr>
								
								<td>FIRST</td>
								<td><input type ="text" value="<%=rs.getDouble(3) %>" name="first"></td>
								</tr>
								
								<tr>
								
								<td>SECOND</td>
								<td><input type ="text" value="<%=rs.getDouble(4) %>" name="second"></td>
								</tr>
								
								<tr>
								
								<td>THIRD</td>
								<td><input type ="text" value="<%=rs.getDouble(5) %>" name="third"></td>
								</tr>
								
								<tr>
								
								<td>FOURTH</td>
								<td><input type ="text" value="<%=rs.getDouble(6) %>" name="fourth"></td>
								</tr>
								
								<tr>
								
								<td>METER RATE</td>
								<td><input type ="text" value="<%=rs.getDouble(7) %>" name="meter"></td>
								</tr>
								
								<tr>
								
								<td>SMS CHARGE</td>
								<td><input type ="text" value="<%=rs.getDouble(8) %>" name="sms"></td>
								</tr>
								
								
								
								<%} %>
								</table>
								<table>
								<tr>
								
								<td><a><input type="Submit" value="Update"></a></td>
								
								
								<td><a href="super_admin_index.jsp"><input type="button" value="cancel"></a></td>
								</tr>
								</table>
								</form>
							</div>
						</div>


						





					</div>
				</div>
			</div>
		</div>

		<footer> &copy; 2015 YourCompany | By : <a
			href="http://www.designbootstrap.com/" target="_blank"></a> </footer>
		<!-- /. FOOTER  -->
		<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
		<!-- JQUERY SCRIPTS -->
		<script src="assets/js/jquery-1.11.1.js"></script>
		<!-- BOOTSTRAP SCRIPTS -->
		<script src="assets/js/bootstrap.js"></script>
		<!-- METISMENU SCRIPTS -->
		<script src="assets/js/jquery.metisMenu.js"></script>
		<!-- CUSTOM SCRIPTS -->
		<script src="assets/js/custom.js"></script>
</body>
</html>