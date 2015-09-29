<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.net.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>UserPage</title>
	<!-- BOOTSTRAP STYLES-->
	<link href="assets/css/bootstrap.css" rel="stylesheet" />
	<!-- FONTAWESOME ICONS STYLES-->
	<link href="assets/css/font-awesome.css" rel="stylesheet" />
	<!--CUSTOM STYLES-->
	<link href="assets/css/style.css" rel="stylesheet" />
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

				<li class="dropdown"><a class="dropdown-toggle"
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
				<li><a> <strong> Welcome <%=username%> </strong></a></li>

				<li><a href="index.jsp"><%=username %> Home</a></li>

				<li><a href="customers.jsp">Customers</a></li>

				<li><a href="Registration_form.jsp">Registration</a></li>


				<!-- <li><a href="Payment.html">Payments</a></li>
 -->

				<li><a>Bill Details <span><i
							class="fa fa-caret-down"></i></span></a>
					<ul class="nav nav-second-level">
						<li><a class="active-menu" href="view_bills.jsp">View
								Bill</a></li>
						<li><a href="generate_bill_main.html">Generate Bill</a></li>

					</ul></li>
				<li><a href="queries_main.jsp">Read Queries</a></li>

			</ul>
		</div>

		</nav>
		<!-- /. SIDEBAR MENU (navbar-side) -->
		<div id="page-wrapper" class="page-wrapper-cls">
			<div id="page-inner">
				<div class="row">


					<div class="panel panel-default">
						<!-- <div class="panel-heading">Current Bills Not Paid</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>GSM_ID</th>
											<th>Bill No</th>
											<th>Unit</th>
											<th>Amount</th>
											<th>Payment</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>NEC0912016</td>
											<td>1</td>
											<td>121</td>
											<td>1000</td>
											<td><button>Pay Bill</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div> 

						<hr />
						<hr />-->

						<form>
							<input type="radio" name="full" value="his"><b>By
								Last 6 Months &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="radio"
								name="full" value="her">All Bills 
						</form>


						<hr />

						<%
						Calendar c = Calendar.getInstance();
						/*---------------------Current month and year------------------------*/
						String current_month = new SimpleDateFormat("MMM-yy").format(c.getTime()).toUpperCase();
						System.out.println(current_month);
						
						PreparedStatement ps =null;
						ResultSet rs = null;
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","jishnu");
						String all_bills = "select * from spdc_bills";
						ps = con.prepareStatement("select * from spdc_bills where insert_date like '%"+current_month+"%'");
						rs = ps.executeQuery();
						%>

						<div class="panel panel-default">
							<div class="panel-heading">Customers</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>GSM ID</th>
												<th>Unit</th>
												<th>Amount</th>
												<th>Payment</th>
											</tr>
										</thead>
										<tbody>
										<%while(rs.next())
										{%>
											<tr>
												<td><%=rs.getString(2) %></td>
												<td><%=rs.getInt(3) %></td>
												<td><%=rs.getDouble(4) %></td>
												<td><a href='index.html?id=<%=rs.getInt(1) %>'><button type="button">Pay Bill</button></a></td>
											</tr>
										<%
										}
										%>
										</tbody>
									</table>
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