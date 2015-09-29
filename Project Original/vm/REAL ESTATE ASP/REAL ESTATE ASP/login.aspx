<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="REAL_ESTATE_ASP.login" %>

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

