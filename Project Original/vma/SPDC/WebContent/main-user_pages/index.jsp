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
	    <title> Hai <%=username%></title>
	    <!-- BOOTSTRAP STYLES-->
	    <link href="assets/css/bootstrap.css" rel="stylesheet" />
	    <!-- FONTAWESOME ICONS STYLES-->
	    <link href="assets/css/font-awesome.css" rel="stylesheet" />
	    <!--CUSTOM STYLES-->
	    <link href="assets/css/style.css" rel="stylesheet" />
	    <link href="../main_web_pages/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
                        <li><a href="changepw.jsp"><i class="fa fa-user-plus"></i> Change Password</a></li>
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
                            <img src="assets/img/default.jpg" class="img-circle" />

                           
                        </div>

                    </li>
                     <li>
                       <a> <strong> Welcome <%=username%>  </strong></a>
                    </li>

                    <li>
                        <a class="active-menu" href="index.jsp"><%=username%> Home</a>
                    </li>
                    
                   
                        
                    
                    <li> 
                        <a>Bill Details <span ><i class="fa fa-caret-down"></i></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="viewbills.jsp">View Bill</a>
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
        
        
        
        <div class="span_of_4"><!-- start span_of_4 -->
			<div class="col-md-3 span1_of_4">
				<div class="span4_of_list">
					<div class="num">01</div>
					<h3>ENERGY</h3>
					<p>Electrical energy is energy newly derived from electrical potential energy. When loosely used to describe energy absorbed or delivered by an electrical circuit (for example, one provided by an electric power utility) "electrical energy" refers to energy which has been converted from electrical potential energy.conserve energy.</p>
					<div class="read_more">
						<a class="btn btn-2 active" href="#">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 span1_of_4">
				<div class="span4_of_list">
					<div class="num">02</div>
					<h3>MONEY</h3>
					<p>For most people, the monthly electric bill accounts for a significant part of the monthly budget. In fact, the energy bill is often only surpassed by the mortgage or rent payment. It's usually in your best interest to keep it as low as possible, conserving energy and money. Scroll past the jump to learn how to start saving.</p>
					<div class="read_more">
						<a class="btn  btn-2b" href="#">read more</a>
					</div>	
				</div>	
			</div>
			<div class="col-md-3 span1_of_4">
				<div class="span4_of_list">
					<div class="num">03</div>
					<h3>SAFETY</h3>
					<p>Electric shock is the physiological reaction or injury caused by electric current passing through the (human) body.[1] Typically, the expression is used to describe an injurious exposure to electricity.[2] It occurs upon contact of a (human) body part with any source of electricity that causes a sufficient current through the skin, muscles, or hair.

</p>
					<div class="read_more">
						<a class="btn btn-2b" href="#">read more</a>
					</div>		
				</div>
			</div>
			<div class="col-md-3 span1_of_4">
				<div class="span4_of_list">
					<div class="num">04</div>
					<h3>FUTURE</h3>
					<p>The energy consumption in India is the fourth biggest after China, USA and Russia.[3] The total primary energy consumption from crude oil (29.45%), natural gas (7.7%), coal (54.5%), nuclear energy (1.26%), hydro electricity (5.0%), wind power, biomass electricity and solar power is 595 Mtoe in the year 2013.as considering the ennergy</p>
					<div class="read_more">
						<a class="btn btn-2b" href="#">read more</a>
					</div>						
				</div>
			</div>
			<div class="clearfix"></div>
		</div><!-- end span_of_4 -->
        
                
     	
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