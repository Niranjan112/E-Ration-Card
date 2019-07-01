<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="AvailableItemList.aspx.cs" Inherits="AvailableItemList" %>

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
                    <h4 class="pull-left page-title">Item Availability</h4>
                    <ol class="breadcrumb pull-right">
                        <li><a href="MemberDashboard.aspx">Home</a></li>
                        <li class="active">Item List</li>
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
                                            <h3 class="panel-title">Manage Item Details</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div>
                                                        <div class="col-md-4 form-group1 form-last">
                                                            <asp:TextBox ID="txtValue" runat="server" placeholder="Item Name *" CssClass="textInputStyle"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                ControlToValidate="txtValue" ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-md-4 form-group1 form-last">
                                                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="panel-heading" ValidationGroup="savedata" OnClick="btnSearch_Click" />
                                                            <asp:Button ID="btnSearchAll" runat="server" Text="Display All" CssClass="panel-heading" OnClick="btnSearchAll_Click" />
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Amount(per kg/ltr)</th>
                                                                <th>Availability</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rptData" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%#Eval("Name") %></td>
                                                                        <td><%#Eval("Amount") %></td>
                                                                        <td><%#Eval("Availability") %></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
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

