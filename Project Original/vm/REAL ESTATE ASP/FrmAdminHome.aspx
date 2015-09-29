<%@ Page Title="" Language="VB" MasterPageFile="~/MasterAdmin.master" AutoEventWireup="false" CodeFile="FrmAdminHome.aspx.vb" Inherits="FrmAdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <title>Buy Property</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="home1.css" type="text/css" media="all" />
    <link rel="stylesheet" href="home2.css" type="text/css" media="all" />
    <link rel="stylesheet" href="home3.css" type="text/css" media="all" />
    <style type="text/css">
        #faded {
            height: 604px;
            width: 78px;
            margin-left: 0px;
        }

        .auto-style1 {
            width: 201px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <asp:Label ID="Label1" Style="float: right; margin-right: 25px" runat="server" Text=""></asp:Label>
    <br />  <br />
    <asp:Button ID="BtnLogout" Visible="True" Style="float: right; margin-right: 25px" runat="server" Text="Logout" />
    <br />
    <center><strong style="font-size: xx-large">Sell Properties</strong></center>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <ul class="img-list clearfix">
        <li><a href="#">
            <img src="images/thumb1.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb2.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb3.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb4.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb5.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb6.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb7.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb8.jpg" alt="" /></a></li>
        <li><a href="#">
            <img src="images/thumb9.jpg" alt="" /></a></li>
    </ul>
    <br />
    <div>
        <table style="margin-left: 475px">
            <tr>
                <td class="auto-style1">
                   <asp:Label ID="Lblname" runat="server" Text="Your Name:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtName"  runat="server" Width="190px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style1">
                       <asp:Label ID="LblNumber" runat="server" Text="Contact Number:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TXtmobile"  runat="server" Width="190px"></asp:TextBox>

                </td>
            </tr>

            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LblState" runat="server" Text="Select your state:-"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDlState" runat="server" Width="200px"></asp:DropDownList>
                    &nbsp;
                    <asp:TextBox ID="Txtstate" placeholder="Other" runat="server" Width="113px"></asp:TextBox>
                    &nbsp;<asp:Button ID="Btnaddstate" runat="server" Text="Add" Width="58px" />

                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LblDistrict" runat="server" Text="Select the District:-"></asp:Label>
                    <br />
                </td>

                <td>
                    <asp:DropDownList ID="DDlDisctrict" runat="server" Width="200px"></asp:DropDownList>
                    &nbsp;
                    <asp:TextBox ID="txtotherdisct" placeholder="Other" runat="server" Width="113px"></asp:TextBox>
                    &nbsp;<asp:Button ID="Btnadddistr" runat="server" Text="Add" Width="58px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LblProperty" runat="server" Text="Select Property Type:-"></asp:Label>
                    <br />
                </td>
                <td>
                    <asp:DropDownList ID="DDlProperty" runat="server" Width="200px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style1">
                       <asp:Label ID="Lblsize" runat="server" Text="Size:-"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtsize"  runat="server" Width="190px"></asp:TextBox>

                </td>
            </tr>

            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LblMiniprice" runat="server" Text="Select Minimum Price:-"></asp:Label>
                    <br />
                </td>
                <td>
                    <asp:DropDownList ID="DDlMiniPrice" runat="server" Width="200px"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LblMaxPrice" runat="server" Text="Select Maximum Price:-"></asp:Label>
                    <br />
                </td>
                <td>
                    <asp:DropDownList ID="DdlMaxPrice" runat="server" Width="200px"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblimage" runat="server" Text="Select Image :- "></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload2" runat="server" ToolTip="Select Only One File" margin-left="25px" BorderWidth="1px" BackColor="#FFFFCC" BorderColor="#6B6B6B" Width="335px" BorderStyle="Outset" />

                </td>
            </tr>

            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnSearch" runat="server" Style="height: 30px; width: 140px" Text="Upload" />
                </td>
            </tr>

            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>

        </table>

    </div>
 



</asp:Content>

