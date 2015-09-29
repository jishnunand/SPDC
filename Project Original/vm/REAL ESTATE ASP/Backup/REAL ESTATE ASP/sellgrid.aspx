<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sellgrid.aspx.cs" Inherits="REAL_ESTATE_ASP.sellgrid" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Real Estate</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="home.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home.css" type="text/css" media="all"/>
    <style type="text/css">
        #TextArea1
        {
            height: 72px;
            width: 152px;
        }
    </style>
</head>
<header>
<body>
    <form id="form1" runat="server">
<div>
<h1><a href="#"><strong>Cosco</strong> Real Estate</a></h1>
    <center><strong style="font-size: xx-large">
Property Details
</strong></center>
<br />
        </div>
   
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        AllowPaging="True" CellPadding="4"
        
        
        style="top: 195px; left: 363px; position: absolute; height: 271px; width: 417px" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" 
        BorderWidth="3px"
        PageSize="5" CellSpacing="2" ForeColor="Black">
        <Columns>
        <asp:TemplateField HeaderText="Fname">
        <ItemTemplate>
        <asp:Label ID="lblfname" runat="server" Text='<%#Eval("fname") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="name" runat="server" Text='<%Bind("fname") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Lname">
        <ItemTemplate>
        <asp:Label ID="lbllname" runat="server" Text='<%#Eval("lname") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="district" runat="server" Text='<%Bind("lname") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="District">
        <ItemTemplate>
        <asp:Label ID="lbldistrict" runat="server" Text='<%#Eval("district") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="district" runat="server" Text='<%Bind("district") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="Property">
        <ItemTemplate>
        <asp:Label ID="lblproperty" runat="server" Text='<%#Eval("property") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="property" runat="server" Text='<%Bind("property") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="Price">
        <ItemTemplate>
        <asp:Label ID="lblprice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="price" runat="server" Text='<%Bind("price") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>

        <%--<asp:ImageField HeaderText="Image" DataImageUrlField="imagepath"></asp:ImageField>--%>

       

         <asp:TemplateField HeaderText="Contact">
        <ItemTemplate>
        <asp:Label ID="lblcontact" runat="server" Text='<%#Eval("contact") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="contact" runat="server" Text='<%Bind("contact") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Images">
        <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("imagepath") %>' Target="_blank" runat="server">Image</asp:HyperLink>
        </ItemTemplate>
        </asp:TemplateField>


        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:Button ID="btn" Text="Return" runat="server" onclick="btn_Click" />
                </form>
                 </body>
    </header>
</html>
