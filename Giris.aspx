<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="AgProje.Giris" %>

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
            <table>
                <tr>
                    <td colspan="2">Kullanıcı Adı: </td><td colspan="2"><asp:TextBox ID="UsernameTb" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">Şifre: </td><td colspan="2"><asp:TextBox ID="PasswordTb" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="4"><asp:Button ID="GirisYapButton" runat="server" Text="Giriş Yap" Width="100%" OnClick="GirisYapButton_Click"/></td>
                </tr>
            </table>
            <asp:LinkButton ID="KayıtOl" runat="server" OnClick="KayıtOl_Click">Üyeliğiniz yok mu? Buraya tıklayarak kayıt olursan hoş olur.</asp:LinkButton>
            <br /> <br />
            <asp:Label ID="GirisBasarisiz" runat="server" Text="" ForeColor="DarkRed"></asp:Label>
        </div>
    </form>
</body>
</html>
