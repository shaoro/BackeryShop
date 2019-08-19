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
        .auto-style10 {
            width: 1406px;
        }
        .auto-style11 {
            width: 1030px;
        }
        .auto-style12 {
            margin-left: 85px;
        }
    </style>
    <div id="CheckoutBody">
    &nbsp;
        <table cellpadding="2" class="auto-style5">
            <tr>
                <td class="auto-style11">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BakeryConnectionString %>" SelectCommand="SELECT * FROM [buildOrder]"></asp:SqlDataSource>
                </td>
                <td class="auto-style6">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="541px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="auto-style12">
                        <Columns>
                            <asp:BoundField DataField="item" HeaderText="item" SortExpression="item" />
                            <asp:BoundField DataField="price" DataFormatString="{0:C}" HeaderText="price" SortExpression="price" />
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </td>
                <td class="auto-style10">
                    &nbsp;</td>
            </tr>
        </table>


    <asp:Label ID="Label_total_price" runat="server" Text="Label" ForeColor="#CC6600"></asp:Label>
        <br />



    <asp:Button ID="Button_to_payment" runat="server" OnClick="Button_to_payment_Click" Text="Proceed to Payment Details" BackColor="AntiqueWhite" ForeColor="#9C3A3A" />


        <br />



    


</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    </div>
</asp:Content>

