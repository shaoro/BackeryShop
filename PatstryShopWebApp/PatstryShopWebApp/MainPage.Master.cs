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

                var newUser = (User)Session["user"];

                hyperUser.Visible = true;

                if(newUser.UserName == "admin")
                {
                    hyperUser.Text = "Admin";
                    hyperUser.NavigateUrl = "Admin.aspx";
                }
                else
                {
                    hyperUser.Text = "Welcome " + newUser.FirstName;
                    hyperUser.NavigateUrl = "User.aspx";
                }
            }
            else
            {
                hyperLog.Text = "Login";
                hyperLog.NavigateUrl = "Login.aspx";
            }

            
        }
    }
}