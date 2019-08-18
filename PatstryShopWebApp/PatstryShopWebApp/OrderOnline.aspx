<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="OrderOnline.aspx.cs" Inherits="PatstryShopWebApp.OrderOnline" %>
<asp:Content ID="ContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #OrderOnlineHeader{
            background-color:antiquewhite;
            
        }
        #OrderOnlineBody{
            background-color:antiquewhite;
        }
        .auto-style10 {
            align-content:center;
            justify-content:center;
            width: 20%;
            border: 2px solid #000000;   
        }
        .auto-style11 {
            width: 43px;
            height: 35px;
        }
        .auto-style12 {
            width: 47px;
            height: 35px;
        }
        .auto-style16 {
            width: 384px;
            border: 2px solid #000000;
            height: 149px;
        }
        .auto-style17 {
            width: 57px;
            height: 35px;
        }
        .auto-style18 {
            width: 100%;
            height: 100%;
            border: 1px solid #D2691E;
            background-color: #FAEBD7;
        }
        .auto-style19 {
            width: 392px;
            height: 247px;
        }
        .auto-style20 {
            
            justify-content:center;
            width: 546px;
            height: 247px;
        }
        .auto-style21 {
            margin-left: 0px;
        }
        .auto-style22 {
            width: 400px;
            height: 247px;
        }
        .auto-style23 {
            width: 79px;
        }
        .auto-style24 {
            width: 103px;
        }
        
    </style>
    <div id="OrderOnlineHeader">
        <asp:Button ID="Button_cookies" OnClick="Button_cookies_Click" runat="server" Text="Cookies" />
        <asp:Button ID="Button_cupcakes" OnClick="Button_cupcakes_Click" runat="server" Text="Cupcakes" />
        <asp:Button ID="Button_cakes" OnClick="Button_cakes_Click" runat="server" Text="Cakes" />
    </div>
    <div id="OrderOnlineBody">    
        



    <br />



        <table cellpadding="2" class="auto-style18" style="border-color: #D2691E; border-width: 2px">
            <tr>
                <td class="auto-style19" style="border-color: #D2691E; border-width: 2px">



    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" />
    &nbsp;
    <asp:Label ID="Label_1_price" runat="server" Text="Label"></asp:Label>
                    <br />
    <asp:Label ID="Label_1_desc" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
    <asp:Button ID="Button2" OnClick="Button2_Click" runat="server" />
    &nbsp;
    <asp:Label ID="Label_2_price" runat="server" Text="Label"></asp:Label>
                    <br />
    <asp:Label ID="Label_2_desc" runat="server" Text="Label"></asp:Label>
                    <br />
    <br />
    <asp:Button ID="Button3" OnClick="Button3_Click" runat="server" />



    &nbsp;
    <asp:Label ID="Label_3_price" runat="server" Text="Label"></asp:Label>
                    <br />
    <asp:Label ID="Label_3_desc" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="name" SortExpression="name" />
                            <asp:BoundField DataField="price" SortExpression="price" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BakeryConnectionString %>" SelectCommand="SELECT [name], [price] FROM [Pastry] WHERE ([categoryId] = @categoryId)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="categoryId" SessionField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style20">


    <asp:Image ID="Image_item_display" runat="server" />
                    <br />
    <asp:Label ID="Label_item_name" runat="server" Text="Label"></asp:Label>
                    <br />
    <asp:Label ID="Label_item_desc" runat="server" Text="Label"></asp:Label>
                    <br />
    <asp:Label ID="Label_item_price" runat="server" Text="Label"></asp:Label>
                    <br />
    <table cellpadding="2" align="center" class="auto-style10">
        <tr>
            <td class="auto-style11">
                <asp:Button ID="Button_minus" runat="server" Text="-" OnClick="Button_minus_Click" Width="28px" CssClass="auto-style21" />
            </td>
            <td class="auto-style12"></td>
            <td class="auto-style17">
                <asp:Button ID="Button_add" runat="server" Text="+" OnClick="Button_add_Click" Width="28px" />
            </td>
        </tr>
    </table>
                </td>
                <td class="auto-style22">

   
    <table cellpadding="2" class="auto-style16" style="height: 100%; width: 100%; border-color: #D2691E">
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label_total_items" runat="server" Text="# of Items:"></asp:Label>
            </td>
            <td class="auto-style23">
                <asp:Label ID="Label_display_total_items" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Label ID="Label5" runat="server" Text="Total Price:"></asp:Label>
            </td>
            <td class="auto-style23">
                <asp:Label ID="Label_display_total_price" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Button ID="Button_to_checkout" runat="server" OnClick="Button_to_checkout_Click" Text="Proceed to Checkout" />
            </td>
            <td class="auto-style23">
                <asp:Button ID="Button_reset" runat="server" OnClick="Button_reset_Click" Text="Reset Order" />
            </td>
        </tr>
    </table>
    
                </td>
            </tr>
        </table>
    
   </div>

    
    </asp:Content>

