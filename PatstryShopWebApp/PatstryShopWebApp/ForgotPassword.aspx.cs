using System;
using System.Data.SqlClient;
using System.Net.Mail;

namespace PatstryShopWebApp
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["forgot"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
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

                        cmd.CommandText = "Select count(*) from UserTable " +
                                          "where UPPER(UserName) = UPPER(@userName);";

                        cmd.Parameters.AddWithValue("@userName", tbUserName.Text);

                        SqlDataReader reader = cmd.ExecuteReader();

                        reader.Read();

                        int validUser = Convert.ToInt32(reader[0].ToString());

                        reader.Close();

                        if (validUser >= 1)
                        {
                            string email = getEmail();
                            string tempPass = randomPass();

                            lbError.Text = "Temporate password was send to your email, please reset your password after";

                            sendEmail(email, tempPass);

                            cmd.CommandText = "update userTable set password = @pass " +
                                "where UPPER(userName) = UPPER(@userName);";

                            cmd.Parameters.AddWithValue("@pass", tempPass);

                            cmd.ExecuteNonQuery();


                        }
                        else
                        {
                            lbError.Text = "username does not exsist, please check again!";
                        };

                        Session["forgot"] = null;
                    }

                }
                catch (SqlException ex)
                {
                    lbError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected string getEmail()
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

                        cmd.CommandText = "Select email from UserTable " +
                                          "where UPPER(UserName) = UPPER(@userName);";

                        cmd.Parameters.AddWithValue("@userName", tbUserName.Text);

                        SqlDataReader reader = cmd.ExecuteReader();

                        reader.Read();

                        string email = reader[0].ToString();

                        reader.Close();

                        return email;
            
                    }

                }
                catch (SqlException ex)
                {
                   return lbError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void sendEmail(string email, string temp)
        {
            MailMessage mail = new MailMessage("jsbakeryoakville@gmail.com", email);
            mail.Subject = "Reset Password";
            mail.Body = "Here is your temparate password " + temp + ", please login and reset the password";

            SmtpClient client = new SmtpClient();
            client.Send(mail);
        }

        protected string randomPass()
        {
            string validChars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*?_-123456789";
            Random random = new Random();

            char[] chars = new char[8];

            for (int i = 0; i < 8; i++)
            {
                chars[i] = validChars[random.Next(0, validChars.Length)];
            }
            return new string(chars);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["forgot"] = null;
            Response.Write(
                   "<script>" +
                   "window.close();" +
                   "</script>");
        }
    }
}