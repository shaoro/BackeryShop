using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;

namespace PatstryShopWebApp
{

    public partial class OrderOnline : System.Web.UI.Page
    {
        // global List to track the items added to order
        static List<string> items = new List<string>();
        static List<double> prices = new List<double>();
        // global total item count and total price variable
        static int items_selected;
        static double total_price;
        double price;
        // global sql connection variable 
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            Label_display_total_items.Text = items_selected.ToString();
            Label_display_total_price.Text = total_price.ToString("C", CultureInfo.CurrentCulture);
            conn.ConnectionString = "server=(local); database=Bakery; Integrated Security = SSPI";

            if (!IsPostBack)
            {
                   
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = "Select * from Pastry where categoryId = 1";
                int count = 1;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string pastryName = reader[1].ToString();
                    string pastryDesc = reader[2].ToString();
                    string pastryPrice = reader[3].ToString();
                    string pastryImage = reader[5].ToString();
                    if (count == 1)
                    {

                        
                            price = Convert.ToDouble(pastryPrice);
                            
                            Label_item_name.Text = pastryName;
                            Label_item_desc.Text = pastryDesc;
                            Label_item_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                            Image_item_display.ImageUrl = "image/"+pastryImage;

                        }
                    
                }
                conn.Close();
                
                 
            }


        }

        protected void Button_cookies_Click(object sender, EventArgs e)
        {
            Session["ID"] = "1";
            
        }

        protected void Button_cupcakes_Click(object sender, EventArgs e)
        {
            Session["ID"] = "2";
            
        }

        protected void Button_cakes_Click(object sender, EventArgs e)
        {
            Session["ID"] = "3";
            
        }

        protected void Button_add_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO buildOrder (item, price) values(@item, @price)";

                cmd.Parameters.AddWithValue("@item", Label_item_name.Text);
                cmd.Parameters.AddWithValue("@price", Label_item_price.Text.TrimStart('$'));

                cmd.ExecuteNonQuery();
                Label_buildOrder.Text = "Item added";
                Label_buildOrder.Visible = true;

                conn.Close();

            }
            catch (SqlException ex)
            {
                Response.Write(" An error occured " + ex.Message);
            }
            
            items_selected++;
            price = Convert.ToDouble(Label_item_price.Text.TrimStart('$'));
            total_price += price;
            
            Label_display_total_items.Text = items_selected.ToString();
            Label_display_total_items.Visible = true;
            Label_display_total_price.Text = total_price.ToString("C", CultureInfo.CurrentCulture);
            Label_display_total_price.Visible = true;

            items.Add(Label_item_name.Text.ToString());
            prices.Add(price);
            
        }

        protected void Button_minus_Click(object sender, EventArgs e)
        {

            
            if ((total_price -= price) < 0)
            {
                
            }
            else
            {
                price = Convert.ToDouble(Label_item_price.Text.TrimStart('$'));

                if((items_selected - 1) < 0)
                {

                }
                else
                {
                    try
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "DELETE FROM buildOrder where ID=(SELECT MAX(id) FROM buildOrder) AND item='@item';";

                        cmd.Parameters.AddWithValue("@item", Label_item_name.Text);
                        cmd.Parameters.AddWithValue("@price", Label_item_price.Text.TrimStart('$'));

                        cmd.ExecuteNonQuery();
                        Label_buildOrder.Text = "Item removed";
                        Label_buildOrder.Visible = true;
                        
                        conn.Close();

                    }
                    catch (SqlException ex)
                    {
                        Response.Write(" An error occured " + ex.Message);
                    }

                    items_selected--;
                    total_price -= price;
                    Label_display_total_items.Text = items_selected.ToString();
                    Label_display_total_price.Text = total_price.ToString("C", CultureInfo.CurrentCulture);

                    items.Remove(Label_item_name.Text.ToString());
                    prices.Remove(price);
                }
                
            }
            
        }

        protected void Button_to_checkout_Click(object sender, EventArgs e)
        {
            Session["TOTAL_PRICE"] = Label_display_total_price.Text.ToString();
            Session["TOTAL_ITEMS"] = Label_display_total_items.Text.ToString();
            Session["LIST"] = items;
            Session["PRICES"] = prices;

            Server.Transfer("Checkout.aspx");
        }

        protected void Button_reset_Click(object sender, EventArgs e)
        {
            items_selected = 0;
            total_price = 0;
            items.Clear();
            prices.Clear();
            Label_display_total_items.Text = items_selected.ToString();
            Label_display_total_price.Text = total_price.ToString("C", CultureInfo.CurrentCulture);
            try
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = "DELETE FROM buildOrder;";

                cmd.ExecuteNonQuery();
                Label_buildOrder.Text = "Order reset";
                Label_buildOrder.Visible = true;
                conn.Close();

            }
            catch (SqlException ex)
            {
                Response.Write(" An error occured " + ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label Label_temp_desc = null;
            Label Label_temp_img = null;
            
            Label_item_name.Text = GridView1.SelectedRow.Cells[1].Text;

            Label_temp_desc = (Label)GridView1.SelectedRow.FindControl("Label_temp_desc");
            Label_item_desc.Text = Label_temp_desc.Text;

            price = Convert.ToDouble(GridView1.SelectedRow.Cells[3].Text.TrimStart('$'));
            Label_item_price.Text = price.ToString("C", CultureInfo.CurrentCulture);

            Label_temp_img = (Label)GridView1.SelectedRow.FindControl("Label_temp_img");
            Image_item_display.ImageUrl = "image/" + Label_temp_img.Text; ;

            
        }
    }
}