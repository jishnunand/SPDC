<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buygrid.aspx.cs" Inherits="REAL_ESTATE_ASP.buygrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home2.css" type="text/css" media="all"/>
<link rel="stylesheet" href="home3.css" type="text/css" media="all"/>
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
</head>
<body style="height:291px">
    <form id="form1" runat="server">
        <div id="dvMap" style="width:531px; height:509px">

        </div>
    <div>
    
    </div>
    </form>
</body>
</html>
