using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatstryShopWebApp
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["user"] != null)
            {
                var newUser = (User)Session["user"];

                if (newUser.UserName == "admin")
                {
                    if (!IsPostBack)
                    {
                        loadPastry();
                        lblError.Text = "";
                    }
                }
                else
                {
                    Response.Redirect("User.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }




        }


        protected void btnItem_Click(object sender, EventArgs e)
        {
            loadPastry();
        }


        protected void btnUser_Click(object sender, EventArgs e)
        {
            loadUser();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            loadOrder();
        }

        protected void loadPastry()
        {
            adminContent.ActiveViewIndex = 0;
            string str = "Select * from Pastry";
            string field = "name";
            string id = "ID";
            loadInfos(str, ddlPastry, pastryItems, field, id);
        }

        protected void loadUser()
        {
            adminContent.ActiveViewIndex = 1;
            string str = "Select * from userTable";
            string field = "userName";
            string id = "userId";
            loadInfos(str, ddlUser, userView, field, id);
        }

        protected void loadOrder()
        {
            adminContent.ActiveViewIndex = 2;
            string str = "select o.*, ut.firstName " +
                   "from orderH o " +
                   "Inner join userTable ut " +
                   "ON o.userId = ut.userId; ";
            string field = "firstName";
            string id = "orderId";
            loadInfos(str, ddlOrder, orderView, field, id);
        }

        protected void loadInfos(string str, DropDownList ddl, GridView gv, string field, string id)
        {
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

                        gv.DataSource = dt;
                        gv.DataBind();

                        ddl.DataSource = dt;
                        ddl.DataTextField = field;
                        ddl.DataValueField = id;
                        ddl.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void btnDeleted_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlPastry.SelectedItem.Value);
            string value = ddlPastry.SelectedItem.Text;
            string str = "Delete From Pastry Where ID = ";

            deteted(id, value, str);
            loadPastry();
        }

        protected void btnDeleteduser_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlUser.SelectedItem.Value);

            if(id == 1)
            {
                lblError.Text = "Cannot deleted Admin Account";
            } else
            {
                string value = ddlUser.SelectedItem.Text;
                string str = "Delete From userTable Where userId = ";
                deteted(id, value, str);
                loadUser();
            }
        }

        protected void deteted(int id, string value, string str)
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
                        cmd.CommandText = str +  "@id";

                        cmd.Parameters.AddWithValue("@id", id);

                        cmd.ExecuteNonQuery();

                        lblError.Text = "value Deleted Success";
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void btnViewDetail_Click(object sender, EventArgs e)
        {
            btnBack.Visible = true;

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

                        orderView.DataSource = dt;
                        orderView.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            lblHeader.Text = "Patry Edit";
            adminContent.ActiveViewIndex = 3;
            btnUpdate.Visible = true;
            btnAddConfirm.Visible = false;

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
                        cmd.CommandText = "Select * from category;";

                        SqlDataReader rd = cmd.ExecuteReader();
                        DataTable dt = new DataTable();

                        while(rd.Read())
                        {
                            ddlCate.Items.Add(
                                new ListItem() {
                                    Text = rd["name"].ToString(),
                                    Value = rd["categoryId"].ToString()
                                });
                        }

                        rd.Close();

                        cmd.CommandText = "Select name, description, price, categoryId from Pastry Where ID = @id";
                        cmd.Parameters.AddWithValue("@id", Convert.ToInt32(ddlPastry.SelectedItem.Value));

                        rd = cmd.ExecuteReader();

                        rd.Read();

                        tbName.Text = rd[0].ToString();
                        tbPrice.Text = rd[2].ToString();
                        tbDes.Text = rd[1].ToString();

                        if(RetreiveCate(rd[3].ToString()) >= 0)
                        {
                            ddlCate.SelectedIndex = RetreiveCate(rd[3].ToString());
                        }
                        else
                        {
                            ddlCate.SelectedIndex = 0;
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

        protected int RetreiveCate(string s)
        {
            int id = 0;

            for(int i = 0; i < ddlCate.Items.Count; i++)
            {
                if (ddlCate.Items[i].Value == s)
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

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            resetValue();
            adminContent.ActiveViewIndex = 3;
            btnAddConfirm.Visible = true;
            lblHeader.Text = "Pastry Add New Item";
            btnUpdate.Visible = false;
        }

        protected void btnAddConfirm_Click(object sender, EventArgs e)
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

                        if(imageUpload.FileName == "")
                        {
                            cmd.CommandText = "INSERT INTO Pastry(name, description, price, categoryId) " +
                                              "VALUES (@name, @des, @price, @cate);";
                        }
                        else
                        {
                            cmd.CommandText = "INSERT INTO Pastry(name, description, price, categoryId, imageUrl) " +
                                              "VALUES (@name, @des, @price, @cate, @image);";
                            cmd.Parameters.AddWithValue("@image", imageUpload.FileName);
                        }
                        cmd.Parameters.AddWithValue("@name", tbName.Text);
                        cmd.Parameters.AddWithValue("@des", tbDes.Text);
                        cmd.Parameters.AddWithValue("@price", tbPrice.Text);
                        cmd.Parameters.AddWithValue("@cate", ddlCate.SelectedItem.Value);
                        

                        cmd.ExecuteNonQuery();

                        loadPastry();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
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

                        if(imageUpload.FileName == "")
                        {
                            cmd.CommandText = "Update Pastry " +
                                              "Set name = @name, description = @des, price = @price, categoryId = @cate " +
                                              "Where ID = @ID;";
                        }
                        else
                        {
                            cmd.CommandText = "Update Pastry " +
                                          "Set name = @name, description = @des, price = @price, categoryId = @cate, imageUrl = @image" +
                                              "Where ID = @ID;";
                            cmd.Parameters.AddWithValue("@image", imageUpload.FileName);
                        }
                        
                        cmd.Parameters.AddWithValue("@ID", ddlPastry.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@name", tbName.Text);
                        cmd.Parameters.AddWithValue("@des", tbDes.Text);
                        cmd.Parameters.AddWithValue("@price", tbPrice.Text);
                        cmd.Parameters.AddWithValue("@cate", ddlCate.SelectedItem.Value);
                       

                        cmd.ExecuteNonQuery();

                        loadPastry();
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "An Error Occured " + ex.Message;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            resetValue();
            loadPastry();
            
        }

        protected void resetValue()
        {
            tbName.Text = "";
            tbDes.Text = "";
            tbPrice.Text = "";
            ddlCate.SelectedIndex = 0;
        }
    }
}