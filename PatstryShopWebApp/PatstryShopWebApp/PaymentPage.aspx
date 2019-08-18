<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="PatstryShopWebApp.Checkout" %>
<asp:Content ID="ContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #PaymentBody {
            background-color:antiquewhite;
        }
    </style>
    <div id="PaymentBody">
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
    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style13" Height="16px" Width="173px">
        <asp:ListItem>Sunday</asp:ListItem>
        <asp:ListItem>Monday</asp:ListItem>
        <asp:ListItem>Tuesday</asp:ListItem>
        <asp:ListItem>Wednesday</asp:ListItem>
        <asp:ListItem>Thursday</asp:ListItem>
        <asp:ListItem>Friday</asp:ListItem>
        <asp:ListItem>Saturday</asp:ListItem>
    </asp:DropDownList>
    <br />


    <table cellpadding="2" class="auto-style10">
        <tr>
            <td>
                <asp:Label ID="Label_final_price" runat="server" Text="Total"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                <asp:Label ID="Label_ttl_price" runat="server" Text="Label"></asp:Label>
            </td>
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


    <asp:Button ID="Button_submit_pay" runat="server" Text="Process Payment" />
        </div>
    </asp:Content>
