<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="REAL_ESTATE_ASP.login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="CSS/master.css" rel="stylesheet" type="text/css" />

    <style type="text/css">

    </style>
    <style type="text/css">
        .buttonLogin {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            padding: 6px 6px;
            border: 1px solid #c36222;
            background :#ffa037;
            /*border-radius: 8px;*/
            background: -webkit-gradient(linear, left top, left bottom, from (#ffa037), to(#c36222));
            background: -moz-linear-gradient(top, #ffa037, #c36222);
            background: linear-gradient(to bottom, #ffa037, #c36222);
            font: normal normal bold 12px arial;
            color: #ffffff;
            text-decoration: none;
        }
</style>




    <style>
        body {
            background: url('/assets/example/bg_suburb.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>
<body style="background-image: url(images/5.jpg)" >
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-7">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <strong class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SignUp</strong>
                            </div>
                            <div class="panel-body">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-3 control-label">UserName </label>
                                        <div class="col-sm-9">
                                         <asp:TextBox class="form-control" placeholder="Email" ID="text" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="password" TextMode="Password" placeholder="Password" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                
                                    <div class="form-group last">
                                        <div class="col-sm-offset-3 col-sm-9">
                                            <asp:Button ID="Button1" CssClass="buttonLogin" runat="server" Text="Login" OnClick="Button1_Click1" />
                                            <asp:Button ID="Button2" CssClass="buttonLogin" runat="server" Text="Reset" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                            </div>
                            <div class="panel-footer">
                                Not Registered ? <a href="createacc.aspx" class="">Register here</a>
                            </div>
                            <div class="panel-footer">
                            Forgot Password ?<a href="Forgotpwd.aspx" class="">forgot password</a>
                            </div>
                        </div>
                        </div>
                    </div>
                
                </div>
            </div>

        </div>
    </form>
        
</body>
</html>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="REAL_ESTATE_ASP.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>The Login-Animated Website Template | Home :: w3layouts</title>
		<meta charset="utf-8">
		<link href="login.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<link href='#' rel='stylesheet' type='text/css'>
		<!--//webfonts-->
</head>
<body>

				 <!-----start-main---->
				<div class="login-form">
						<h1>Sign In</h1>
						<h2><a href="createacc.aspx">Create Account</a></h2>
                        <form id="form1" runat="server">
					<li style="width: 418px">
						<asp:TextBox  ID="text" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
					</li>
					<li style="width: 416px">
						<asp:TextBox  ID="password" TextMode="Password" runat="server"></asp:TextBox>
					</li>
					
					 <div class ="forgot">
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Forgotpwd.aspx">Forgot Password?</a></h3>
						&nbsp;<a href="#" class=" icon arrow"></a></h4>
					</div>
				      &nbsp;  
                        <asp:Button ID="Button1" runat="server" Text="Login" 
                            onclick="Button1_Click" />
                        </form>
			</div>
			<!--//End-login-form-->
					<div class="ad728x90" style="text-align:center">
				<!-- w3layouts_demo_728x90 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:728px;height:90px"
				     data-ad-client="ca-pub-9153409599391170"
				     data-ad-slot="8639520288"></ins>

		   </div>


		  <!-----start-copyright---->
   					<div class="copy-right">
						<p>Template by <a href="#">w3layouts</a></p> 
					</div>
				<!-----//end-copyright---->
		 		
</body>
</html>
--%>
