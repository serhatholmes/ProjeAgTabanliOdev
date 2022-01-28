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
    public partial class Admin : System.Web.UI.Page
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;user id=root; password=chase1887@; database=AgProje");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() != "admin")
            {
                Response.Redirect("Anasayfa.aspx");
            }
            connection.Open();
            string komut = "SELECT * FROM games";
            MySqlDataAdapter adapter = new MySqlDataAdapter(komut, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            OyunListesiGrid.DataSource = dt;
            OyunListesiGrid.DataBind();

            string komut2 = "SELECT * FROM items";
            MySqlDataAdapter adapter2 = new MySqlDataAdapter(komut2, connection);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);
            ItemListesiGrid.DataSource = dt2;
            ItemListesiGrid.DataBind();

            connection.Close();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            var item_id = IDtb.Text;
            var item_name = Nametb.Text;
            var item_price = Pricetb.Text;
            var item_resim = Resimtb.Text;

            if (item_id == "")
            {
                string komut = "INSERT INTO games(name, price, image) VALUES('" + item_name + "', '" + item_price + "', '" + item_resim + "');";
                MySqlCommand command = new MySqlCommand(komut, connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Dispose();
            }

            else
            {
                string komut = "UPDATE games SET name = '" + item_name + "', price = '" + item_price + "', image = '" + item_resim + "' WHERE id = '" + item_id + "';";
                MySqlCommand command = new MySqlCommand(komut, connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Dispose();

            }



            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM games", connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            OyunListesiGrid.DataSource = dt;
            OyunListesiGrid.DataBind();

            connection.Close();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            var id = OyunListesiGrid.SelectedRow.Cells[1].Text;
            var cmd = "DELETE FROM games WHERE(id =" + id + ");";
            MySqlCommand command = new MySqlCommand(cmd, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Dispose();

            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM games", connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            OyunListesiGrid.DataSource = dt;
            OyunListesiGrid.DataBind();

            connection.Close();
        }

        protected void OyunListesiGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = OyunListesiGrid.SelectedRow.Cells[1].Text;
            var name = OyunListesiGrid.SelectedRow.Cells[2].Text;
            var price = OyunListesiGrid.SelectedRow.Cells[3].Text;
            var image = OyunListesiGrid.SelectedRow.Cells[4].Text;
            OyunListesiGrid.SelectedRowStyle.BackColor = System.Drawing.Color.RoyalBlue;
            OyunListesiGrid.SelectedRowStyle.ForeColor = System.Drawing.Color.White;

            IDtb.Text = id;
            Nametb.Text = name;
            Pricetb.Text = price;
            Resimtb.Text = image;
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            IDtb.Text = "";
            Nametb.Text = "";
            Pricetb.Text = "";
            Resimtb.Text = "";

            OyunListesiGrid.SelectedIndex = -1;
        }

        protected void ItemSaveButton_Click(object sender, EventArgs e)
        {
            var item_id = ItemIDTb.Text;
            var item_name = ItemNameTb.Text;
            var item_price = ItemPriceTb.Text;
            var item_resim = ItemResimTb.Text;

            if (item_id == "")
            {
                string komut = "INSERT INTO items(name, price, image) VALUES('" + item_name + "', '" + item_price + "', '" + item_resim + "');";
                MySqlCommand command = new MySqlCommand(komut, connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Dispose();
            }

            else
            {
                string komut = "UPDATE items SET name = '" + item_name + "', price = '" + item_price + "', image = '" + item_resim + "' WHERE id = '" + item_id + "';";
                MySqlCommand command = new MySqlCommand(komut, connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Dispose();

            }



            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM items", connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            ItemListesiGrid.DataSource = dt;
            ItemListesiGrid.DataBind();

            connection.Close();
        }

        protected void ItemSilButton_Click(object sender, EventArgs e)
        {
            var id = ItemListesiGrid.SelectedRow.Cells[1].Text;
            var cmd = "DELETE FROM items WHERE(id =" + id + ");";
            MySqlCommand command = new MySqlCommand(cmd, connection);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Dispose();

            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM items", connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            ItemListesiGrid.DataSource = dt;
            ItemListesiGrid.DataBind();

            connection.Close();
        }

        protected void ItemClearButton_Click(object sender, EventArgs e)
        {
            ItemIDTb.Text = "";
            ItemNameTb.Text = "";
            ItemPriceTb.Text = "";
            ItemResimTb.Text = "";

            ItemListesiGrid.SelectedIndex = -1;
        }

        protected void ItemListesiGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = ItemListesiGrid.SelectedRow.Cells[1].Text;
            var name = ItemListesiGrid.SelectedRow.Cells[2].Text;
            var price = ItemListesiGrid.SelectedRow.Cells[3].Text;
            var image = ItemListesiGrid.SelectedRow.Cells[4].Text;
            ItemListesiGrid.SelectedRowStyle.BackColor = System.Drawing.Color.RoyalBlue;
            ItemListesiGrid.SelectedRowStyle.ForeColor = System.Drawing.Color.White;

            ItemIDTb.Text = id;
            ItemNameTb.Text = name;
            ItemPriceTb.Text = price;
            ItemResimTb.Text = image;
        }
    }
}