<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="AgProje.Anasayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Oyun ve Oyuniçi Araç Mağazası</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/608f1fd18f.js" crossorigin="anonymous"></script>
</head>
<body style="background-color: rebeccapurple;">
    
    <form id="form1" runat="server">
        <div>
            <div class="row" style=" color:rebeccapurple; padding-left:20px; padding-top:20px; padding-bottom:20px; padding-right:20px; background: #8abb1e; box-shadow: 0px 0px 30px #353535;">
                <div class="col-2" style="text-align: center;"><i class="fas fa-dragon fa-5x"></i></div>
                <div class="col-8" style="text-align: center;"><h1 style="font: bold 60px sans-serif; ">GAMES AND ITEMS</h1></div>
                <div class="col-1">
                    <asp:LinkButton ForeColor="Purple" ID="SepeteGitButton" runat="server" OnClick="SepeteGitButton_Click">Sepet</asp:LinkButton></div>
                <div class="col-1">
                    <asp:Label ID="KullaniciLabel" runat="server" Text="" Visible="false"></asp:Label> <br />
                    <asp:LinkButton ForeColor="Purple" ID="CikisButon" runat="server" Visible="false" OnClick="CikisButon_Click">Çıkış Yap</asp:LinkButton>

                    <asp:LinkButton ForeColor="Purple" ID="GirisYapButon" runat="server" Visible="true" OnClick="GirisYapButon_Click">Giriş Yap</asp:LinkButton> <br />
                    <asp:LinkButton ForeColor="Purple" ID="KayitOlButon" runat="server" Visible="true" OnClick="KayitOlButon_Click">Kayıt Ol</asp:LinkButton>
                </div>
            </div>

            <div class="container">

                <!-- Slider Start -->
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="carousel-item active" style="height:500px; text-align:left; background: url('https://i.hizliresim.com/ezuzdet.jpg'); background-size:cover;">
                        <h2 style="font-weight:bold; font:bold 42px sans-serif">EN UYGUN FİYAT GARANTİSİ!</h2>
                        <p style="font:bold 24px sans-serif">Mağazamızın en uygun fiyatlı oyun ve oyuniçi eşyalarından üye olarak siz de yararlanabilirsiniz.</p>
                    </div>
                    <div class="carousel-item" style="height:500px; text-align:left; background: url('https://i.hizliresim.com/5ihupuj.jpg'); background-size:cover;">
                      <h2 style="font-weight:bold; font:bold 42px sans-serif; color:floralwhite">FIRSATLAR VE İNDİRİMLER!</h2>
                        <p style="color:floralwhite; font:bold 24px sans-serif">Her hafta özel olarak değişen indirim kampanyaları için bizi takip etmeyi unutmayın.</p>
                    </div>
                    <div class="carousel-item" style="height:500px;text-align:left; background: url('https://i.hizliresim.com/fay588g.'); background-size:cover;">
                      <h2 style="font-weight:bold; font:bold 42px sans-serif">OYUN PARALARI</h2>
                        <p style="color:floralwhite; font:bold 24px sans-serif;">Mağazamızda oyunlar dışında birçok populer oyunun oyuniçi paralarını da güvenle alabilirsiniz</p>
                    </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
                <!-- Slider End -->

                <!-- Oyunlar Listesi Start-->
                <h1 style="color:#8abb1e">Oyunlar</h1>
                <div style="height:450px; width:auto; overflow-x:auto;">
                    <asp:ListView ID="OyunListesi" runat="server">
                        <ItemTemplate>
                            <div class="card" style="display:inline-flex; height:450px; width:340px; background-color:mediumpurple"; margin: 10px;" >
                                <table>
                                    <tr><td><h2 style="color:#8abb1e"><%#Eval("name")%></h2></td></tr>
                                    <tr><td><img src="<%#Eval("image")%>" style="width:100%; height:300px;"/></td></tr>
                                    <tr><td><h3 style="color:#8abb1e"; span ><%#Eval("price")%> ₺</span></td></tr>
                                    
                                    <tr><td><asp:Button CssClass="btn-lg btn-success" ID="SepeteEkleOyun" runat="server" Text="Sepete Ekle" OnClick="SepeteEkleOyun_Click" CommandArgument='<%#Eval("id") + ", " + Eval("name") + ", " + Eval("price") %>' /></td></tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <!-- Oyunlar Listesi End-->
                
                <!-- Item Listesi Start -->
                <h1 style="color:#8abb1e">Oyuniçi Eşyalar</h1>
                <div style="overflow-x:auto; height:450px;">
                    <asp:ListView ID="ItemListesi" runat="server">
                        <ItemTemplate>
                            <div class="card float-left" style="height: 350px; width:260px; background-color:mediumpurple">
                                <table>
                                    <tr><td><img src="<%#Eval("image")%>" style="width:100%; height:200px;"/></td></tr>
                                    <tr><td><h4 style="color:#8abb1e"><%#Eval("name")%></h4></td></tr>
                                    <tr><td><h3 style="color:#8abb1e"; span><%#Eval("price")%> ₺</span></td></tr>
                                    <tr><td><asp:Button CssClass="btn-lg btn-success" ID="SepeteEkleItem" runat="server" Text="Sepete Ekle" OnClick="SepeteEkleItem_Click" CommandArgument='<%#Eval("id") + ", " + Eval("name") + ", " + Eval("price") %>'/></td></tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <!-- Item Listesi End -->
            
            </div>
        </div>
    </form>
</body>
</html>
