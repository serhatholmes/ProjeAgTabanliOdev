<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="AgProje.Sepet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row" style=" color:white; padding-left:20px; padding-top:20px; padding-bottom:20px; padding-right:20px; background: #84c443; box-shadow: 0px 0px 30px #353535;">
                
            <h1>GAMES and ITEMS</h1>

                </div>

            <h2>Sepetinize hoş geldiniz!</h2>
            <h3>Silmek istediğiniz ürünleri seçiniz ya da satın alım için kontrol ediniz.</h3>
            <asp:GridView ID="SepetListeGrid" runat="server" AutoGenerateColumns="false" OnRowDeleting="SepetListeGrid_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Sipariş ID" ReadOnly="true"/>
                    <asp:BoundField DataField="name" HeaderText="Ürün Adı" />
                    <asp:BoundField DataField="price" HeaderText="Fiyat" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                </Columns>
            </asp:GridView>
            <br />
            <span>Toplam Tutar: </span><asp:Label ID="ToplamLabel" runat="server" Text=""></asp:Label><br /><br />
            <asp:Button ID="SatınAl" runat="server" Text="Satın Al" OnClick="SatınAl_Click" />
        </div>
    </form>
</body>
</html>
