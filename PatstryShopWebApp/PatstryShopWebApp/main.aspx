<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="PatstryShopWebApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       #mainBody {
          background-color:antiquewhite;
          text-align: center;
      }

      #mainHeader {
          display: inline-block;
          background-color:orangered;
          padding: 20px 15px;
          width: 500px;
      }

      #mainHeader h1 {
         border: 1px solid white;
         color: white;
         font-weight: bold;
         padding: 5px;
     }

        #imageContent {
            overflow:hidden;
            width: 700px;
            display: inline-block;
        }

        #imageContent img {
            float: left;
            margin: 20px;
            border: 5px groove white;
        }

        #img1 {
            width: 300px;
            height: 650px;
        }
        #img2{
            width: 300px;
            height:300px;
        }

        #img3{
            width: 300px;
            height:300px;
        }
    </style>
</asp:Content>
<asp:Content ID="main" ContentPlaceHolderID="MainContent" runat="server">
    <div id="mainBody">
        <div>
      <div id="mainHeader">
         <h1>Welcome to JS Bakery</h1>
      </div>
</div>
      <div id="imageContent">
            <img src="image/Side.png" id="img1"/>
            <img src="image/Cakes/ferrero.jpg" id="img2"/>
            <img src="image/side2.PNG" id="img3"/>
            
        </div>
    </div>
    
   
</asp:Content>
