<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_sell.aspx.cs" Inherits="REAL_ESTATE_ASP.Admin_sell" %>

<!DOCTYPE htlml>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Real Estate</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>   
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
    <style type="text/css">
        #TextArea1
        {
            height: 72px;
            width: 152px;
        }
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

</head>
<body>
    <form id="form1" runat="server">
        <div class="logo">
<h1><a href="#"><strong>Cosco</strong> Real Estate</a></h1>
</div>
        <center><strong style="font-size: xx-large">
Selling Properties
</strong></center>
        <asp:Button ID="Button1" runat="server" CssClass="buttonLogin" OnClick="Button1_Click" style="top: 146px; left: 1008px; position: absolute; height: 26px; width: 80px" Text="Return" />
<div> 
  <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="true" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" style="top: 218px; left: 229px; position: absolute; height: 187px; width: 819px" AllowPaging="True" PageSize="3">
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
        <asp:TextBox ID="lname" runat="server" Text='<%Bind("lname") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>



 <asp:TemplateField HeaderText="Age">
        <ItemTemplate>
        <asp:Label ID="lblage" runat="server" Text='<%#Eval("Age") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="age" runat="server" Text='<%Bind("Age") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Gender">
        <ItemTemplate>
        <asp:Label ID="lblgender" runat="server" Text='<%#Eval("gender") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="gender" runat="server" Text='<%Bind("gender") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>

        


         <asp:TemplateField HeaderText="Phno">
        <ItemTemplate>
        <asp:Label ID="lblphno" runat="server" Text='<%#Eval("ph_no") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="phno" runat="server" Text='<%Bind("ph_no") %>'></asp:TextBox>
        </td>
        </tr>
        </table>
        </EditItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="State">
        <ItemTemplate>
        <asp:Label ID="lblstate" runat="server" Text='<%#Eval("state") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
        <table>
        <tr>
        <td>
        <asp:TextBox ID="state" runat="server" Text='<%Bind("state") %>'></asp:TextBox>
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

         <asp:TemplateField HeaderText="Images">
        <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" CssClass="buttonLogin" NavigateUrl='<%# Eval("imagepath") %>' Target="_blank" runat="server">Image</asp:HyperLink>
        </ItemTemplate>
        </asp:TemplateField>


                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" runat="server" CommandName="delete" Text="Delete" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>--%>


                </Columns>







            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />







        </asp:GridView>

  
    </div>
                
                </form>
                 </body>
</html>
