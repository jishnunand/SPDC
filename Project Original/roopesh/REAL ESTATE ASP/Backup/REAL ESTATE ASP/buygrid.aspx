<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buygrid.aspx.cs" Inherits="REAL_ESTATE_ASP.buygrid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript"src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
var markers=[
<asp:Repeater ID="rptMarkers" runat="server">
<ItemTemplate>
{
"title":'<% #Eval("name")%',
"lat":'<% #Eval("Latitude")%',
"lng":'<%# Eval("Longitude")%',
"description":'<%#Eval("Description")%',
}
</ItemTemplate>
<SeperatorTemplate>
,
</SeperatorTemplate>
        </asp:Repeater>
        ];
</script>

<script type="text/javascript">
window.onload=function()
{
var mapOptions={
Center:new google.maps.LatLng(markers[0].lat,markers[0].lng),
zoom:8,
mapTypeId:google.maps.MapTypeId.ROADMAP
};
var infoWindow=new google.mapsInfoWindow();
var map=new google.maps.Map(document.getElementById("dvMap")mapOptions);
for(i=0;i<markers.length;i++)
{
var data=markers[i]
var myLatlng=new google.maps.LatLng(data.lat,data.lng);
var marker=new google.maps.Marker({
position:myLatlng,
map:map,
title:data.title
});
(function(marker,data){
google.maps.event.addListener(marker,"click",function(e){
infoWindow.SetContent(data.description);
infoWindow.open(map,marker);
});
})(marker,data);
}
}
</script>
</head>
<body style="height:291px">
    <form id="form1" runat="server">
    <div id="dvMap" style="width:500px; height:500px">      
    </div>
    <div>
    </div>
    </form>
</body>
</html>
