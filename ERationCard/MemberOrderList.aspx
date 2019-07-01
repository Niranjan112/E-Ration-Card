<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberOrderList.aspx.cs" Inherits="MemberOrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="page-header-title">
                    <h4 class="pull-left page-title">Manage Order Details</h4>
                    <ol class="breadcrumb pull-right">
                        <li><a href="Dashboard.aspx">Home</a></li>
                        <li class="active">Order Details</li>
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
                                            <h3 class="panel-title">Manage Order Details</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Order ID</th>
                                                                <th>Relational Reference</th>
                                                                <th>Total Amount</th>
                                                                <th>Date</th>
                                                                <th>Details</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rptData" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%#Eval("lstr1") %></td>
                                                                        <td><%#Eval("lstr2") %></td>
                                                                        <td><%#Eval("lstr3") %></td>
                                                                        <td><%#Eval("lstr4") %></td>
                                                                        <td>
                                                                            <asp:LinkButton ID="lktitle1" runat="server" Text="click here"
                                                                                OnClick="showdata" PID='<%#Eval("lstr1") %>' RID='<%#Eval("lstr2") %>'></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-md-12 form-group">
                                                    <asp:Button ID="btnBack" runat="server" Text="BACK" OnClick="btnBack_Click" CssClass="panel-heading" />
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

