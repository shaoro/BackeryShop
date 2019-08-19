<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="PatstryShopWebApp.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      #contactBody {
          background-color:antiquewhite;
          text-align: center;
      }

      #contactContent {
          background-image: url("image/side2.PNG");
          background-repeat: no-repeat;
          background-position: center;
          height: 630px;
      }

      #contactHeader {
          display: inline-block;
          background-color:orangered;
          padding: 20px 15px;
          width: 200px;
      }

      #contactHeader h1 {
         border: 1px solid white;
         color: white;
         font-weight: bold;
         padding: 5px;
     }

     .input {
         font-size: 25px;
         color: brown;
         font-weight: bold;
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
    <div id="contactBody">
        <br />
        <header id="contactHeader">
            <h1>Contact</h1>
        </header>

        <div id="contactContent">
            <div>
                <p class="input">
                    <asp:Label ID="lblError" runat="server"></asp:Label><br />
                    Planning a special event? Write us here:
                </p>
                <p class="input">
                    <asp:TextBox ID="tbName" runat="server" Width="400px" Height="35px" BorderStyle="None" placeholder="Name*"></asp:TextBox>
                </p>

                <p class="input">
                    <asp:TextBox ID="tbEmail" runat="server" Width="400px" Height="35px" BorderStyle="None" placeholder="Email*"></asp:TextBox>
                </p>

                <p class="input">
                    <asp:TextBox ID="tbSubject" runat="server" Width="400px" Height="35px" BorderStyle="None" placeholder="Subject"></asp:TextBox>
                </p>

                <p class="input">
                    <asp:TextBox ID="tbMessage" runat="server" Width="400px" Height="210px" BorderStyle="None" TextMode="MultiLine" placeholder="Message"></asp:TextBox>
                </p>

                <p>
                    <asp:Button ID="btnSend" class="button" runat="server" Text="Send" OnClick="btnSend_Click" />
                </p>
            </div>
        </div>
    </div>  
</asp:Content>
