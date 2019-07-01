<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Ration Card</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Minimal Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/font-awesome.css" rel="stylesheet">
    <style>
        .ddlselect {
            width: 100%;
            border: 1px solid #E9E9E9;
            font-size: 0.9em;
            width: 100%;
            outline: none;
            padding: 0.5em 1em;
            color: #999;
            margin-top: 0.5em;
            font-family: 'Muli-Regular';
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <h1><a href="index.html">E Ration Card Forgot Password </a></h1>
            <div class="login-bottom">
                <h2>Login</h2>
                <div class="col-md-6">
                    <div class="login-mail">
                        <input id="txtUsername" type="text" placeholder="Username" runat="server">
                        <i class="fa fa-envelope"></i>
                    </div>
                    <a class="news-letter " href="#">
                        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                    </a>
                </div>
                <div class="col-md-6 login-do">
                    <label class="hvr-shutter-in-horizontal login-sub">
                        <asp:Button ID="btnLogin" runat="server" Text="Submit" OnClick="btnLogin_Click" />
                    </label>
                    <label class="hvr-shutter-in-horizontal login-sub">
                        <a href="Login.aspx">Back</a>
                    </label>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
        <!---->
        <div class="copy-right">
            <p>&copy; 2017 E Ration Card. All Rights Reserved</p>
        </div>
        <!---->
        <!--scrolling js-->
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
    </form>
</body>
</html>
