<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PatstryShopWebApp.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #adminBody {
          background-color:antiquewhite;
          text-align: center;
      }

      #adminHeader {
          display: inline-block;
          background-color:orangered;
          padding: 20px 15px;
          width: 500px;
      }

      #adminHeader h1 {
         border: 1px solid white;
         color: white;
         font-weight: bold;
         padding: 5px;
     }

      #adminContent h2 {
          color: brown;
      }

      .views {
          display:inline-block;

      }

     .button {
            background-color: sandybrown;
            font-size: 25px;
            color: white;
            margin-right: 25px;
     }

     .button2 {
         background-color: sandybrown;
         margin: 1px 10px;
         font-size: 20px;
         color: white;
         border: none;

     }

     .auto-style1 {
         display: inline-block;
         text-align: left;
     }

     .auto-style1 th {
         background-color: brown;
         color: white;
     }

    </style>
</asp:Content>

<asp:Content ID="Admin" runat="server" contentplaceholderid="MainContent">
    <div id="adminBody">
        <br />
        <header id="adminHeader">
            <h1>You Login As Admin</h1>
        </header>

        <p>
                <asp:Button ID="btnItem"  class="button" runat="server" Text="Items" OnClick="btnItem_Click" />
                <asp:Button ID="btnUser" class="button" runat="server" Text="Users" OnClick="btnUser_Click" />
                <asp:Button ID="btnOrder" class="button" runat="server" Text="Orders" OnClick="btnOrder_Click" />
            </p>
        <p>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </p>

    <asp:MultiView ID="adminContent" runat="server">
        <asp:View ID="View1" runat="server">
            <h2>PASTRY ITEMS</h2>
            <p>
                <asp:DropDownList ID="ddlPastry" runat="server">
                </asp:DropDownList>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" class="button2" OnClick="btnEdit_Click"/>
                <asp:Button ID="btnDeleted" runat="server" Text="Deleted" class="button2" OnClick="btnDeleted_Click"/>
                <asp:Button ID="btnAddNew" runat="server" Text="Add New" class="button2" OnClick="btnAddNew_Click"/>
            </p>
            <asp:GridView ID="pastryItems" runat="server" class="views" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </asp:View>

        <asp:View ID="View2" runat="server">
            <h2>USER TABLE</h2>
            <p>
                <asp:DropDownList ID="ddlUser" runat="server">
                </asp:DropDownList>
                <asp:Button ID="btnDeleteduser" runat="server" Text="Deleted" class="button2" OnClick="btnDeleteduser_Click"/>
            </p>
            <asp:GridView ID="userView" runat="server" CellPadding="4" class="views" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </asp:View>

        <asp:View ID="View3" runat="server">
            <h2>CUSTOMER ORDERS</h2>
            <p>
                <asp:DropDownList ID="ddlOrder" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="btnViewDetail" runat="server" Text="View Detail" class="button2" OnClick="btnViewDetail_Click"/>
                <asp:Button ID="btnBack" runat="server" class="button2" OnClick="btnOrder_Click" Text="Go Back" Visible="False" />
            </p>
            <asp:GridView ID="orderView" runat="server" CellPadding="4" class="views" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </asp:View>

        <asp:View ID="View4" runat="server">

            <table class="auto-style1">
                <tr>
                    <th colspan="2">
                        <asp:Label ID="lblHeader" runat="server"></asp:Label></th>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbName" ErrorMessage="Required!" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><asp:TextBox ID="tbPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbPrice" ErrorMessage="Required!" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><asp:DropDownList ID="ddlCate" runat="server"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>Description:</td>
                    <td><asp:TextBox ID="tbDes" runat="server" Height="117px" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbDes" ErrorMessage="Required!" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Upload Image:</td>
                    <td><asp:FileUpload ID="imageUpload" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:Button ID="btnAddConfirm" runat="server" Text="Confirm" class="button2" OnClick="btnAddConfirm_Click" Visible="False"/> 
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" class="button2" OnClick="btnUpdate_Click" Visible="False"/> 
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="button2" OnClick="btnCancel_Click"/> 
                    </td>
                </tr>

            </table>

        </asp:View>

    </asp:MultiView>
    </div>
    
    
</asp:Content>


