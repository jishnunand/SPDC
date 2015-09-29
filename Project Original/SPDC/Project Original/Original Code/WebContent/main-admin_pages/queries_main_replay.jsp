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
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>UserPage</title>
<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME ICONS STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!--CUSTOM STYLES-->
<link href="assets/css/style.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<% String query_id = request.getParameter("gsm_id"); 
	 System.out.println(query_id);
	 //int id = Integer.parseInt(query_id);
	 PreparedStatement ps = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "system", "jishnu");
			String all_queries = "select * from user_profile where gsm_id=?";
			ps=con.prepareStatement(all_queries);
			ps.setString(1, query_id);
			ResultSet rs=ps.executeQuery();
			String	email=null;
			
	%>
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
				<li><a> <strong> Welcome <%=username %> </strong></a></li>

				<li><a href="index.jsp"><%=username %> Home</a></li>

				<li><a class="active-menu" href="Registration_form.jsp">Registration</a>

				</li>


				<!-- <li><a href="Payment.html">Payments</a></li> -->


				<li><a>Bill Details <span><i
							class="fa fa-caret-down"></i></span></a>
					<ul class="nav nav-second-level">
						<li><a href="view_bills.jsp">View Bill</a></li>
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


					<div id="page-wrapper" class="page-wrapper-cls">
						<div id="page-inner">
							<div class="row">
								<div class="col-md-12">
									<h1 class="page-head-line">REPLAY FOR FEEDBACK</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="panel panel-default">
										<div class="panel-heading">Feedback</div>
										<div class="panel-body">
										<%
										while(rs.next())
										{%>
			
											<form action="">
												<div class="form-group">
													<label for="exampleInputEmail1">E-mail</label> <input
														type="email" value=<%=rs.getString(4)%> class="form-control" id="exampleInputEmail1" />
												</div>

												<hr />
												<textarea class="form-control" rows="6"
													placeholder="Enter your Valueable feedback"></textarea>
												<hr />

												<button type="submit" class="btn btn-default">Send</button>
												<button type="submit" class="btn btn-default">Cancel</button>



											</form>
											<%}%>
										</div>
									</div>
								</div>

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