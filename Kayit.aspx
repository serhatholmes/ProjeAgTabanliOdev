<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kayit.aspx.cs" Inherits="AgProje.Kayit" %>

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
            <h3>Mağazamızdan alışveriş yapmak için lütfen kaydınızı tamamlayınız.</h3>
            <h4>Güçlü bir şifre seçtiğinizden emin olunuz.</h4>
            <table>
                <tr>
                    <td colspan="2">Kullanıcı Adı: </td><td colspan="2"><asp:TextBox ID="UsernameTb" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">Şifre: </td><td colspan="2"><asp:TextBox ID="PasswordTb" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">Şifreyi Doğrula: </td><td colspan="2"><asp:TextBox ID="ConfirmPasswordTb" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="4"><asp:Button ID="KayıtOlButton" runat="server" Text="Kayıt Ol" Width="100%" OnClick="KayıtOlButton_Click" /></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Label ID="KayitBasarisiz" runat="server" Text="" ForeColor="DarkRed"></asp:Label>
        </div>
    </form>
</body>
</html>
