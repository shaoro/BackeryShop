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
        // global total item count and total price variable
        static int items_selected;
        static double total_price;
        double price;
        // global sql connection variable 
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            
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
                    Label_1_price.Text = pastryPrice;
                }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                    Label_2_price.Text = pastryPrice;
                }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                    Label_3_price.Text = pastryPrice;
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
                    Label_1_price.Text = pastryPrice;
                }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                    Label_2_price.Text = pastryPrice;
                }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                    Label_3_price.Text = pastryPrice;
                }
                count++;
            }
            conn.Close();
        }

        protected void Button_cupcakes_Click(object sender, EventArgs e)
        {
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
                    Label_1_price.Text = pastryPrice;
                }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                    Label_2_price.Text = pastryPrice;
                }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                    Label_3_price.Text = pastryPrice;
                }
                count++;
            }
            conn.Close();
        }

        protected void Button_cakes_Click(object sender, EventArgs e)
        {
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
                    Label_1_price.Text = pastryPrice;
                }
                if (count == 2)
                {
                    Button2.Text = pastryName;
                    Button2.Visible = true;
                    Label_2_desc.Text = pastryDesc;
                    Label_2_price.Text = pastryPrice;
                }
                if (count == 3)
                {
                    Button3.Text = pastryName;
                    Button3.Visible = true;
                    Label_3_desc.Text = pastryDesc;
                    Label_3_price.Text = pastryPrice;
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
            Label_item_price.Text = Label_1_price.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Image_item_display.ImageUrl = "";
            Label_item_name.Text = Button2.Text;
            Label_item_desc.Text = Label_2_desc.Text;
            Label_item_price.Text = Label_2_price.Text;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Image_item_display.ImageUrl = "";
            Label_item_name.Text = Button3.Text;
            Label_item_desc.Text = Label_3_desc.Text;
            Label_item_price.Text = Label_3_price.Text;
        }

        protected void Button_add_Click(object sender, EventArgs e)
        {
            items_selected++;
            price = Convert.ToDouble(Label_item_price.Text);
            total_price += price;
            
            Label_display_total_items.Text = items_selected.ToString();
            Label_display_total_price.Text = total_price.ToString("C", CultureInfo.CurrentCulture);

            items.Add(Label_item_name.Text.ToString());
            
        }

        protected void Button_minus_Click(object sender, EventArgs e)
        {
            if (items_selected-- < 0)
            {

            }
            else
            {
                price = Convert.ToDouble(Label_item_price.Text);

                if((total_price -= price) < 0)
                {

                }
                else
                {
                    items_selected--;
                    total_price -= price;
                    Label_display_total_items.Text = items_selected.ToString();
                    Label_display_total_price.Text = total_price.ToString("C", CultureInfo.CurrentCulture);
                }
                
            }
            
        }

        protected void Button_to_checkout_Click(object sender, EventArgs e)
        {
            Session["TOTAL_PRICE"] = Label_display_total_price.Text.ToString();
            Session["TOTAL_ITEMS"] = Label_display_total_items.Text.ToString();
            Session["LIST"] = items;

            Server.Transfer("Checkout.aspx");
        }
    }
}