<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="PatstryShopWebApp.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label6" runat="server" Text="Please Select Your Pickup Time"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style12" Height="20px" Width="165px">
        <asp:ListItem>6AM</asp:ListItem>
        <asp:ListItem>9AM</asp:ListItem>
        <asp:ListItem>1PM</asp:ListItem>
        <asp:ListItem>3PM</asp:ListItem>
        <asp:ListItem>4PM</asp:ListItem>
        <asp:ListItem>5PM</asp:ListItem>
        <asp:ListItem>6PM</asp:ListItem>
        <asp:ListItem>8PM</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style13" Height="18px" Width="315px">
        <asp:ListItem>Sunday</asp:ListItem>
        <asp:ListItem>Monday</asp:ListItem>
        <asp:ListItem>Tuesday</asp:ListItem>
        <asp:ListItem>Wednesday</asp:ListItem>
        <asp:ListItem>Thursday</asp:ListItem>
        <asp:ListItem>Friday</asp:ListItem>
        <asp:ListItem>Saturday</asp:ListItem>
    </asp:DropDownList>
    <br />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <table cellpadding="2" class="auto-style10">
        <tr>
            <td>
                <asp:Label ID="Label_final_price" runat="server" Text="Label"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                <asp:Label ID="Label4" runat="server" Text="Credit Card Number"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                <asp:Label ID="Label5" runat="server" Text="Expiration Date"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">

    <asp:Button ID="Button_submit_pay" runat="server" Text="Process Payment" />
&nbsp;

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="server">

</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style10 {
            width: 457px;
            border: 2px solid #000000;
        }
        .auto-style11 {
            width: 119px;
        }
        .auto-style12 {
            margin-left: 13px;
        }
        .auto-style13 {
            margin-left: 16px;
        }
    </style>
</asp:Content>
