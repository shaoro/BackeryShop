using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Globalization;

namespace PatstryShopWebApp
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try { 
            if(Session["LIST"] != null)
            {
                    /*
                    List<double> displayPrices = (List<double>)Session["PRICES"];
                    for(int i = 0; i < displayPrices.Count; i++)
                    {
                        if (i == 0)
                        {
                            Label_pr_1.Text = displayPrices[i].ToString("C", CultureInfo.CurrentCulture);
                            Label_pr_1.Visible = true;
                        }
                        if (i == 1)
                        {
                            Label_pr_2.Text = displayPrices[i].ToString("C", CultureInfo.CurrentCulture);
                            Label_pr_2.Visible = true;
                        }
                        if (i == 2)
                        {
                            Label_pr_3.Text = displayPrices[i].ToString("C", CultureInfo.CurrentCulture);
                            Label_pr_3.Visible = true;
                        }
                        if (i == 3)
                        {
                            Label_pr_4.Text = displayPrices[i].ToString("C", CultureInfo.CurrentCulture);
                            Label_pr_4.Visible = true;
                        }
                        if (i == 4)
                        {
                            Label_pr_5.Text = displayPrices[i].ToString("C", CultureInfo.CurrentCulture);
                            Label_pr_5.Visible = true;
                        }
                        if (i == 5)
                        {
                            Label_pr_6.Text = displayPrices[i].ToString("C", CultureInfo.CurrentCulture);
                            Label_pr_6.Visible = true;
                        }
                    }

                List<string> displayItems = (List<string>)Session["LIST"];
                for(int i = 0; i < displayItems.Count; i++)
                {
                    if(i == 0)
                    {
                        Label_item_1.Text = displayItems[i];
                        Label_item_1.Visible = true;
                    }
                    if (i == 1)
                    {
                        Label_item_2.Text = displayItems[i];
                        Label_item_2.Visible = true;
                    }
                    if (i == 2)
                    {
                        Label_item_3.Text = displayItems[i];
                        Label_item_3.Visible = true;
                    }
                    if (i == 3)
                    {
                        Label_item_4.Text = displayItems[i];
                        Label_item_4.Visible = true;
                    }
                    if (i == 4)
                    {
                        Label_item_5.Text = displayItems[i];
                        Label_item_5.Visible = true;
                    }
                    if (i == 5)
                    {
                        Label_item_6.Text = displayItems[i];
                        Label_item_6.Visible = true;
                    }
                }
                */
                }

                if (Session["TOTAL_PRICE"] != null)
            {
                Label_total_price.Text = Session["TOTAL_PRICE"].ToString();
            }
            }
            catch(Exception ex)
            {
                
            }


        }

        protected void Button_to_payment_Click(object sender, EventArgs e)
        {
            Session["ttl_price"] = Label_total_price.Text;
            Server.Transfer("FinalPayment.aspx");
        }

        
    }
}