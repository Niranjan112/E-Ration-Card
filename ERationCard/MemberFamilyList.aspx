<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberFamilyList.aspx.cs" Inherits="MemberFamilyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                            <h3 class="panel-title">Manage Member Family Details</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Relation</th>
                                                                <th>Edit</th>
                                                                <th>Delete</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rptData" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%#Eval("FName") %>&nbsp;<%#Eval("MName") %>&nbsp;<%#Eval("LName") %></td>
                                                                        <td><%#Eval("Relation") %></td>
                                                                        <td>
                                                                            <asp:LinkButton ID="lktitle1" runat="server" Text="click here"
                                                                                OnClick="showdata" PID='<%#Eval("id") %>'></asp:LinkButton>
                                                                            </td><td>
                                                                            <asp:LinkButton ID="LinkButton2" runat="server" Text="click here"
                                                                                OnClick="DeleteData" PID='<%#Eval("id") %>' OnClientClick="return confirm('Are you sure to delete this record?');"></asp:LinkButton>

                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                    <asp:Button ID="Button1" runat="server" Text="ADD" OnClick="btnAdd_Click" CssClass="panel-heading" />
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

