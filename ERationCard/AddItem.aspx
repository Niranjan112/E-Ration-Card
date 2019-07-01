<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="AddItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .normalRow {
            background-color: #FCFCFC;
        }

        .alternateRow {
            background-color: #ECECEC;
        }

        .curPointer {
            cursor: pointer;
        }

        .has-error-border {
            border-bottom: #a94442 solid 1px !important;
        }

        .txtAlign {
            text-align: center;
        }

        .registration {
            height: 58px;
            padding: 0px 40px 0 0;
        }

        .textInputStyle {
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

        .ddlselect {
            width: 100% !important;
            padding: 4px 0px !important;
            font-family: 'Roboto', sans-serif;
            font-weight: 400 !important;
            font-size: 16px !important;
            border-bottom: #cecece solid 1px !important;
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            background-color: transparent !important;
        }

        .mtop15 {
            margin-top: 15px;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="page-header-title">
                    <h4 class="pull-left page-title">Dashboard</h4>
                    <ol class="breadcrumb pull-right">
                        <li><a href="InstituteDashboard.aspx">Edulize</a></li>
                        <li class="active">Manage Item Details</li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-sm-12 col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Manage Item Details</h3>
                            </div>
                            <div class="panel-body">
                                <div class="validation-form" id="divRecord" style="padding: 0 !important">
                                    <span style="color: red;">Note : (*) marked filled are mandotory</span>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12 form-group1 ">
                                        <div id="errordiv" style="color: red;"></div>
                                        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                                        <input id="txtRef" runat="server" style="display: none;" />
                                    </div>
                                    <div class="clearfix"></div>
                                    <div>
                                        <div class="col-md-4 form-group1">
                                            <asp:TextBox ID="txtFName" runat="server" placeholder="Name *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="txtFName" ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtAmount" runat="server" placeholder="Amount(per Kg/Ltr) *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="txtAmount" ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last mtop15">
                                            <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="ddlselect">
                                                <asp:ListItem Value="0">Select Availability</asp:ListItem>
                                                <asp:ListItem Value="Available">Available</asp:ListItem>
                                                <asp:ListItem Value="Not-Available">Not-Available</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12 form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" ValidationGroup="savedata" CssClass="panel-heading" />
                                        <asp:Button ID="btnReset" runat="server" Text="RESET"
                                            OnClick="btnReset_Click" CssClass="panel-heading" />
                                        <asp:Button ID="btnBack" runat="server" Text="BACK" OnClick="btnBack_Click" CssClass="panel-heading" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

