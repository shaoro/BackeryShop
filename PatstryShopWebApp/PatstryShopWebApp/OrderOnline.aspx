<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="OrderOnline.aspx.cs" Inherits="PatstryShopWebApp.OrderOnline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button_cookies" OnClick="Button_cookies_Click" runat="server" Text="Cookies" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Button ID="Button_cupcakes" OnClick="Button_cupcakes_Click" runat="server" Text="Cupcakes" />
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <asp:Button ID="Button_cakes" OnClick="Button_cakes_Click" runat="server" Text="Cakes" />

    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">

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



    </asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">

    <asp:Image ID="Image_item_display" runat="server" />
    <br />
    <asp:Label ID="Label_item_desc" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label_item_price" runat="server" Text="Label"></asp:Label>
    <br />
    <table cellpadding="2" class="auto-style10">
        <tr>
            <td class="auto-style11">
                <asp:Button ID="Button_minus" runat="server" Text="-" OnClick="Button_minus_Click" />
            </td>
            <td class="auto-style12"></td>
            <td class="auto-style11">
                <asp:Button ID="Button_add" runat="server" Text="+" OnClick="Button_add_Click" />
            </td>
        </tr>
    </table>
    <br />

    </asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder6">
    
    <table cellpadding="2" class="auto-style16">
        <tr>
            <td class="auto-style14">
                <asp:Label ID="Label_total_items" runat="server" Text="# of Items:"></asp:Label>
            </td>
            <td class="auto-style15">&nbsp;</td>
            <td>
                <asp:Label ID="Label_display_total_items" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                <asp:Label ID="Label5" runat="server" Text="Total Price:"></asp:Label>
            </td>
            <td class="auto-style15">&nbsp;</td>
            <td>
                <asp:Label ID="Label_display_total_price" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style15">
                <asp:Button ID="Button4" runat="server" Text="Button" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style10 {
            width: 100px;
            border: 2px solid #000000;
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
            width: 189px;
            border: 2px solid #000000;
            height: 149px;
        }
    </style>
</asp:Content>

