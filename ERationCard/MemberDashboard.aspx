<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="MemberDashboard.aspx.cs" Inherits="MemberDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="page-header-title">
                    <h4 class="pull-left page-title">Dashboard</h4>
                    <ol class="breadcrumb pull-right">
                        <li><a href="MemberDashboard.aspx">Home</a></li>
                        <li class="active">Member Details</li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="col-sm-12 col-lg-12">
                    <div class="panel panel-primary">

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Member Details</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div style="width: 100%; float: left">
                                                        <div style="width: 75%; float: left; margin-left: 1%;">
                                                            <div class="validation-form" id="div1" runat="server">
                                                                <div class="vali-form">
                                                                    <div class="col-md-6 form-group1" style="width: 100% !important;">
                                                                        <label class="control-label">Relational Reference :</label>
                                                                        <asp:Label ID="lblRegCode" runat="server" Text="Label"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Relation :</label>
                                                                        <asp:Label ID="lblRelation" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Name :</label>
                                                                        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Contact :</label>
                                                                        <asp:Label ID="lblContact" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Email ID :</label>
                                                                        <asp:Label ID="lblEmailID" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Gender :</label>
                                                                        <asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Address :</label>
                                                                        <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">District :</label>
                                                                        <asp:Label ID="lblDistrict" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Taluka :</label>
                                                                        <asp:Label ID="lblTaluka" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Annual Income :</label>
                                                                        <asp:Label ID="lblIncome" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <label class="control-label">Designation :</label>
                                                                        <asp:Label ID="lblDesignation" runat="server" Text="Label"></asp:Label>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="width: 20%; float: left;" class="divAlign">
                                                            <div class="validation-form" id="div2" runat="server">
                                                                <div class="clearfix"></div>
                                                                <div class="vali-form">
                                                                    <div class="col-md-12 form-group1 ">
                                                                        <asp:Image ID="Image1" runat="server" Height="150px" Width="150px" />
                                                                        <div class="clearfix"></div>
                                                                    </div>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>

