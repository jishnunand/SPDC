<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FrmReg.aspx.vb" Inherits="FrmReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="CSS/master.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            background: url('/assets/example/bg_suburb.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
    <script>
        function CheckLNullOrEmpty() {
            var inputText = document.getElementById("TxtUserName").value;
            var textLength = inputText.length;
            if (textLength == 0) {
                alert("Enter Name");
                document.getElementById("TxtUserName").background = "#a52a2a" //change it to right color code
                document.getElementById("TxtUserName").focus();

            }
        }

    </script>

</head>
<body style="background-image: url(images/5.jpg)">
    <form id="form1" runat="server">
        <div style="margin-top: 50px">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="">
                            <div class="">
                                <h2 class="text-center" style="color: red">Register Here</h2>

                            </div>
                            <div class="panel-body">

                                <fieldset>
                                    <div class="form-group has-error">
                                        <asp:TextBox ID="TxtUserName" onBlur="CheckNullOrEmpty()" placeholder="UserName" class="form-control input-lg" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RfUsername" runat="server" ErrorMessage="Enter UserName" Font-Size="Larger" ForeColor="Red" ToolTip="Enter UserName" ControlToValidate="TxtUserName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group has-success">
                                        <asp:TextBox ID="TxtPassWord" TextMode="Password" placeholder="Password" class="form-control input-lg" runat="server"></asp:TextBox>
                                   <%-- <asp:RangeValidator ID="RagPassword" ForeColor="#CC3300" runat="server" ErrorMessage="Password Must be 6-21 charecter." ControlToValidate="TxtPassWord" MinimumValue="6" MaximumValue="15" ToolTip="Password Must be 6-21 charecter." Type="Integer" Font-Size="Larger"></asp:RangeValidator>--%>
                                         <asp:RequiredFieldValidator ID="RfPwd" runat="server" ErrorMessage="*" Font-Size="Larger" ForeColor="Red" ToolTip="Enter Password" ControlToValidate="TxtPassWord"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group has-success">
                                        <asp:TextBox ID="TxtCpWd" TextMode="Password" placeholder="Confirm Password" class="form-control input-lg" runat="server"></asp:TextBox>
                                        <asp:CompareValidator ID="CmpPwd" runat="server" ErrorMessage="Password Mismatch" ControlToCompare="TxtPassWord" ControlToValidate="TxtCpWd" Font-Size="Larger" ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                    <div class="form-group has-success">
                                        <asp:TextBox ID="TxtMailid" placeholder="Email-Id" class="form-control input-lg" runat="server"></asp:TextBox>
                                    </div><br />
                                    <div class="form-group has-success">
                                        <asp:TextBox ID="TxtMobile" placeholder="MobileNo." class="form-control input-lg" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="BtnSubmit" runat="server" Text="Submit" class="btn btn-lg btn-primary btn-block" />
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
