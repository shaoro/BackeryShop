<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="PatstryShopWebApp.Checkout" %>
<asp:Content ID="ContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #CheckoutBody {
            background-color:antiquewhite;
        }
        .auto-style5 {
            width: 100%;
            height: 100%;
            border: 2px solid #D2691E;
            background-color: #FAEBD7;
        }
        .auto-style6 {
            width: 976px;
        }
        .auto-style7 {
            width: 266px;
            height: 26px;
        }
        .auto-style8 {
            width: 68px;
            height: 26px;
        }
        .auto-style9 {
            width: 170px;
            height: 26px;
        }
        .auto-style10 {
            width: 1406px;
        }
    </style>
    <div id="CheckoutBody">
    &nbsp;
        <table cellpadding="2" class="auto-style5">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="541px">
                        <Columns>
                            <asp:BoundField DataField="item" HeaderText="item" SortExpression="item" />
                            <asp:BoundField DataField="price" DataFormatString="{0:C}" HeaderText="price" SortExpression="price" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BakeryConnectionString %>" SelectCommand="SELECT * FROM [buildOrder]"></asp:SqlDataSource>
                </td>
                <td class="auto-style6">
                    <br />
                </td>
                <td class="auto-style10">
    <table cellpadding="2" class="auto-style1" style="clear: left">
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
            <td class="auto-style7">
                <asp:Label ID="Label_item_4" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:Label ID="Label_qty_4" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style9">
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
            <td class="auto-style7">
                <asp:Label ID="Label_item_6" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:Label ID="Label_qty_6" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:Label ID="Label_pr_6" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>


                </td>
            </tr>
        </table>


    <asp:Label ID="Label_total_price" runat="server" Text="Label"></asp:Label>
        <br />



    <asp:Button ID="Button_to_payment" runat="server" OnClick="Button_to_payment_Click" Text="Proceed to Payment Details" BackColor="AntiqueWhite" ForeColor="#9C3A3A" />


        <br />



    


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
    </div>
</asp:Content>

