using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace PatstryShopWebApp
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        SqlConnection conn;

        private string constring = "server=(local); " +
                    "database=Bakery; Integrated Security=SSPI;";

        SqlCommand cmd;

        SqlDataReader rd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["create"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string s = "Select count(*) from userTable where UPPER(userName) = UPPER('" + tbUser.Text + "');";
            if (isExsist(s))
            {
                insertTo();

                Session["create"] = null;

                Response.Write(
                    "<script>" +
                    "alert('Create Account Successully');" +
                    "window.close();" +
                    "</script>");
            }

        }

        protected Boolean isExsist(string s)
        {
            using (conn = new SqlConnection(constring))
            {
                conn.Open();

                cmd = new SqlCommand(s, conn);

                rd = cmd.ExecuteReader();

                rd.Read();

                int valid = Convert.ToInt32(rd[0].ToString());

                rd.Close();

                if (valid < 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
                
        }

        protected int getAddressID()
        {
            string s = "select count(*) from address where UPPER(street) = UPPER('" + tbStreet.Text + "')";
            bool valid = false;

            if (isExsist(s))
            {
                valid = true;
            }

            using (conn = new SqlConnection())
            {
                conn.ConnectionString = constring;

                try
                {
                    using (cmd = new SqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        cmd.Parameters.AddWithValue("@street", tbStreet.Text);

                        if(valid)
                        {
                            cmd.CommandText = "Insert Into address (street, city, postal, province) Values(@street, @city, @postal, @province);";
                            cmd.Parameters.AddWithValue("@city", tbCity.Text);
                            cmd.Parameters.AddWithValue("@postal", tbPostal.Text);
                            cmd.Parameters.AddWithValue("@province", ddlProv.SelectedItem.Value);

                            cmd.ExecuteNonQuery();
                        }

                        cmd.CommandText = "select addressId from address where UPPER(street) = UPPER(@street);";

                        rd = cmd.ExecuteReader();

                        rd.Read();

                        int id = Convert.ToInt32(rd[0].ToString());

                        rd.Close();

                        return id;
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = ex.Message;
                    return -1;
                }
            }
            
        }

        protected void insertTo()
        {
            int addressId = getAddressID();

            using (conn = new SqlConnection())
            {
                conn.ConnectionString = constring;

                try
                {
                    using (cmd = new SqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        cmd.CommandText = "INSERT INTO userTable(firstName, lastName, email, userName, password, phoneNumber, addressId)" +
                                           "VALUES(@fName, @lName, @email, @user, @pass, @phone, @addressId);";

                        cmd.Parameters.AddWithValue("@fName", tbfName.Text);
                        cmd.Parameters.AddWithValue("@lName", tblName.Text);
                        cmd.Parameters.AddWithValue("@email", tbEmail.Text);
                        cmd.Parameters.AddWithValue("@user", tbUser.Text);
                        cmd.Parameters.AddWithValue("@pass", tbPass.Text);
                        cmd.Parameters.AddWithValue("@phone", tbPhone.Text);
                        cmd.Parameters.AddWithValue("@addressId", addressId);

                        cmd.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "Error Occur" + ex.Message;
                }
            }   
        }
    }
}