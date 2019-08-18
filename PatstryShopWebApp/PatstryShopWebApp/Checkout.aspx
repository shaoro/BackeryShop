<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="PatstryShopWebApp.Checkout" %>
<asp:Content ID="ContentArea" ContentPlaceHolderID="MainContent" runat="server">

    <table cellpadding="2" class="auto-style1">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label_item_1" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label_qty_1" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label_pr_1" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label_item_2" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label_qty_2" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label_pr_2" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label_item_3" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label_qty_3" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label_pr_3" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label_item_4" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label_qty_4" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label_pr_4" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label_item_5" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label_qty_5" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label_pr_5" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label_item_6" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label_qty_6" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label_pr_6" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>


    <asp:Label ID="Label_total_price" runat="server" Text="Label"></asp:Label><br />



    <asp:Button ID="Button_to_payment" runat="server" OnClick="Button_to_payment_Click" Text="Proceed to Payment Details" PostBackUrl="~/Payment.aspx" />


</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 27%;
            border-collapse: collapse;
            height: 100%;
            border: 2px solid #000000;
        }
        .auto-style2 {
            width: 170px;
        }
        .auto-style3 {
            width: 266px;
        }
        .auto-style4 {
            width: 68px;
        }
    </style>
</asp:Content>

