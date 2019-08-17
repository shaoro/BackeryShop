using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatstryShopWebApp
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["LIST"] != null)
            {
                List<string> displayItems = (List<string>)Session["LIST"];
                for(int i = 0; i < displayItems.Count; i++)
                {
                    ListBox1.Items.Add(displayItems[i]);
                    
                }
            }
        }
    }
}