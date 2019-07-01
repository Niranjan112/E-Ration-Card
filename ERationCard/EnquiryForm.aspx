<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="EnquiryForm.aspx.cs" Inherits="EnquiryForm" %>

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
                        <li><a href="Dashboard.aspx">Home</a></li>
                        <li class="active">Enquiry Form</li>
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
                                <h3 class="panel-title">Manage Member Details</h3>
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
                                            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="txtSubject" ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtMessage" runat="server" placeholder="Message *" CssClass="textInputStyle"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="txtMessage" ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:Button ID="btnEnquiry" runat="server" Text="SEND ENQUIRY" ValidationGroup="savedata" CssClass="panel-heading" OnClick="btnEnquiry_Click" />
                                        </div>
                                        <div class="clearfix"></div>
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

