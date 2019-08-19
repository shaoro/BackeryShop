using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace PatstryShopWebApp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "server=(local); " +
                  "database=Bakery; Integrated Security=SSPI;";
                try
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        cmd.CommandText = "Select count(*) from userTable where UPPER(userName) = UPPER(@userName);";

                        cmd.Parameters.AddWithValue("@userName", tbUser.Text);

                        SqlDataReader rd = cmd.ExecuteReader();

                        rd.Read();

                        int validUser = Convert.ToInt32(rd[0].ToString());

                        rd.Close();

                        if (validUser >= 1)
                        {
                            cmd.CommandText = "Select * from userTable where UPPER(UserName) = UPPER(@userName);";

                            rd = cmd.ExecuteReader();

                            rd.Read();

                            string password = rd[5].ToString();

                            if (password == tbPass.Text)
                            {
                                User newUser = new User(Convert.ToInt32(rd[0].ToString()), rd[1].ToString(), rd[2].ToString(), rd[3].ToString(),
                                    rd[4].ToString(), rd[5].ToString(), rd[6].ToString(), Convert.ToInt32(rd[7].ToString()));
                                Session["user"] = newUser;

                                rd.Close();


                                Response.Redirect("Menu.aspx");

                            }
                            else
                            {
                                lbError.Text = "Password Incorrect!";
                            }
                        }
                        else
                        {
                            lbError.Text = tbUser.Text + " does not exsist, please registred the new account!";
                        }
                    }

                }
                catch (SqlException ex)
                {
                    lbError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            string url = "CreateAccount.aspx";

            Session["create"] = "create";

            string s = "window.open('" + url + "', 'popup_window', 'width=500,height=500,left=300,top=100,resizable=yes');";

            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        protected void forgotPass_Click(object sender, EventArgs e)
        {
            string url = "ForgotPassword.aspx";

            Session["forgot"] = "forgot";

            string s = "window.open('" + url + "', 'popup_window', 'width=500,height=500,left=300,top=100,resizable=yes');";

            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
    }
}
