<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buy.aspx.cs" Inherits="REAL_ESTATE_ASP.buy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Real Estate</title>
<meta charset="utf-8">
<link rel="stylesheet" href="home1.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home2.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
    <script type="text/javascript">
        function number() {
            var asciivalue = event.keyCode
            if ((asciivalue >= 48 && asciivalue <= 57) || (asciivalue == 8 || asciivalue == 127))
                return true;
            else
                alert("Enter Numbers Only")
            return false;
        }
</script>

     <style type="text/css">
        .buttonLogin {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            padding: 6px 6px;
            border: 1px solid #618839;
            /*border-radius: 8px;*/
            background: -webkit-gradient(linear, left top, left bottom, from (#aee378), to(#618839));
            background: -moz-linear-gradient(top, #aee378, #618839);
            background: linear-gradient(to bottom, #aee378, #618839);
            font: normal normal bold 12px arial;
            color: #ffffff;
            text-decoration: none;
        }
</style>
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
                <center>

                    <br />
                   
Select your state<br />
    <br />
    <asp:DropDownList  ID="DropDownList1" runat="server" AutoPostBack="true"
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
      Enter Minimum&nbsp; Price<br />
      <br />
             <asp:TextBox ID="minimum" onkeypress="return number()" runat="server"></asp:TextBox>
      <br />
      <br />
      Enter Maximum Price<br />
      <br />
      <asp:TextBox ID="maximum" onkeypress="return number()" runat="server"></asp:TextBox>
             <br />
      <br />
      Select&nbsp; Transaction<br />
             <br />
             <asp:DropDownList ID="DropDownList5" runat="server">
             <asp:ListItem Enabled="true" Text="Transaction" Value="-1"></asp:ListItem>
             </asp:DropDownList>
             <br />
             <br />&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" CssClass="buttonLogin" 
                 runat="server" Text="Search" onclick="Button1_Click" />
             &nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Button2" CssClass="buttonLogin" runat="server" Text="Return" onclick="Button2_Click" />
    </center>
         </form>
  </body>
</header>
</html>
