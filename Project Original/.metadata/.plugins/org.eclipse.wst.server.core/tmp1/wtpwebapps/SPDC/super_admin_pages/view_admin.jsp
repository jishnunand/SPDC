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
			<a class="navbar-brand" href="index.jsp">SPDC </a>
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
						<img src="assets/img/user.jpg" class="img-circle" />


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
		
		int id = Integer.parseInt(request.getParameter("id"));
		
			
			ps = connection.prepareStatement("select * from SPDC_ADMIN where id =?");
			ps.setInt(1,id);
			rs = ps.executeQuery();
		%>
		<div id="page-wrapper" class="page-wrapper-cls">
			<div id="page-inner">
				<div class="row">


					<div class="panel panel-default">
						<div class="panel-heading">CUSTOMER DETAILS</div>
						<div class="panel-body">
							<div class="table-responsive">
								<%-- <table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th></th>
											<th>GSM ID</th>
											<th>MOBILE NUMBER</th>
											<th>NAME</th>
											<th>HOUSE NUMBER</th>
											<th>POST</th>
											<th>TOWN</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%while(rs.next())
									{%>
										<tr>
											<td><input type="checkbox" name="checkbox"
												id=<%=rs.getInt(1) %> value="value"></td>
											<td><%=rs.getString(2) %></td>
											<td><%=rs.getString(5) %></td>
											<td><%=rs.getString(6) %></td>
											<td><%=rs.getString(8) %></td>
											<td><%=rs.getString(9) %></td>
											<td><%=rs.getString(10) %></td>
											<td><a href='queries_main_replay.jsp?gsm_id=<%=rs.getInt(1) %>'><button type="button">View</a></td>
										</tr>
										<%
										}
										%>

									</tbody>
								</table> --%>
								<form method="post" action="update_customer_details.jsp?id=<%=id%>">
								<table>
								<%while(rs.next())
									{
									status = rs.getBoolean(6);
									%>
								<tr>
								
								<td>USERNAME</td>
								<td><input type ="text" value="<%=rs.getString(2) %>" name = "gsm_id"></td>
								</tr>
								
								<tr>
								
								<td>Email</td>
								<td><input type ="text" value="<%=rs.getString(5) %>" name="email"></td>
								</tr>
								
								<tr>
								
								<td>Mobile Number</td>
								<td><input type ="text" value="<%=rs.getString(4) %>" name="mobile_number"></td>
								</tr>
								
								
								
								
								<%} %>
								</table>
								<table>
								<tr>
								
								<td><a><input type="Submit" value="Update"></a></td>
								<td><a href="customer_reset_password.jsp?id=<%=id%>"><input type="button" value="Reset Password"></a></td>
								<td>
								<%if(status==true){ %>
								<a href="customer_deactivate.jsp?id=<%=id%>"><input type="button" value="Deactivate"></a>
								<%}
								else{ %>
								<a href="customer_deactivate.jsp?id=<%=id%>"><input type="button" value="Activate"></a>
								<%} %>
								</td>
								<td><a href="delete_customer.jsp?id=<%=id%>"><input type="button" value="Delete"></a></td>
								<td><a href="customers.jsp"><input type="button" value="cancel"></a></td>
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