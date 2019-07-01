<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="Admin_AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table>
            <tr>
                <td>
                    Brand Name :
                </td>
                <td>
                    <asp:TextBox ID="txtBrand" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Activate :
                </td>
                <td>
                    <asp:CheckBox ID="chkAct" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="SAVE" onclick="btnSave_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="RESET" 
                        onclick="btnReset_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="BACK" onclick="btnBack_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

