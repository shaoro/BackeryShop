using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace PatstryShopWebApp
{
    public partial class FinalPayment : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();

        List<string> OrderItems; 
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.ConnectionString = "server=(local); database=Bakery; Integrated Security = SSPI";
            Label_price_final.Text = Session["ttl_price"].ToString();
            OrderItems = (List<string>)Session["LIST"];
        }

        protected void Button_process_payment_Click(object sender, EventArgs e)
        {
            // Insert into Order/Order History:
                // the list of items:  loop through and add each item
                // 
            for(int i = 0; i < OrderItems.Count; i++)
            {
                //Response.Write(OrderItems[i]);  this worked to show that we have the List of items
            }

            try
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO orderH(totalCost, purchaseDate, userId) values(@price, @date, @user);";
                cmd.Parameters.AddWithValue("@date", System.DateTime.Now);
                cmd.Parameters.AddWithValue("@price", Label_price_final.Text.TrimStart('$'));
                cmd.Parameters.AddWithValue("@user", 1);


                cmd.ExecuteNonQuery();
                Response.Write("orderH  Success ");

                cmd.CommandText = "DELETE FROM buildOrder;";
                cmd.ExecuteNonQuery();
                Response.Write("buildOrder ***** Success ");
                conn.Close();

            }
            catch (SqlException ex)
            {
                Response.Write(" An error occured " + ex.Message);
            }
        }
    }
}