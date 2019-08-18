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

                if (count == 1)
                {
                    Button1.Text = pastryName;
                    Button1.Visible = true;
                    Label_1_desc.Text = pastryDesc;
                        price = Convert.ToDouble(pastryPrice);
                        Label_1_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                        Label_item_name.Text = pastryName;
                        Label_item_desc.Text = pastryDesc;
                        Label_item_price.Text = price.ToString("C", CultureInfo.CurrentCulture);

                    }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                        price = Convert.ToDouble(pastryPrice);
                        Label_2_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                    }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                        price = Convert.ToDouble(pastryPrice);
                        Label_3_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                    }
                count++;
            }
            conn.Close();

            
                // On first page load:  if logged in as admin
                if ((string)Session["THREAD"] == "admin")
                {
                    
                }
                else
                {

                }
                // On first page load:  if logged in as a registered user
                if ((string)Session["THREAD"] == "user")
                {
                    items_selected = 0;
                    total_price = 0;
                }
                else
                {

                }
                // On first page load:  if not logged in
                if ((string)Session["THREAD"] == "guest")
                {
                    items_selected = 0;
                    total_price = 0;
                }
            }


        }

        protected void Button_cookies_Click(object sender, EventArgs e)
        {
            Session["ID"] = "1";
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

                if (count == 1)
                {
                    Button1.Text = pastryName;
                    Button1.Visible = true;
                    Label_1_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_1_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_2_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_3_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                count++;
            }
            conn.Close();
        }

        protected void Button_cupcakes_Click(object sender, EventArgs e)
        {
            Session["ID"] = "2";
            conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = "Select * from Pastry where categoryId = 2";
            int count = 1;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string pastryName = reader[1].ToString();
                string pastryDesc = reader[2].ToString();
                string pastryPrice = reader[3].ToString();

                if (count == 1)
                {
                    Button1.Text = pastryName;
                    Button1.Visible = true;
                    Label_1_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_1_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_2_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_3_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                count++;
            }
            conn.Close();
        }

        protected void Button_cakes_Click(object sender, EventArgs e)
        {
            Session["ID"] = "3";
            conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = "Select * from Pastry where categoryId = 3";
            int count = 1;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string pastryName = reader[1].ToString();
                string pastryDesc = reader[2].ToString();
                string pastryPrice = reader[3].ToString();


                if (count == 1)
                {
                    Button1.Text = pastryName;
                    Button1.Visible = true;
                    Label_1_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_1_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_2_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                    price = Convert.ToDouble(pastryPrice);
                    Label_3_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
                }
                count++;
            }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Image_item_display.ImageUrl = "";
            Label_item_name.Text = Button1.Text;
            Label_item_desc.Text = Label_1_desc.Text;
            price = Convert.ToDouble(Label_1_price.Text.TrimStart('$'));
            Label_item_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Image_item_display.ImageUrl = "";
            Label_item_name.Text = Button2.Text;
            Label_item_desc.Text = Label_2_desc.Text;
            price = Convert.ToDouble(Label_2_price.Text.TrimStart('$'));
            Label_item_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Image_item_display.ImageUrl = "";
            Label_item_name.Text = Button3.Text;
            Label_item_desc.Text = Label_3_desc.Text;
            price = Convert.ToDouble(Label_3_price.Text.TrimStart('$'));
            Label_item_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
        }

        protected void Button_add_Click(object sender, EventArgs e)
        {
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

                if(items_selected-- < 0)
                {

                }
                else
                {
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
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
             Image_item_display.ImageUrl = "";
            Label_item_name.Text = Button1.Text;
            Label_item_desc.Text = Label_1_desc.Text;
            price = Convert.ToDouble(Label_1_price.Text.TrimStart('$'));
            Label_item_price.Text = price.ToString("C", CultureInfo.CurrentCulture);
             */
            Label_item_name.Text = GridView1.SelectedRow.ToString();
        }
    }
}