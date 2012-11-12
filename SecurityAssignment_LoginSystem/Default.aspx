<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SecurityAssignment_LoginSystem.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login System by Engin Tim Kara</title>
<link href="Style_ETK.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    
     <div id="center">
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#CCCCCC" BorderStyle="Double" Height="300px" HorizontalAlign="Center" Width="600px" BorderColor="#333333">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonWebMaster" Class="Button" runat="server" Text="Web Master" OnClick="ButtonWebMaster_Click" />
            <br />
            <asp:Label ID="LabelLogin" runat="server" class="Label" Font-Bold="True" Font-Italic="True" Font-Size="Large" Text="Login System"></asp:Label>
            <br />
            &nbsp; &nbsp;<br />
            <asp:Label ID="LabelName" runat="server" class="Label" Font-Italic="False" Text="Name: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxName" runat="server" class="Box" Width="160px"></asp:TextBox>
            <br />
            <asp:Label ID="LabelPass" runat="server" class="Label" Font-Italic="False" Text="Password: "></asp:Label>
            &nbsp;<asp:TextBox ID="TextBoxPass" runat="server" class="Box" style="margin-bottom: 0px" TextMode="Password" Width="160px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonLogin" runat="server" class="Button" Font-Bold="False" Font-Italic="False" onclick="ButtonLogin_Click" Text="Log In" />
            <br />
            <br />
            <asp:Label ID="LabelMessage" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Medium" Font-Underline="True" ForeColor="#CC0000"></asp:Label>
        </asp:Panel>
        <br />
    
    </div>
    
    </form>
</body>
</html>
