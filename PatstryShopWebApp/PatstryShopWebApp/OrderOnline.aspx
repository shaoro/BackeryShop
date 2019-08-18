<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="OrderOnline.aspx.cs" Inherits="PatstryShopWebApp.OrderOnline" %>
<asp:Content ID="ContentArea" ContentPlaceHolderID="MainContent" runat="server">


    <asp:Button ID="Button_cookies" OnClick="Button_cookies_Click" runat="server" Text="Cookies" />


    <asp:Button ID="Button_cupcakes" OnClick="Button_cupcakes_Click" runat="server" Text="Cupcakes" />

    <asp:Button ID="Button_cakes" OnClick="Button_cakes_Click" runat="server" Text="Cakes" />



    <br />



    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" />
    <br />
    <asp:Label ID="Label_1_desc" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label_1_price" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="Button2" OnClick="Button2_Click" runat="server" />
    <br />
    <asp:Label ID="Label_2_desc" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label_2_price" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="Button3" OnClick="Button3_Click" runat="server" />



    <br />
    <asp:Label ID="Label_3_desc" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label_3_price" runat="server" Text="Label"></asp:Label>
    <br />


    <asp:Image ID="Image_item_display" runat="server" />
    <br />
    <asp:Label ID="Label_item_name" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label_item_desc" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label_item_price" runat="server" Text="Label"></asp:Label>
    <br />
    <table cellpadding="2" class="auto-style10">
        <tr>
            <td class="auto-style11">
                <asp:Button ID="Button_minus" runat="server" Text="-" OnClick="Button_minus_Click" Width="28px" />
            </td>
            <td class="auto-style12"></td>
            <td class="auto-style17">
                <asp:Button ID="Button_add" runat="server" Text="+" OnClick="Button_add_Click" Width="28px" />
            </td>
        </tr>
    </table>
    &nbsp;&nbsp;

   
    <table cellpadding="2" class="auto-style16">
        <tr>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style15">
                <asp:Label ID="Label_total_items" runat="server" Text="# of Items:"></asp:Label>
            </td>
            <td class="auto-style15">
                <asp:Label ID="Label_display_total_items" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style15">
                <asp:Label ID="Label5" runat="server" Text="Total Price:"></asp:Label>
            </td>
            <td class="auto-style15">
                <asp:Label ID="Label_display_total_price" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style15">
                <asp:Button ID="Button_to_checkout" runat="server" OnClick="Button_to_checkout_Click" Text="Proceed to Checkout" />
            </td>
            <td class="auto-style15">&nbsp;</td>
        </tr>
    </table>
    
    <br />

   
    <style type="text/css">
        .auto-style10 {
            width: 219px;
            border: 2px solid #000000;
            margin-left: 586px;
        }
        .auto-style11 {
            width: 43px;
        }
        .auto-style12 {
            width: 47px;
        }
        .auto-style14 {
            width: 145px;
        }
        .auto-style15 {
            width: 101px;
        }
        .auto-style16 {
            width: 1372px;
            border: 2px solid #000000;
            height: 149px;
        }
        .auto-style17 {
            width: 56px;
        }
    </style>
    </asp:Content>

