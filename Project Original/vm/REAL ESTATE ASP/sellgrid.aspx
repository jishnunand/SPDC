<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sellgrid.aspx.cs" Inherits="REAL_ESTATE_ASP.sellgrid" %>
<!DOCTYPE htlml>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Real Estate</title>
<meta charset="utf-8" />
    
<%--<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>--%>
    <style type="text/css">
        #TextArea1
        {
            height: 72px;
            width: 152px;
        }
        #form1 {
            height: 521px;
        }
    </style>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var markers=[
<asp:Repeater ID="rptMarkers" runat="server">
<ItemTemplate>
{
    "title":'<%# Eval("Name")%>',
    "lat":'<%# Eval("Latitude")%>',
    "title":'<%# Eval("Longitude")%>',
    "title":'<%# Eval("Description")%>'
}
</ItemTemplate>
<SeparatorTemplate>
,
</SeparatorTemplate>
        </asp:Repeater>
        ];
</script>

    <script type="text/javascript">
        window.onload=function() {
            var mapOptions = {
                center:new google.maps.LatLng(markers[0].lat,markers[0].lng),
                zoom:8,
                mapTypeId:google.maps.mapTypeId.ROADMAP
            };
            var infoWindow=new google.maps.infoWindow();
            var map=new google.maps.Map(document.getElementById("dvMap"),mapOptions);
            for(i=0;i<markers.length;i++) {
                var data=markers[i]
                var marker=new google.maps.Marker({
                    position:myLatlng,
                    map:map,
                    title:data.title
                });
                (function (marker,data) {
                    google.maps.event.addListener(marker,"click",function(e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map,marker);
                    });
                })(marker,data);
            }
        }
</script>

    <style type="text/css">
        .buttonLogin {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            padding: 6px 6px;
            border: 1px solid #618839;
            border-radius: 8px;
            background: -webkit-gradient(linear, left top, left bottom, from (#aee378), to(#618839));
            background: -moz-linear-gradient(top, #aee378, #618839);
            background: linear-gradient(to bottom, #aee378, #618839);
            font: normal normal bold 12px arial;
            color: #ffffff;
            text-decoration: none;
        }
</style>








</head>
<body style="height:291px">
    <form id="form1" runat="server">
        <div class="logo">
      <h1><a href="#"><strong>Cosco</strong> Real Estate</a></h1>
    </div>
        <center><strong style="font-size: xx-large">
        Buy Properties</strong></center>
     
       <%-- <div id="dvMap" style="width:516px; height:483px">

        </div>--%>



<div> 
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging"
        AllowPaging="True" CellPadding="4"
        
        
        style="top: 225px; left: 404px; position: absolute; height: 271px; width: 417px"
        PageSize="5" ForeColor="#333333" GridLines="Both">
        <AlternatingRowStyle BackColor="White" />
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
        <asp:HyperLink ID="HyperLink1" CssClass="buttonLogin"  NavigateUrl='<%# Eval("imagepath") %>' Target="_blank" runat="server">Image</asp:HyperLink>
        </ItemTemplate>
        </asp:TemplateField>


        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:Button ID="btn" Text="Return" CssClass="buttonLogin" runat="server" onclick="btn_Click" style="top: 42px; left: 969px; position: absolute; height: 26px; width: 91px" />
    </div>
                
                </form>
                 </body>
</html>
