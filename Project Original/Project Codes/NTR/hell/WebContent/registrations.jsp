<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Homepage</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME ICONS STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM STYLES-->
    <link href="assets/css/style.css" rel="stylesheet" />
    
<script type="text/javascript">
function loge()
{
 var a=confirm("r u sure")
 if(a == true)
{
 window.location.href=index1.jsp
 
}
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
                <a  class="navbar-brand" href="index.html">SPDC

                </a> 
            </div>

           
             <div class="notifications-wrapper">
<ul class="nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user-plus"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="myprofile.html"><i class="fa fa-user-plus"></i> My Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="index1.html"><i class="fa fa-sign-out" onclick="return loge();"></i> Logout</a>
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
                        <a  href="#"> <strong> Hi Aditya M Anand</strong></a>
                    </li>

                    <li>
                        <a class="active-menu"  href="registration.html"><i class="registraion "></i>Registration</a>
                    </li>
                    <li>
                        <a href="#"><i class="bills "></i>Bills</a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#"><i class="view_bill "></i>View Bill</a>
                            </li>
                             <li>
                                <a href="#"><i class="generate_bill "></i>Generate Bill</a>
                            </li>
                            </ul>
                            <li>
                        <a href="payment.html"><i class="payment "></i>Payment</a>
                    </li>
                    
                        
                    </li>
                    
                    <li>
                        <a  href="queries.html"><i class="queries "></i>Queries </a>
                        
                    </li>
                   
                  
                   
                  
                        </ul>
                   
                
            </div>

        </nav>

        
    
          
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
                       <form method="POST" action="registrations.jsp">
                          <div class="form-group">
                            <label for="exampleInputgsmid" >GSM-ID</label>
                            <input type="text" name="gsmid" class="form-control" id="exampleInputEmail1" placeholder="Enter GSM-ID" />
                          </div>
                          
                          <hr />
                          <label for="exampleInputmobileno">MOBILE-NO</label>
                            <input type="text" name="mobile" class="form-control" id="exampleInputmobileno" placeholder="Enter MOBILE-NO" />
                          <hr/>
                           
                          <label for="exampleInputmobileno">EMAIL_ID</label>
                            <input type="text" name="email" class="form-control" id="exampleInputmobileno" placeholder="Enter email_id" />
                          <hr/>
                          <input type="submit" class="btn btn-default" value="Submit">
                           
                           
                          </form>
                        </div>
                    </div>
                    </div>
                    
                </div>

        </div>
    <footer >
        &copy; 2015 YourCompany | By : <a href="http://www.designbootstrap.com/" target="_blank">SPDC</a>
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