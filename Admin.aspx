<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="AgProje.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="oyunpaneli">
            <div class="row" style=" color:white; padding-left:20px; padding-top:20px; padding-bottom:20px; padding-right:20px; background: #84c443; box-shadow: 0px 0px 30px #353535;">
                
            <h1>GAMES and ITEMS</h1>

                </div>
            <h1>Mağaza Admin Paneli</h1>
            <h1>Oyun Listesi Paneli</h1>
            <table>
                <tr><td>ID:</td><td><asp:TextBox ID="IDtb" runat="server" ReadOnly="true"></asp:TextBox></td></tr>
                <tr><td>İsim:</td><td><asp:TextBox ID="Nametb" runat="server"></asp:TextBox></td></tr>
                <tr><td>Fiyat:</td><td><asp:TextBox ID="Pricetb" runat="server"></asp:TextBox></td></tr>
                <tr><td>Resim:</td><td><asp:TextBox ID="Resimtb" runat="server"></asp:TextBox></td></tr>
                <tr><td><asp:Button ID="SaveButton" runat="server" Text="Kaydet" OnClick="SaveButton_Click" /></td><td><asp:Button ID="DeleteButton" runat="server" Text="Sil" OnClick="DeleteButton_Click" /></td><td><asp:Button ID="Clear" runat="server" Text="Temizle" OnClick="Clear_Click" /></td></tr>
            </table>
            <br />
            <asp:GridView ID="OyunListesiGrid" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" OnSelectedIndexChanged="OyunListesiGrid_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true"/>
                    <asp:BoundField DataField="name" HeaderText="İsim" />
                    <asp:BoundField DataField="price" HeaderText="Fiyat" />
                    <asp:BoundField DataField="image" HeaderText="Resim" />
                </Columns>
            </asp:GridView>
        </div>
                <div id="itempaneli">
            <h1>Item Listesi Paneli</h1>
            <table>
                <tr><td>ID:</td><td><asp:TextBox ID="ItemIDTb" runat="server" ReadOnly="true"></asp:TextBox></td></tr>
                <tr><td>İsim:</td><td><asp:TextBox ID="ItemNameTb" runat="server"></asp:TextBox></td></tr>
                <tr><td>Fiyat:</td><td><asp:TextBox ID="ItemPriceTb" runat="server"></asp:TextBox></td></tr>
                <tr><td>Resim:</td><td><asp:TextBox ID="ItemResimTb" runat="server"></asp:TextBox></td></tr>
                <tr><td><asp:Button ID="ItemSaveButton" runat="server" Text="Kaydet" OnClick="ItemSaveButton_Click" /></td><td><asp:Button ID="ItemSilButton" runat="server" Text="Sil" OnClick="ItemSilButton_Click" /></td><td><asp:Button ID="ItemClearButton" runat="server" Text="Temizle" OnClick="ItemClearButton_Click" /></td></tr>
            </table>
            <br />
            <asp:GridView ID="ItemListesiGrid" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" OnSelectedIndexChanged="ItemListesiGrid_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true"/>
                    <asp:BoundField DataField="name" HeaderText="İsim" />
                    <asp:BoundField DataField="price" HeaderText="Fiyat" />
                    <asp:BoundField DataField="image" HeaderText="Resim" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
