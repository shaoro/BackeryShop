<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="PatstryShopWebApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

      #menuBody {
          background-color:antiquewhite;
          text-align: center;
      }

      #menuHeader {
          display: inline-block;
          background-color:orangered;
          padding: 20px 15px;
          width: 200px;
      }

     #menuHeader h1 {
         border: 1px solid white;
         color: white;
         font-weight: bold;
         padding: 5px;
     }

     #menuContent {
         text-align:left;
     }

     #menuContent h2 {
         border-top: 1px solid brown;
         border-bottom: 1px solid brown;
         padding: 15px 0px;
     }
  </style>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="MainContent" runat="server">
    <div id="menuBody">
        <br />
        <header id="menuHeader">
            <h1>Menu</h1>
        </header>

        <div id="menuContent">
            <div id="cookies">
                <h2>COOKIES</h2>
                <br />
                <ul id="cookieList" runat="server">

                </ul>
                <br />
                <h2>CUPCAKES</h2>
                <br />
                <ul id="cupcakeList">

                </ul>
                <br />
                <h2>CAKES</h2>
                <br />
                <ul id="cakeList">

                </ul>
                <br />
            </div>
        </div>


    </div>  

</asp:Content>
