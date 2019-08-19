<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PatstryShopWebApp.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            text-align: center;
        }

        table {
            border: 1px solid silver;
            text-align: left;
            font-size: 30px;
            display: inline-block;
        }

         #header {
            text-align:center;
            font-size: 45px;
            background-color: saddlebrown;
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
    <table class="auto-style1">
        <tr>
            <th colspan="2" id="header">Create New Account</th>  
        </tr>
        <tr>
            <td colspan="2" style="font-size: 18px; color: blue;">Please Enter your User Name to reset the password!</td>
        </tr>
        <tr>
            <td>User Name:</td>
            <td>
                <asp:TextBox ID="tbUserName" runat="server" Width="254px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Label ID="lbError" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Button ID="btnSubmit" class="button" runat="server" Text="Send" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCancel" class="button" runat="server" Text="Close" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
        <div>
        </div>
    </form>
</body>
</html>
