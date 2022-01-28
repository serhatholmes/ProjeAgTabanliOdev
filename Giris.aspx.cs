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
    public partial class Giris : System.Web.UI.Page
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;user id=root; password=chase1887@; database=AgProje");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GirisYapButton_Click(object sender, EventArgs e)
        {
            var username = UsernameTb.Text;
            var password = PasswordTb.Text;

            connection.Open();
            string cmd = "SELECT * FROM users where username='" + username + "' AND password='" + password + "';";
            MySqlCommand command = new MySqlCommand(cmd, connection);
            command.ExecuteNonQuery();
            MySqlDataAdapter adapter = new MySqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Session["username"] = dr["username"].ToString();
                Response.Redirect("Anasayfa.aspx");
            }

            GirisBasarisiz.Text = "Yanlış kullanıcı adı veya şifre.";

            connection.Close();
        }

        protected void KayıtOl_Click(object sender, EventArgs e)
        {
            Response.Redirect("Kayit.aspx");
        }
    }
}