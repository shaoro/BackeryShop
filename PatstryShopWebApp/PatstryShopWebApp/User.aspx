<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="PatstryShopWebApp.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #UserPage {
          background-color:antiquewhite;
          text-align: center;
      }

      #userHeader {
          display: inline-block;
          background-color:orangered;
          padding: 20px 15px;
          width: 500px;
      }

      #userHeader h1 {
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
<asp:Content ID="User" ContentPlaceHolderID="MainContent" runat="server">
    <div id="UserPage">
        <br />
        <header id="userHeader">
            <h1>Welcome <asp:Label ID="lblUser" runat="server" ></asp:Label></h1>
        </header>
        <p>
            <asp:Button ID="btnInfo" class="button" runat="server" Text="User Info" OnClick="btnInfo_Click" />
            <asp:Button ID="btnOrder" class="button" runat="server" Text="Order History" OnClick="btnOrder_Click" />        
        </p>
        <p>
           <asp:Label ID="lblError" runat="server"></asp:Label>
        </p>

    <asp:MultiView ID="userContent" runat="server">
        <asp:View ID="View1" runat="server">
            <h2>User Info</h2>
            <table class="auto-style1">
                <tr>
                    <th colspan="2">Login Info</th>
                </tr>
                <tr>
                    <td>User Name:</td>
                    <td>
                        <asp:TextBox ID="tbUser" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rUser" runat="server" ControlToValidate="tbUser" ErrorMessage="Required!" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                    <asp:TextBox ID="tbPass" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
                        
                    <asp:RequiredFieldValidator ID="rPass" runat="server" ErrorMessage="Required!" ControlToValidate="tbPass" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr id="confirmPass" runat="server">
                    <td>Confirm Password:</td>
                    <td>
                    <asp:TextBox ID="tbConfirm" runat="server" BorderStyle="None"></asp:TextBox>
                        <asp:CompareValidator ID="comparePass" runat="server" ControlToCompare="tbPass" ControlToValidate="tbConfirm" ErrorMessage="Not Match!" Font-Size="Medium" ForeColor="Red" Enabled="False"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                         <asp:Button ID="Button1" runat="server" Text="Edit" class="button2" Height="31px" Width="100px" OnClick="Button1_Click"/>
                         <asp:Button ID="btnConfirm" runat="server" class="button2" Height="31px" OnClick="btnConfirm_Click" Text="Confirm" Width="100px" Visible="False" />
                         <asp:Button ID="btnCancels" runat="server" class="button2" Height="31px" OnClick="btnCancels_Click" Text="Cancel" Visible="False" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <th colspan="2">Customer Info</th>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>
                        <asp:TextBox ID="lblEmail" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Phone Number: </td>
                    <td>
                        <asp:TextBox ID="lblPhone" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td>
                    <asp:TextBox ID="lblAddress" runat="server" BorderStyle="None" Height="107px" ReadOnly="True" TextMode="MultiLine" Width="179px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" class="button2" Height="31px" Width="100px" OnClick="btnEdit_Click"/></td>
                </tr>
                </table>
            
        </asp:View>

        <asp:View ID="View2" runat="server">
            <h2>OREDER HISTORY</h2>
            <p>
                <asp:DropDownList ID="ddlOrder" runat="server">
                </asp:DropDownList>  
                <asp:Button ID="btnViewDetail" runat="server" Text="Order Detail" class="button2" OnClick="btnViewDetail_Click"/>
                <asp:Button ID="btnBack" runat="server" class="button2" OnClick="btnOrder_Click" Text="Go Back" Visible="False" />
                <asp:Button ID="btnReOrder" runat="server" class="button2" OnClick="btnReOrder_Click" Text="Re-Order" Visible="False" />
            </p>
            <asp:GridView ID="orderHist" runat="server" CellPadding="4" class="views" ForeColor="#333333" GridLines="None">
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

            <table class="auto-style1">                 
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>

                <tr>
                    <th colspan="2"  class="subHeader">User Info</th>
                </tr>

                <tr>
                    <td> First Name: </td>
                    <td><asp:TextBox ID="tbfName" runat="server" Width="236px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vFirst" runat="server" ErrorMessage="FirstName Cannot be empty!  " Font-Size="Medium" ForeColor="Red" ControlToValidate="tbfName"></asp:RequiredFieldValidator>
                        </td>
                </tr>

                <tr>
                    <td>Last Name:</td>
                    <td><asp:TextBox ID="tblName" runat="server" Width="236px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vLast" runat="server" ErrorMessage="LastName Cannot be empty!  " Font-Size="Medium" ForeColor="Red" ControlToValidate="tblName"></asp:RequiredFieldValidator>
                        </td>
                </tr>

                <tr>
                    <td>Email Address:</td>
                    <td><asp:TextBox ID="tbEmail" runat="server" Width="236px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vEmail" runat="server" ErrorMessage="Email Cannot be empty!  " Font-Size="Medium" ForeColor="Red" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Phone Number:</td>
                    <td><asp:TextBox ID="tbPhone" runat="server" Width="236px" MaxLength="12" placeholder="xxx-xxx-xxxx"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vPhone" runat="server" ErrorMessage="Phone Num Cannot be empty!  " Font-Size="Medium" ForeColor="Red" ControlToValidate="tbPhone"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:RegularExpressionValidator ID="rEmail" runat="server" ErrorMessage="Invalid Email Address!  " Font-Size="Medium" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbEmail"></asp:RegularExpressionValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="rPhone" runat="server" ErrorMessage="Phone Number can only have Number!" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbPhone" ValidationExpression="\(?\d{3}\)?-? *\d{3}-? *-?\d{4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <th colspan="2"  class="subHeader">Address Info</th>
                </tr>

                <tr>
                    <td>Street:</td>
                    <td><asp:TextBox ID="tbStreet" runat="server" Width="236px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vStreet" runat="server" ErrorMessage="Street Cannot be empty!  " Font-Size="Medium" ForeColor="Red" ControlToValidate="tbStreet"></asp:RequiredFieldValidator>
                        </td>
                </tr>

                <tr>
                    <td>City:</td>
                    <td><asp:TextBox ID="tbCity" runat="server" Width="236px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vCity" runat="server" ErrorMessage="City Cannot be empty!  " Font-Size="Medium" ForeColor="Red" ControlToValidate="tbCity"></asp:RequiredFieldValidator>
                        </td>
                </tr>

                <tr>
                    <td>Province:</td>
                    <td>
                        <asp:DropDownList ID="ddlProv" runat="server" Width="244px">
                            <asp:ListItem Value="QC">Quebec</asp:ListItem>
                            <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                            <asp:ListItem Value="ON" Selected="True">Ontario</asp:ListItem>
                            <asp:ListItem Value="AB">Alberta</asp:ListItem>
                            <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                            <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                            <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                            <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                            <asp:ListItem Value="NL">Newfoundland </asp:ListItem>
                            <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                            <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                            <asp:ListItem Value="YT">Yukon</asp:ListItem>
                            <asp:ListItem Value="NU">Nanavut</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>Postal Code:</td>
                    <td><asp:TextBox ID="tbPostal" runat="server" Width="108px" placeholder="A0A1B1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vPostal" runat="server" ErrorMessage="Fields Cannot be empty!  " Font-Size="Medium" ForeColor="Red" ControlToValidate="tbPostal"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rPostal" runat="server" ControlToValidate="tbPostal" ErrorMessage="Invalid Format" Font-Size="Medium" ForeColor="Red" ValidationExpression="^\w\d\w\d\w\d$"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnSubmit" class="button" runat="server" Text="Submit" OnClick="btnSubmit_Click" /> 
                        <asp:Button ID="btnCancel" class="button" runat="server" Text="Cancel" OnClick="btnCancel_Click" /> 
                        
                    </td>
                </tr>

            </table>

        </asp:View>

    </asp:MultiView>
    </div>
</asp:Content>
