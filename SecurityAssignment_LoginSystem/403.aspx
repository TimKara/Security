<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="403.aspx.cs" Inherits="SecurityAssignment_LoginSystem._403" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>403</title>
    <link href="Style_ETK.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="center">
            <asp:Panel ID="Panel403" runat="server" BackColor="#464646" BorderColor="#CC0000" BorderStyle="Outset" Height="180px" HorizontalAlign="Center" style="margin-bottom: 4px" Width="598px">
            <br />
                <asp:Label ID="Label403" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="XX-Large" Font-Underline="False" ForeColor="#CC0000" Text="403 Error"></asp:Label>
            <br />
                <asp:Label ID="LabelErrorMessage" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Font-Underline="False" ForeColor="#CC0000" Text="You don't have access to this page!"></asp:Label>
                <br />
                <br />
                <asp:Button ID="ButtonIndex" Class="Button" runat="server" Text="Go back to Default.aspx" OnClick="ButtonIndex_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
