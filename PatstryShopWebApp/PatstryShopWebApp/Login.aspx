<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PatstryShopWebApp.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      #loginBody {
          background-color:antiquewhite;
          text-align: center;
          overflow: hidden;
      }

      #loginBody div {
          
          display: inline-block;
          width: 40%;
          padding: 30px;
          float: left;
      }

     #loginContent {
         border: 1px groove brown;
         margin-bottom: 50px;
     }
     #loginTable {
         width: 350px;
         display: inline-block;
         border: 1px inset silver;
     }

     #loginTable td {
         font-size: 20px;
     }

     #sideimg {
         height: 400px;
         width: 400px;
     }

        .sideLink {
            font-size: 14px;
            color: blue;
            text-align: right;
        }
  </style>
</asp:Content>

<asp:Content ID="Login" ContentPlaceHolderID="MainContent" runat="server">
    <div id="loginBody">
       <div>
           <img src="image/Side.png" id="sideimg" />
       </div>
       <br />
       <br />
       <div id="loginContent" >
            <asp:Label ID="lbError" runat="server" ForeColor="Red"></asp:Label>
           <br />
           <table id="loginTable">
               <tr>
                   <td colspan="2">
                       <h1 style="color:white; background-color:orangered;">Login</h1>
                   </td>
               </tr>
               <tr>
                   <td>UserName:</td>
                   <td class="auto-style1">
                       <asp:TextBox ID="tbUser" runat="server" Width="208px"></asp:TextBox>
                   </td>
               </tr>
               <tr class="sideLink">
                    <td colspan="2">
                         <asp:LinkButton ID="forgotPass" runat="server" Font-Size="Small" OnClick="forgotPass_Click">Forgot your password?</asp:LinkButton>
                    </td>
               </tr>
               <tr>
                   <td>Password:</td>
                   <td>
                       <asp:TextBox ID="tbPass" runat="server" Width="210px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td colspan="2">
                       <br />
                       <asp:Button ID="submit" runat="server" Text="Submit" Width="201px" BackColor="Black" Font-Bold="True" ForeColor="White" Height="53px" OnClick="submit_Click" />
                       <br />
                   </td>
               </tr>
               <tr class="sideLink">
                   <td colspan="2">
                       <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="False" Font-Size="Small" OnClick="LinkButton1_Click">Don&#39;t Have an account? SIGN UP</asp:LinkButton>
                   </td>
               </tr>
           </table>
           <br />
           <br />
       </div>
       <br />
       <br />
    </div>

</asp:Content>
