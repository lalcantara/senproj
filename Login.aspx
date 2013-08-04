<%@ Page Title="" Language="VB" MasterPageFile="~/MenuMasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CenterContentPlaceHolder" Runat="Server">
    <!-- 

  CONTENT

  -->
<div id="content-container">
  <!-- 
	
	SIDE COLUMN
	
	-->
  <div id="content-side">

  </div>
  <!-- 
	
	MAIN COLUMN
	
	-->
      <div id="content">
        <div id="Div1">
            <h1>Please Login</h1>
            <p>UserName:&nbsp;<asp:TextBox ID="UserName" runat="server"></asp:TextBox></p>
            <p>Password:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox></p>
            <p><asp:Button ID="LoginButton" runat="server" Text="Login" Width="90px" /></p>
        </div>
      </div>
    </div>
</asp:Content>

