<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="PatstryShopWebApp.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        body {
            text-align: center;
        }
        
        td {
            height: 25px;
        }

        table {
            border: 1px solid silver;
            text-align: left;
            font-size: 25px;
            display: inline-block;
        }

        #header {
            text-align:center;
            font-size: 45px;
            background-color: saddlebrown;
            color: white;
        }

        .subHeader {
            background-color: sandybrown;
            text-align: left;
            color: white;
        }

        .button {
            background-color: sandybrown;
            font-size: 30px;
            color: white;
            margin-right: 25px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <th colspan="2" id="header">Create New Account</th>
                </tr>

                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>

                <tr>
                    <th colspan="2" class="subHeader">Login Info</th>
                </tr>

                <tr>
                    <td>User Name:</td>
                    <td><asp:TextBox ID="tbUser" runat="server" Width="236px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vUser" runat="server" ControlToValidate="tbUser" ErrorMessage="UserName Cannot Be Empty!" Font-Size="Medium" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Password:</td>
                    <td><asp:TextBox ID="tbPass" runat="server" Width="236px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vPass" runat="server" ControlToValidate="tbPass" ErrorMessage="Password Cannot Be Empty!" Font-Size="Medium" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td><asp:TextBox ID="tbConfirm" runat="server" Width="236px" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="cConfirm" runat="server" ControlToCompare="tbPass" ControlToValidate="tbConfirm" ErrorMessage=" Password Does Not Match!  " Font-Size="Medium" ForeColor="Red"></asp:CompareValidator></td>
                </tr>

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
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnSubmit" class="button" runat="server" Text="Submit" OnClick="btnSubmit_Click" /> 
                    </td>
                </tr>
              
            </table>
        </div>
    </form>
</body>
</html>
