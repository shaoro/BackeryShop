using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatstryShopWebApp
{
    public partial class FinalPayment : System.Web.UI.Page
    {
        List<string> OrderItems; 
        protected void Page_Load(object sender, EventArgs e)
        {
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
        }
    }
}