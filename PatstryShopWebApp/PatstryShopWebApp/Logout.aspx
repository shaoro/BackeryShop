<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="PatstryShopWebApp.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #logoutBody{
            background-color:antiquewhite;
            text-align: center;
        }

        #contentTable {
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="logoutBody">
         <table id="contentTable">
        <tr>
             <th colspan="2" id="header">Logout</th>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">Are you sure you want to Logout</td>
        </tr>

        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnLogout" class="button" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                <asp:Button ID="btnCancel" class="button" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    </div>
   

</asp:Content>
