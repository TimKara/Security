<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebMaster.aspx.cs" Inherits="SecurityAssignment_LoginSystem.WebMaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web Master</title>
<link href="Style_ETK.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    
     <div id="center">
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#CCCCCC" BorderStyle="Double" Height="300px" HorizontalAlign="Center" Width="600px" BorderColor="#333333">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonLogOut" Class="Button" runat="server" Text="Log Out" Font-Strikeout="False" Font-Underline="True" OnClick="ButtonLogOut_Click" />
            <br />
            <asp:Label ID="LabelCreate" runat="server" class="Label" Font-Bold="True" Font-Italic="True" Font-Size="Large" Text="Web Master Page - Create New User"></asp:Label>
            <br />
            &nbsp; &nbsp;<br />
            <asp:Label ID="LabelName" runat="server" class="Label" Font-Italic="False" Text="Enter name: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox class="Box" ID="TextBoxName" runat="server" Width="160px"></asp:TextBox>
            <br />
            <asp:Label class="Label" ID="LabelPass" runat="server" Font-Italic="False" Text="Enter password: "></asp:Label>
            &nbsp;<asp:TextBox class="Box" ID="TextBoxPass" runat="server" style="margin-bottom: 0px" Width="160px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button class="Button" ID="ButtonCreate" runat="server" Font-Bold="False" Font-Italic="False" onclick="ButtonCreate_Click" Text="Create" />
            <br />
            <br />
            <asp:Label ID="LabelMessage" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Medium" Font-Underline="True" ForeColor="#CC0000"></asp:Label>
        </asp:Panel>
        <br />
    
    </div>
    
    </form>
</body>
</html>
