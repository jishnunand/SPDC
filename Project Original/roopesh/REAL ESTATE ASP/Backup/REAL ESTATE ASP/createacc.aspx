﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createacc.aspx.cs" Inherits="REAL_ESTATE_ASP.createacc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Real Estate</title>
<link rel="stylesheet" href="home1.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home2.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function BUTTON_onclick() {

        }

// ]]>
    </script>
</head>
<body>
<!-- START PAGE SOURCE -->
<header><br />
<div class="logo">
      <h1><a href="#"><strong>Cosco</strong> Real Estate</a></h1>
    </div>
<br />
    <form id="form1" runat="server">
<center><strong style="font-size: xx-large; font-weight: bold; color: #FFFFFF;">Sign Up</strong></center><br /><br /><br /><br />
   <center>First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       <asp:TextBox ID="fname" runat="server" required ></asp:TextBox>
   <br /><br />Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="lname" runat="server" required></asp:TextBox><br /><br />
   Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
       <asp:TextBox ID="age" runat="server" required></asp:TextBox><br /><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       Male<asp:RadioButton ID="Male" GroupName="r1" runat="server" />
       Female<asp:RadioButton ID="Female" GroupName="r1" runat="server"/><br /><br />
       Phone No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Phno" runat="server" MaxLength="10" required></asp:TextBox><br /><br />
       Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="email" runat="server" required></asp:TextBox><br /><br />
       Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
       <br /><br />
       Confirm Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       <asp:TextBox ID="confirm" runat="server" TextMode="Password"></asp:TextBox>
       <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /><br /><br />
       <asp:Button ID="BUTTON" Text="Submit" runat="server" BackColor="Yellow" 
           BorderColor="#FFCC00" BorderStyle="Dashed" onclick="submit_Click" /> 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       <input type="reset" name="Reset" 
           
           style="border-style: dashed; border-color: #00FF00; background-color: #FFFF00;" 
           id="BUTTON" onclick="return BUTTON_onclick()" />
   </center>
    <br /><br />
    </form>
</header>
</body>
</html>