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
    public partial class Sepet : System.Web.UI.Page
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;user id=root; password=chase1887@; database=AgProje");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Giris.aspx");
            }
            connection.Open();
            string cmd = "SELECT * FROM cart WHERE username = '" + Session["username"].ToString() + "';";
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            SepetListeGrid.DataSource = dt;
            SepetListeGrid.DataBind();

            var toplam = 0;
            foreach (GridViewRow row in SepetListeGrid.Rows)
            {
                var price = Convert.ToInt32(row.Cells[2].Text);
                toplam += price;
            }

            ToplamLabel.Text = toplam.ToString();

            connection.Close();
        }

        protected void SatınAl_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ToplamLabel.Text) > 0)
            {
                connection.Open();
                string cmd = "DELETE FROM cart WHERE username = '" + Session["username"].ToString() + "';";
                MySqlCommand command = new MySqlCommand(cmd, connection);
                command.ExecuteNonQuery();
                connection.Close();

                Response.Write("<script>alert('Satın alma işleminiz gerçekleşmiştir! Anasayfaya yönlendirileceksiniz.');</script>");
                Response.AddHeader("REFRESH", "1;URL=Anasayfa.aspx");
            }
            else
            {
                Response.Write("<script>alert('Sepetinizde bir ürün bulunmuyor.');</script>");
            }
        }

        protected void SepetListeGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var index = Convert.ToInt32(e.RowIndex);
            var order_id = Convert.ToInt32(SepetListeGrid.Rows[index].Cells[0].Text);

            var cmd = "DELETE FROM cart WHERE(id =" + order_id + ");";
            MySqlCommand command = new MySqlCommand(cmd, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Dispose();

            string query = "SELECT * FROM cart WHERE username = '" + Session["username"].ToString() + "';";
            MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            SepetListeGrid.DataSource = dt;
            SepetListeGrid.DataBind();

            var toplam = 0;
            foreach (GridViewRow row in SepetListeGrid.Rows)
            {
                var price = Convert.ToInt32(row.Cells[2].Text);
                toplam += price;
            }

            ToplamLabel.Text = toplam.ToString();

            connection.Close();
        }
    }
}