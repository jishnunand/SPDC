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
    <script type="text/javascript">
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            alert("Please enter only Numbers.");
            return false;
        }

        return true;
    }

    function ValidateNo() {
        var phoneNo = document.getElementById('txtPhoneNo');

    if (phoneNo.value == "" || phoneNo.value == null) {
            alert("Please enter Valid Mobile Number.");
            

            return false;
        }
        if (phoneNo.value.length < 10 || phoneNo.value.length > 10) {
            alert("Mobile No. is not valid, Please Enter 10 Digit Number.");
            return false;
        }

        
        return true;
        }
    
    function Validategsm() {
        var phoneNo = document.getElementById('txtPhoneNo');

    if (phoneNo.value == "" || phoneNo.value == null) {
            alert("Please enter Valid GSM Number.");
            

            return false;
        }
        if (phoneNo.value.length < 10 || phoneNo.value.length > 10) {
            alert("GSM No. is not valid, Please Enter 10 Digit GSM Number.");
            return false;
        }

        
        return true;
        }
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
                <a  class="navbar-brand" href="customers.jsp">SPDC

                </a>
            </div>

            <div class="notifications-wrapper">
<ul class="nav">
               
                              <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <B>SETTINGS </B>
                        <i class="fa fa-user-plus"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="editprofile.jsp"><i class="fa fa-user-plus"></i> My Profile</a>
                        </li>
                         <li class="divider"></li>
                        <li><a href="change_password.jsp"><i class="fa fa-user-plus"></i> Change Password</a>
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
                            <img src="assets/img/default.jpg" class="img-circle" />

                           
                        </div>
					<%
					String username=(String)session.getAttribute("spdc");
					%>
                    </li>
                     <li>
                       <a> <strong> Welcome <%=username %> </strong></a>
                    </li>

                   <%--  <li>
                        <a  href="index.jsp"><%=username %>Home</a>
                    </li> --%>
                    
                    <li><a href="customers.jsp">Customers</a></li>
                    
                    
                    <li>
                        <a class="active-menu" href="Registration_form.jsp">Registration</a>
                        
                    </li>

                   
                    <!-- <li>
                        <a href="Payment.html">Payments</a>
                        
                    </li> -->
                        
                    
                    <li> 
                        <a>Bill Details <span ><i class="fa fa-caret-down"></i></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="view_bills.jsp">View Bill</a>
                            </li>
                             <li><a href="meterproblem.jsp">Meter Issues</a></li>
                            
                        </ul>
                    </li>
                    <li>
                        <a  href="queries_main.jsp">Read Queries</a>
                    </li>
                
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
                        <h1 class="page-head-line">Registration </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        
                        <div class="panel-body">
                       <form action="Registration.jsp" method="post">
                          <div class="form-group">
                            <label for="exampleInputgsmid">GSM-ID</label>
                            <input type="text" class="form-control" id="txtPhoneNo" placeholder="Enter GSM-ID"  name="gsm_id" onkeypress="return isNumber(event)" onblur="Validategsm();" required />
                          </div>
                          
                          <hr />
                          <label for="exampleInputmobileno">MOBILE-NO</label>
                            <input type="text" class="form-control" id="txtPhoneNo" placeholder="Enter MOBILE-NO"  name="mob" onkeypress="return isNumber(event)" onblur="ValidateNo();" required/>
                          <hr/>
                          <label for="exampleInputmobileno">EMAIL</label>
                            <input type="email" class="form-control" id="txtPhoneNo" placeholder="Enter Email Id"  name="email" required/>
                          <hr/>
                          
                          <label for="exampleInputmobileno">Connection Type</label>
                          <select name="type_connection">
                          <option selected>LT1A</option>
                          </select>
                          
                          <hr/>
                          
                          <button type="submit" class="btn btn-default" >Submit</button>
                           
                           
                          </form>
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