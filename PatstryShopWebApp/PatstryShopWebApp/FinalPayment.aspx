<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="FinalPayment.aspx.cs" Inherits="PatstryShopWebApp.FinalPayment" %>

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
    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style13" Height="16px" Width="175px" style="margin-left: 6px">
        <asp:ListItem>Sunday</asp:ListItem>
        <asp:ListItem>Monday</asp:ListItem>
        <asp:ListItem>Tuesday</asp:ListItem>
        <asp:ListItem>Wednesday</asp:ListItem>
        <asp:ListItem>Thursday</asp:ListItem>
        <asp:ListItem>Friday</asp:ListItem>
        <asp:ListItem>Saturday</asp:ListItem>
    </asp:DropDownList>
    <br />


    <table cellpadding="2" align="center" class="auto-style10">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Total"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label_price_final" runat="server" Text="Label"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label_cc_not_valid" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_cc_num" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                <asp:Label ID="Label4" runat="server" Text="Credit Card Number"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_cc_num" ErrorMessage="Credit Card number is not valid" ForeColor="#CC6600"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label_expire_not_valid" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox_exp_date" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                <asp:Label ID="Label5" runat="server" Text="Expiration Date"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_exp_date" ErrorMessage="Expiration date is not valid" ForeColor="#CC6600"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style11">
        <asp:Button ID="Button_process_payment" runat="server" Text="Process Payment" OnClick="Button_process_payment_Click" BackColor="AntiqueWhite" ForeColor="#9C3A3A" />


            </td>
            <td class="auto-style11">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label_order_complete" runat="server" Font-Bold="True" ForeColor="#CC6600" Text="Order Complete!" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style11">
                <asp:Button ID="Button_return" runat="server" BackColor="AntiqueWhite" Font-Bold="True" ForeColor="#CC6600" OnClick="Button_return_Click" Text="Return to Menu" Visible="False" />
            </td>
        </tr>
    </table>


        <br />


        </div>
    </asp:Content>
