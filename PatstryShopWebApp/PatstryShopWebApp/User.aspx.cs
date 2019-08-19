using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace PatstryShopWebApp
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                var newUser = (User)Session["user"];
                if (!IsPostBack)
                {
                   
                    lblUser.Text = newUser.FirstName + " " + newUser.LastName;
                    lblError.Text = "";
                    enables();
                    loadInfo(newUser);
                    disable();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            enables(); 
        }

        protected void enables()
        {
            Button1.Visible = false;
            rUser.Enabled = true;
            rPass.Enabled = true;
            comparePass.Enabled = true;
            confirmPass.Visible = true;
            tbPass.ReadOnly = false;
            tbUser.ReadOnly = false;
            btnConfirm.Visible = true;
            btnCancels.Visible = true;
        }
        protected void disable ()
        {
            rUser.Enabled = false;
            rPass.Enabled = false;
            comparePass.Enabled = false;
            confirmPass.Visible = false;
            tbUser.ReadOnly = true;
            tbPass.ReadOnly = true;
            btnConfirm.Visible = false;
            btnCancels.Visible = false;
            Button1.Visible = true;
        }

      

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            var user = (User)Session["user"];

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

                        cmd.CommandText = "UPDATE UserTable " +
                        "Set userName = @user, password= @pass Where userId = @id";

                        cmd.Parameters.AddWithValue("@id", user.ID);
                        cmd.Parameters.AddWithValue("user", tbUser.Text);
                        cmd.Parameters.AddWithValue("pass", tbPass.Text);


                        cmd.ExecuteNonQuery();

                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }

            loadInfo(user);

            disable();

        }

        protected void loadInfo(User newUser)
        {
            userContent.ActiveViewIndex = 0;

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

                        cmd.CommandText = "Select * from userTable where userId = @id";
                        cmd.Parameters.AddWithValue("@id", newUser.ID);

                        SqlDataReader rd = cmd.ExecuteReader();

                        rd.Read();

                        tbUser.Text = rd[4].ToString();
                        tbPass.Text = rd[5].ToString();
                        lblEmail.Text = rd[3].ToString();
                        lblPhone.Text = rd[6].ToString();
                        
                        rd.Close();

                        cmd.CommandText = "Select street, city, province, postal from Address where addressId = @adid;";
                        cmd.Parameters.AddWithValue("@adid", newUser.AddressID);

                        rd = cmd.ExecuteReader();
                        rd.Read();

                        lblAddress.Text = rd[0].ToString() + "\n" + rd[1].ToString() + ", " +
                                          rd[2].ToString() + ", " + rd[3].ToString();

                        rd.Close();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void loadOrder()
        {
            userContent.ActiveViewIndex = 1;

            var user = (User)Session["user"];

            string str = "Select * from orderH where userId = '" + user.ID + "';";
            string field = "orderId";

            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "server=(local); " +
                    "database=Bakery; Integrated Security=SSPI;";
                try
                {
                    conn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(str, conn))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        orderHist.DataSource = dt;
                        orderHist.DataBind();

                        ddlOrder.DataSource = dt;
                        ddlOrder.DataTextField = field;
                        ddlOrder.DataValueField = field;
                        ddlOrder.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void btnInfo_Click(object sender, EventArgs e)
        {
            var user = (User)Session["user"];

            loadInfo(user);
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            ddlOrder.Visible = true;
            btnViewDetail.Visible = true;
            btnReOrder.Visible = false;
            btnBack.Visible = false;
            loadOrder();
           

        }

        protected void btnViewDetail_Click(object sender, EventArgs e)
        {
            btnBack.Visible = true;
            btnReOrder.Visible = true;
            ddlOrder.Visible = false;
            btnViewDetail.Visible = false;

            string str = "select od.orderId, p.name, p.price, od.qty " +
                         "from orderH oh " +
                         "left join orderDetail od " +
                         "on oh.orderId = od.orderId " +
                         "left join Pastry p " +
                         "on od.id = p.id Where od.orderId = 1;";

            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "server=(local); " +
                    "database=Bakery; Integrated Security=SSPI;";
                try
                {
                    conn.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(str, conn))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        orderHist.DataSource = dt;
                        orderHist.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
           
        }

        protected void btnReOrder_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var user = (User)Session["user"];
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

                        cmd.CommandText = "Update userTable " +
                            "Set firstName = @first, lastName = @last, email = @email, phoneNumber = @phone " +
                            "Where userId = @id;";

                        cmd.Parameters.AddWithValue("@id", user.ID);
                        cmd.Parameters.AddWithValue("@first", tbfName.Text);
                        cmd.Parameters.AddWithValue("@last", tblName.Text);
                        cmd.Parameters.AddWithValue("@email", tbEmail.Text);
                        cmd.Parameters.AddWithValue("@phone", tbPhone.Text);
                        cmd.Parameters.AddWithValue("street", tbStreet.Text);
                        cmd.Parameters.AddWithValue("@city", tbCity.Text);
                        cmd.Parameters.AddWithValue("@postal", tbPostal.Text);
                        cmd.Parameters.AddWithValue("@pro", ddlProv.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@adid", user.AddressID);

                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "Update Address " +
                            "Set street = @street, city = @city, postal = @postal, province = @pro where addressId = @adid;";
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
            loadInfo(user);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            var user = (User)Session["user"];
            loadInfo(user);
        }

        protected void btnCancels_Click(object sender, EventArgs e)
        {
            var user = (User)Session["user"];
            disable();
            loadInfo(user);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            userContent.ActiveViewIndex = 2;
            var user = (User)Session["user"];
            loadUserInfo(user);
        }

        protected void loadUserInfo(User newUser)
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

                        cmd.CommandText = "Select * from userTable where userId = @id";
                        cmd.Parameters.AddWithValue("@id", newUser.ID);

                        SqlDataReader rd = cmd.ExecuteReader();

                        rd.Read();

                        tbfName.Text = newUser.FirstName;
                        tblName.Text = newUser.LastName;
                        tbEmail.Text = newUser.Email;
                        tbPhone.Text = newUser.PhoneNum;

                        rd.Close();

                        cmd.CommandText = "Select street, city, province, postal from Address where addressId = @adid;";
                        cmd.Parameters.AddWithValue("@adid", newUser.AddressID);

                        rd = cmd.ExecuteReader();
                        rd.Read();

                        tbStreet.Text = rd[0].ToString();
                        tbCity.Text = rd[1].ToString();
                        tbPostal.Text = rd[3].ToString();

                        if (GetPro(rd[3].ToString()) >= 0)
                        {
                            ddlProv.SelectedIndex = GetPro(rd[3].ToString());
                        }
                        else
                        {
                            ddlProv.SelectedIndex = 2;
                        }

                        rd.Close();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected int GetPro(string s)
        {
            int id = 0;

            for (int i = 0; i < ddlProv.Items.Count; i++)
            {
                if (ddlProv.Items[i].Value == s)
                {
                    id = i;
                }
                else
                {

                    id = -1;
                }
            }

            return id;
        }
    }
}