<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Frmsell.aspx.vb" Inherits="Frmsell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Buy Property</title>
    <meta charset="utf-8" />
    <link href="CSS/Gridstyle.css" rel="stylesheet" type="text/css" />
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:Label ID="Label1" Style="float: right; margin-right: 25px" runat="server" Text=""></asp:Label>
    <br />  <br />
    <asp:Button ID="BtnLogout" Visible="True" Style="float: right; margin-right: 25px" runat="server" Text="Logout" />
    <br />
    <center><strong style="font-size: xx-large">Buy Properties</strong></center>
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
        <table style="margin-left: 500px">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LblState" runat="server" Text="Select your state:-"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDlState" runat="server" Width="200px"></asp:DropDownList>
                    &nbsp;</td>
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
                    <asp:Button ID="BtnSearch" runat="server" Style="height: 30px; width: 140px" Text="Search" />
                </td>
            </tr>

            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>

        </table>

    </div>
    <div style="margin-left: 175px">
        <asp:GridView ID="GridSearch" runat="server" CssClass="Grid"
            AlternatingRowStyle-CssClass="alt"
            PagerStyle-CssClass="pgr"
            CellPadding="10" CellSpacing="10" Width="998px" PageSize="5" BackColor="#99CCFF" BorderWidth="1px" ForeColor="Black" BorderColor="Black">
            <Columns>
                <asp:ImageField DataImageUrlField="Photo" ControlStyle-Height="150px" ControlStyle-Width="150px">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
            </Columns>
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
            <HeaderStyle BackColor="#E6F1FF" Font-Size="X-Large" ForeColor="Black" />
            <PagerStyle CssClass="pgr"></PagerStyle>
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E8F7FF" />
        </asp:GridView>
    </div>


</asp:Content>

