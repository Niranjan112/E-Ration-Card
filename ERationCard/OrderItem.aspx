<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderItem.aspx.cs" Inherits="OrderItem" %>

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
                        <li class="active">Manage Order Details</li>
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
                                <h3 class="panel-title">Manage Order Details</h3>
                            </div>
                            <div class="panel-body">
                                <div class="validation-form" id="divRecord" style="padding: 0 !important">
                                    <span style="color: red;">Note : (*) marked filled are mandotory</span>
                                    <div class="clearfix"></div>
                                    <div>
                                        <div class="col-md-4 form-group1 mtop15">
                                            <asp:DropDownList ID="ddlItem" runat="server" CssClass="ddlselect" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last mtop15">
                                            <asp:DropDownList ID="ddlQuantity" runat="server" CssClass="ddlselect" OnSelectedIndexChanged="ddlQuantity_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="0">Select Quantity</asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtAmount" runat="server" placeholder="Total Amount" CssClass="textInputStyle" Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="txtAmount" ErrorMessage="*" ForeColor="Red" ValidationGroup="savedata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12 form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="ADD" OnClick="btnSave_Click" ValidationGroup="savedata" CssClass="panel-heading" />
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Quantity(per kg/ltr)</th>
                                                    <th>Total Amount</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rptData" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%#Eval("FName") %></td>
                                                            <td><%#Eval("Quantity") %></td>
                                                            <td><%#Eval("Amount") %></td>
                                                            <td>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" Text="click here"
                                                                    OnClick="DeleteData" PID='<%#Eval("id") %>' OnClientClick="return confirm('Are you sure to delete this record?');"></asp:LinkButton>

                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:TextBox ID="txtRelationalReference" runat="server" CssClass="textInputStyle" onkeypress="if(event.KeyCode<48||event.keyCode>57)event.returnValue=false;" placeholder="Relational Reference *"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                ControlToValidate="txtRelationalReference" ErrorMessage="*" ForeColor="Red" ValidationGroup="checkrelationaldata"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:Button ID="btnCheck" runat="server" Text="Check Member" OnClick="btnCheck_Click" ValidationGroup="checkrelationaldata" CssClass="panel-heading" />
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div>
                                        <div class="col-md-4 form-group1 form-last">
                                            <asp:DropDownList ID="ddlRelation" runat="server" CssClass="ddlselect">
                                                <asp:ListItem Value="0">Select Relation</asp:ListItem>
                                                <asp:ListItem Value="Self">Self</asp:ListItem>
                                                <asp:ListItem Value="Wife">Wife</asp:ListItem>
                                                <asp:ListItem Value="Son">Son</asp:ListItem>
                                                <asp:ListItem Value="Doughter">Doughter</asp:ListItem>
                                                <asp:ListItem Value="Sibling">Sibling</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            &nbsp;
                                        </div>
                                        <div class="col-md-4 form-group1">
                                            &nbsp;
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <asp:Button ID="btnInsert" runat="server" Text="SAVE" OnClick="btnInsert_Click" ValidationGroup="checkdata" CssClass="panel-heading" Enabled="false" />
                                        
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

