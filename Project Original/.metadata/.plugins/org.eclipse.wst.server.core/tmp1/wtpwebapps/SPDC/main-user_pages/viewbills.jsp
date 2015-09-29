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
		<%
        String username=(String)session.getAttribute("spdc");
        %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hai <%=username%></title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME ICONS STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM STYLES-->
    <link href="assets/css/style.css" rel="stylesheet" />
    <script src="assets/js/jquery-1.10.2.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>
    $(document).ready(function(){
    	$(".all_bills").hide();
    	$(".all_bills_btn").click(function(){
        	$(".all_bills").toggle();
    });
    });
    </script>
</head>
<body>
<div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a  class="navbar-brand" href="index.jsp">SPDC

                </a>
            </div>

            <div class="notifications-wrapper">
<ul class="nav">
               
                              <li class="dropdown float">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <B>SETTINGS </B>
                        <i class="fa fa-user-plus"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                     <li><a href="editprofile.jsp"><i class="fa fa-user-plus"></i> Edit Profile</a></li>
                        <li class="divider"></li>
                        <li><a href="changepw.jsp"><i class="fa fa-user-plus"></i> Change Password</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav  class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-img-div">
                            <img src="assets/img/user.jpg" class="img-circle" />

                           
                        </div>

                    </li>
                     <li>
                      <a>  <strong> Welcome <%=username%> </strong></a>
                    </li>

                    <li>
                        <a href="index.jsp"><%=username%> Home</a>
                    </li>
                    
                   
                    
                        
                    
                    <li>
                        <a >Bill Details <span ><i class="fa fa-caret-down"></i></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a class="active-menu" href="viewbills.jsp">View Bill</a>
                            </li>
                            
                            
                        </ul>
                    </li>
                    <li>
                        <a  href="Query view.jsp">Connect Us</a>
                    </li>
                 
                </ul>
            </div>

        </nav>
        <!-- /. SIDEBAR MENU (navbar-side) -->
        <div id="page-wrapper" class="page-wrapper-cls">
            <div id="page-inner">
                <div class="row">
						<%
						Calendar c = Calendar.getInstance();
						/*---------------------Current month and year------------------------*/
						/* String current_month = new SimpleDateFormat("yyyy-MMM").format(c.getTime()).toUpperCase();
						System.out.println(current_month); */
						
						SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
						String current_month = sdf.format(Calendar.getInstance().getTime());
						
						PreparedStatement ps =null;
						ResultSet rs = null;
						
						Class.forName("com.mysql.jdbc.Driver");
						Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/SPDC?"
								+"user=root&password=jishnu");
						
						
						
						ps = connection.prepareStatement("select * from spdc_bills where gsm_id=? and insert_date like '%"+current_month+"%'");
						ps.setString(1, username);
						rs = ps.executeQuery();
						%>
	



        <div class="panel panel-default">
                        <div class="panel-heading">
                            Current Bill
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
											<tr>
												<th>GSM ID</th>
												<th>Previous Reading</th>
												<th>Current Reading</th>
												<th>Unit Consumed</th>
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
												<td><%=rs.getInt(4) %></td>
												<td><%=rs.getInt(5) %></td>
												<td><%=rs.getInt(6) %></td>
												<td>
												<%if(rs.getString(7).equals("not paid")){ %>
												<a href='index.html?id=<%=rs.getInt(1) %>'><button type="button">Pay Bill</button></a>
												<%} %>
												</td>
											</tr>
										<%
										}
										%>
										</tbody>
                                </table>
                            </div>
                        </div>

<hr/>
      

            <input type="button" value="All Bills" class="all_bills_btn">


      <hr/>

<%
ps = connection.prepareStatement("select * from spdc_bills where gsm_id=?");
ps.setString(1, username);
rs = ps.executeQuery();
%>

        <div class="panel panel-default all_bills">
                        <div class="panel-heading">
                            All Bills
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
											<tr>
												<th>GSM ID</th>
												<th>Previous Reading</th>
												<th>Current Reading</th>
												<th>Unit Consumed</th>
												<th>Date</th>
												<th>Amount</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
										<%while(rs.next())
										{%>
											<tr>
												<td><%=rs.getString(2) %></td>
												<td><%=rs.getInt(3) %></td>
												<td><%=rs.getInt(4) %></td>
												<td><%=rs.getInt(5) %></td>
												<td><%=rs.getDate(9) %></td>
												<td><%=rs.getInt(6) %></td>
												<td><%= rs.getString(7)%></td>
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
                    </div>
                    </div>
                    </div>
                    </div>



    <footer >
        &copy; 2015 YourCompany | By : <a href="http://www.designbootstrap.com/" target="_blank"></a>
    </footer>
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