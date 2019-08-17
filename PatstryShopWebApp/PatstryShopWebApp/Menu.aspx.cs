using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

namespace PatstryShopWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();

        private string connection = "server=(local);" +
                    "database=Bakery; Integrated Security = SSPI;";

        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadCookie();
            }
        }

        protected void loadCookie()
        {
            using (conn)
            {
                conn.ConnectionString = connection;
                try
                {
                    using (cmd = new SqlCommand() )
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        cmd.CommandText = "Select name, description, price, image from Pastry Where category = @id";

                        cmd.Parameters.AddWithValue("@id", "1");

                        SqlDataReader reader = cmd.ExecuteReader();

                        while(reader.Read())
                        {
                            HtmlGenericControl li = new HtmlGenericControl();
                            cookieList.Controls.Add(li);

                            HtmlGenericControl img = new HtmlGenericControl();
                            li.Controls.Add(img);
                            img.Attributes["src"] = "image/Coolies/" + reader[3];
                            
                        }

                        reader.Close();

                    }
                }catch(SqlException ex)
                {
                    
                }
            }
        }
    }
}