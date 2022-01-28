using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace AgProje
{
    public partial class Kayit : System.Web.UI.Page
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;user id=root; password=chase1887@; database=AgProje");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void KayıtOlButton_Click(object sender, EventArgs e)
        {
            if (UsernameTb.Text != "" && PasswordTb.Text != "")
            {
                if (PasswordTb.Text == ConfirmPasswordTb.Text)
                {
                    Session.Clear();
                    Session["username"] = UsernameTb.Text;

                    var username = UsernameTb.Text;
                    var password = PasswordTb.Text;

                    connection.Open();
                    string cmd = "INSERT INTO users(username, password) VALUES('" + username + "', '" + password + "');";
                    MySqlCommand command = new MySqlCommand(cmd, connection);
                    command.ExecuteNonQuery();
                    connection.Close();
                    Response.Redirect("Anasayfa.aspx");
                }
                else
                {
                    KayitBasarisiz.Text = "Şifreler uyuşmuyor.";
                    UsernameTb.Text = "";
                    PasswordTb.Text = "";
                    ConfirmPasswordTb.Text = "";
                }
            }
            else
            {
                KayitBasarisiz.Text = "Kullanıcı adı veya şifre boş olamaz.";
                UsernameTb.Text = "";
                PasswordTb.Text = "";
                ConfirmPasswordTb.Text = "";
            }
        }
    }
}