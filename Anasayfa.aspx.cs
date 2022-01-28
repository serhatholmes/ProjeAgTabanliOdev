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
    public partial class Anasayfa : System.Web.UI.Page
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;user id=root; password=chase1887@; database=AgProje");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                KullaniciLabel.Visible = true;
                KullaniciLabel.Text = Session["username"].ToString();
                CikisButon.Visible = true;
                GirisYapButon.Visible = false;
                KayitOlButon.Visible = false;
            }
            else
            {
                KullaniciLabel.Visible = false;
                CikisButon.Visible = false;
                GirisYapButon.Visible = true;
                KayitOlButon.Visible = true;
            }

            connection.Open();
            string komut = "SELECT * FROM games";
            MySqlDataAdapter adapter = new MySqlDataAdapter(komut, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            OyunListesi.DataSource = dt;
            OyunListesi.DataBind();

            string komut2 = "SELECT * FROM items";
            MySqlDataAdapter adapter2 = new MySqlDataAdapter(komut2, connection);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);
            ItemListesi.DataSource = dt2;
            ItemListesi.DataBind();
            connection.Close();
        }

        protected void GirisYapButon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Giris.aspx");
        }

        protected void KayitOlButon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Kayit.aspx");
        }

        protected void CikisButon_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect(Request.RawUrl);
        }

        protected void SepeteEkleOyun_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                var user = Session["username"].ToString();
                var info = (sender as Button).CommandArgument.ToString().Split(',');

                string cmd = "INSERT INTO cart(username, name, price) VALUES('" + user + "', '" + info[1] + "', '" + info[2] + "');";
                MySqlCommand command = new MySqlCommand(cmd, connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Dispose();
                connection.Close();

                Response.Write("<script>alert('Oyun sepete Eklendi!');</script>");

            }
            else
            {
                Response.Redirect("Giris.aspx");
            }
        }

        protected void SepeteEkleItem_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                var user = Session["username"].ToString();
                var info = (sender as Button).CommandArgument.ToString().Split(',');

                string cmd = "INSERT INTO cart(username, name, price) VALUES('" + user + "', '" + info[1] + "', '" + info[2] + "');";
                MySqlCommand command = new MySqlCommand(cmd, connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Dispose();
                connection.Close();

                Response.Write("<script>alert('Oyun parası sepete Eklendi!');</script>");

            }
            else
            {
                Response.Redirect("Giris.aspx");
            }
        }

        protected void SepeteGitButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sepet.aspx");
        }
    }
}