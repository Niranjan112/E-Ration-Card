<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AddMember.aspx.cs" Inherits="AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="assets/css/jquery.ui.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/JQuery.ui.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".textStyle").keypress(function (event) {
                var inputValue = event.which;
                // allow letters and whitespaces only.
                if (!(inputValue >= 65 && inputValue <= 120) && (inputValue != 32 && inputValue != 0)) {
                    event.preventDefault();
                }
            });

            $("#ContentPlaceHolder1_txtDOB").keypress(function (event) {
                var inputValue = event.which;
                // allow letters and whitespaces only.
                if (!(inputValue >= 65 && inputValue <= 120) && (inputValue != 32 && inputValue != 0) && (inputValue >= 48 && inputValue <= 57) && inputValue != 8) {
                    event.preventDefault();
                }
            });

            $("#ContentPlaceHolder1_txtDOB").datepicker(
                {
                    onSelect: function (date) {
                        $("#ContentPlaceHolder1_txtDOB").val(date);
                    },
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '-30:+1M',
                    maxDate: '-19Y'
                });

        });
    </script>
    <style>
        .normalRow
        {
            background-color: #FCFCFC;
        }
        
        .alternateRow
        {
            background-color: #ECECEC;
        }
        
        .curPointer
        {
            cursor: pointer;
        }
        
        .has-error-border
        {
            border-bottom: #a94442 solid 1px !important;
        }
        
        .txtAlign
        {
            text-align: center;
        }
        
        .registration
        {
            height: 58px;
            padding: 0px 40px 0 0;
        }
        
        .textInputStyle
        {
            width: 100% !important;
            padding: 7px 4px !important;
            font-family: 'hind';
            font-weight: 400 !important;
            color: #222222 !important;
            font-size: 16px !important;
            border-bottom: #cecece solid 1px;
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            background-color: transparent !important;
            transition: all 0.2s ease-in !important;
        }
        
        .textStyle
        {
            width: 100% !important;
            padding: 7px 4px !important;
            font-family: 'hind';
            font-weight: 400 !important;
            color: #222222 !important;
            font-size: 16px !important;
            border-bottom: #cecece solid 1px;
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            background-color: transparent !important;
            transition: all 0.2s ease-in !important;
        }
        
        .ddlselect
        {
            width: 100% !important;
            padding: 4px 0px !important;
            font-family: 'Roboto' , sans-serif;
            font-weight: 400 !important;
            font-size: 16px !important;
            border-bottom: #cecece solid 1px !important;
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            background-color: transparent !important;
        }
        
        .mtop15
        {
            margin-top: 15px;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="page-header-title">
                    <h4 class="pull-left page-title">
                        Dashboard</h4>
                    <ol class="breadcrumb pull-right">
                        <li><a href="Dashboard.aspx">Home</a></li>
                        <li class="active">Manage Member Details</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-sm-12 col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Manage Member Details</h3>
                            </div>
                            <div class="panel-body">
                                <div class="validation-form" id="divRecord" style="padding: 0 !important">
                                    <span style="color: red;">Note : (*) marked filled are mandotory</span>
                                    <div class="clearfix">
                                    </div>
                                    <div class="col-md-12 form-group1 ">
                                        <div id="errordiv" style="color: red;">
                                        </div>
                                        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                                        <input id="txtRef" runat="server" style="display: none;" />
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="txtFName" runat="server" placeholder="First Name *" CssClass="textStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtMName" runat="server" placeholder="Middle Name *" CssClass="textStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMName"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtLName" runat="server" placeholder="Last Name *" CssClass="textStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtLName"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <div>
                                        <div class="col-md-4 form-group1 form-last">
                                            Profile Image :
                                            <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;
                                            <asp:ImageButton ID="imgbtn1" runat="server" Width="20px" Height="20px" ImageUrl="~/images/del.jpg"
                                                ImageAlign="Middle" PID='<%#Eval("id")%>' OnClick="DeleteFile" OnClientClick="return confirm('Are you sure to delete this File?');"
                                                Visible="False" />
                                            &nbsp;
                                            <asp:Label ID="lblfilename" runat="server"></asp:Label>
                                            <asp:Label ID="lblerror" runat="server" Text="Invalid File..!!" Visible="False" ForeColor="Red"></asp:Label>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="txtDOB" runat="server" placeholder="DOB *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtDOB" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1 mtop15">
                                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="ddlselect">
                                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtContact" runat="server" CssClass="textInputStyle" onkeypress="if(event.KeyCode<48||event.keyCode>57)event.returnValue=false;"
                                                MaxLength="12" placeholder="Contact *"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContact"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="TxtEmail" runat="server" CssClass="textInputStyle" placeholder="Email *"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtEmail"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail"
                                                ErrorMessage="Enter valid Email Id!" ValidationGroup="savedata" ForeColor="Red"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="txtAddress" CssClass="textInputStyle" runat="server" placeholder="Address *"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="col-md-4 form-group1 form-last mtop15">
                                            <asp:DropDownList ID="ddlState" runat="server" CssClass="ddlselect">
                                                <asp:ListItem Value="0">Select State</asp:ListItem>
                                                <asp:ListItem Value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</asp:ListItem>
                                                <asp:ListItem Value="Andhra Pradesh">Andhra Pradesh</asp:ListItem>
                                                <asp:ListItem Value="Arunachal Pradesh">Arunachal Pradesh</asp:ListItem>
                                                <asp:ListItem Value="Assam">Assam</asp:ListItem>
                                                <asp:ListItem Value="Bihar">Bihar</asp:ListItem>
                                                <asp:ListItem Value="Chandigarh">Chandigarh</asp:ListItem>
                                                <asp:ListItem Value="Chhattisgarh">Chhattisgarh</asp:ListItem>
                                                <asp:ListItem Value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</asp:ListItem>
                                                <asp:ListItem Value="Daman and Diu">Daman and Diu</asp:ListItem>
                                                <asp:ListItem Value="Delhi">Delhi</asp:ListItem>
                                                <asp:ListItem Value="Goa">Goa</asp:ListItem>
                                                <asp:ListItem Value="Gujarat">Gujarat</asp:ListItem>
                                                <asp:ListItem Value="Haryana">Haryana</asp:ListItem>
                                                <asp:ListItem Value="Himachal Pradesh">Himachal Pradesh</asp:ListItem>
                                                <asp:ListItem Value="Jammu and Kashmir">Jammu and Kashmir</asp:ListItem>
                                                <asp:ListItem Value="Jharkhand">Jharkhand</asp:ListItem>
                                                <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                                                <asp:ListItem Value="Kerala">Kerala</asp:ListItem>
                                                <asp:ListItem Value="Lakshadweep">Lakshadweep</asp:ListItem>
                                                <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                                                <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                                                <asp:ListItem Value="Manipur">Manipur</asp:ListItem>
                                                <asp:ListItem Value="Meghalaya">Meghalaya</asp:ListItem>
                                                <asp:ListItem Value="Mizoram">Mizoram</asp:ListItem>
                                                <asp:ListItem Value="Nagaland">Nagaland</asp:ListItem>
                                                <asp:ListItem Value="Orissa">Orissa</asp:ListItem>
                                                <asp:ListItem Value="Pondicherry">Pondicherry</asp:ListItem>
                                                <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                                                <asp:ListItem Value="Rajasthan">Rajasthan</asp:ListItem>
                                                <asp:ListItem Value="Sikkim">Sikkim</asp:ListItem>
                                                <asp:ListItem Value="Tamil Nadu">Tamil Nadu</asp:ListItem>
                                                <asp:ListItem Value="Tripura">Tripura</asp:ListItem>
                                                <asp:ListItem Value="Uttaranchal">Uttaranchal</asp:ListItem>
                                                <asp:ListItem Value="Uttar Pradesh">Uttar Pradesh</asp:ListItem>
                                                <asp:ListItem Value="West Bengal">West Bengal</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="txtDistrict" runat="server" placeholder="District *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDistrict"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="txtTaluka" runat="server" placeholder="Taluka *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtTaluka"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtIncome" runat="server" placeholder="Annual Income *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtIncome"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="txtDesignation" runat="server" placeholder="Designation *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDesignation"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" ValidationGroup="savedata"
                                            CssClass="panel-heading" />
                                        <asp:Button ID="btnReset" runat="server" Text="RESET" OnClick="btnReset_Click" CssClass="panel-heading" />
                                        <asp:Button ID="btnBack" runat="server" Text="BACK" OnClick="btnBack_Click" CssClass="panel-heading" />
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
