<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buy.aspx.cs" Inherits="REAL_ESTATE_ASP.buy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Real Estate</title>
<meta charset="utf-8">
<link rel="stylesheet" href="home1.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home2.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
</head>
<header>
<body>
    <form id="form1" runat="server">
<div class="logo">
      <h1><a href="#"><strong>Cosco</strong> Real Estate</a></h1>
    </div>
    <center><strong style="font-size: xx-large">
        <br />
        Buy Properties</strong></center>
    <br />
<center>
Select your state<br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Enabled="true" Text="State" Value="-1"></asp:ListItem>
    </asp:DropDownList>
    <br />
    </center><br />
  <center>Select the District<br />
      <br />
      <asp:DropDownList ID="DropDownList2" runat="server">
      <asp:ListItem Enabled="true" Text="District" Value="-1"></asp:ListItem>
      </asp:DropDownList>
    </center>
  <center>
      <br />
      Select The Property Type<br /><br /></center>
  <center>
      <asp:DropDownList ID="DropDownList3" runat="server">
      <asp:ListItem Enabled="true" Text="Property" Value="-1"></asp:ListItem>
      </asp:DropDownList>
      <br />
      <br />
      Select&nbsp; Price<br />
             <br />
             <asp:DropDownList ID="DropDownList4" runat="server">
             <asp:ListItem Enabled="true" Text="Price" Value="-1"></asp:ListItem>
             </asp:DropDownList>
             <br />
      <br />
      Select&nbsp; Transaction<br />
             <br />
             <asp:DropDownList ID="DropDownList5" runat="server">
             <asp:ListItem Enabled="true" Text="Transaction" Value="-1"></asp:ListItem>
             </asp:DropDownList>
             <br />
             <br /><br />
             &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" 
                 runat="server" Text="Search" onclick="Button1_Click" />
             &nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Button2" runat="server" Text="Return" onclick="Button2_Click" />
    </center>
         </form>
  </body>
</header>
</html>
