<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberList.aspx.cs" Inherits="MemberList" %>

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
                    <h4 class="pull-left page-title">Manage Member Details</h4>
                    <ol class="breadcrumb pull-right">
                        <li><a href="Dashboard.aspx">Home</a></li>
                        <li class="active">Member List</li>
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
                                            <h3 class="panel-title">Manage Member Details</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div class="clearfix"></div>
                                                    <div>
                                                        <div class="col-md-4 form-group1 mtop15">
                                                            <asp:DropDownList ID="ddlSearch" runat="server" CssClass="ddlselect">
                                                                <asp:ListItem Value="1">Relational Reference</asp:ListItem>
                                                                <asp:ListItem Value="2">Name</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-md-4 form-group1 form-last">
                                                            <asp:TextBox ID="txtValue" runat="server" placeholder="Search Detail *" CssClass="textInputStyle"></asp:TextBox>
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
                                                                <th>Relational Reference</th>
                                                                <th>Name</th>
                                                                <th>Edit</th>
                                                                <th>Delete</th>
                                                                <th>Family Details</th>
                                                                <th>Order Details</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rptData" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%#Eval("RelationalNumber") %></td>
                                                                        <td><%#Eval("FName") %>&nbsp;<%#Eval("MName") %>&nbsp;<%#Eval("LName") %></td>
                                                                        <td>
                                                                            <asp:LinkButton ID="lktitle1" runat="server" Text="click here"
                                                                                OnClick="showdata" PID='<%#Eval("id") %>'></asp:LinkButton>
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="LinkButton2" runat="server" Text="click here"
                                                                                OnClick="DeleteData" PID='<%#Eval("id") %>' OnClientClick="return confirm('Are you sure to delete this record?');"></asp:LinkButton>
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="LinkButton3" runat="server" Text="click here"
                                                                                OnClick="showdetails" PID='<%#Eval("id") %>'></asp:LinkButton>
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server" Text="click here"
                                                                                OnClick="showorderdetails" PID='<%#Eval("RelationalNumber") %>'></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                    <asp:Button ID="btnAdd" runat="server" Text="ADD" OnClick="btnAdd_Click" CssClass="panel-heading" />

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

