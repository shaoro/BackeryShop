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
        int userId;
        List<string> OrderItems; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                User u = (User)Session["user"];
                userId = u.ID;
            }
            else
            {
                userId = 99;
            }
            
            Button_process_payment.Enabled = true;
            Label_order_complete.Visible = false;
            Button_return.Visible = false;
            conn.ConnectionString = "server=(local); database=Bakery; Integrated Security = SSPI";
            Label_price_final.Text = Session["ttl_price"].ToString();
            OrderItems = (List<string>)Session["LIST"];
        }

        protected void Button_process_payment_Click(object sender, EventArgs e)
        {
            
             Label_cc_not_valid.Visible = false;
            Label_expire_not_valid.Visible = false;
            

            string creditcard = TextBox_cc_num.Text;
            string expire = TextBox_exp_date.Text;
            
            if(creditcard.Length != 16 || expire.Length != 4 )
            {
                if(creditcard.Length != 16)
                {
                    Label_cc_not_valid.Visible = true;
                    Label_cc_not_valid.Text = "Invalid Credit Card Number";
                }
                if(expire.Length != 4)
                {
                    Label_expire_not_valid.Visible = true;
                    Label_expire_not_valid.Text = "Invalid Expiry Date";
                }
                
            }
            else
            {
                
            
            try
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO orderH(totalCost, purchaseDate, userId) values(@price, @date, @user);";

                
                cmd.Parameters.AddWithValue("@price", Label_price_final.Text.TrimStart('$'));
                cmd.Parameters.AddWithValue("@date", System.DateTime.Now);
                cmd.Parameters.AddWithValue("@user", userId);
                    


                cmd.ExecuteNonQuery();
                
                cmd.CommandText = "DELETE FROM buildOrder;";
                cmd.ExecuteNonQuery();
                
                conn.Close();
                    Label_order_complete.Visible = true;
                    Button_return.Visible = true;
                    Button_process_payment.Enabled = false;
            }
            catch (SqlException ex)
            {
                Response.Write(" An error occured " + ex.Message);
            }
            }
            

        }

        protected void Button_return_Click(object sender, EventArgs e)
        {
            Server.Transfer("OrderOnline.aspx");
        }
    }
}