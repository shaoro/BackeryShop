using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatstryShopWebApp
{
    public partial class MainPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                hyperLog.Text = "Logout";
                hyperLog.NavigateUrl = "Logout.aspx";
            }
            else
            {
                hyperLog.Text = "Login";
                hyperLog.NavigateUrl = "Login.aspx";
            }
        }
    }
}