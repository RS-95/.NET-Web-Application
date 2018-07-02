using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.Configuration;

namespace CompanyPortal
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["myconnstring"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("select * from Feed", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                loadtabs();

            }



        }

        private void loadtabs()
        {
            FormsAuthenticationTicket ft = ((FormsIdentity)User.Identity).Ticket;
            string sn = ft.Name;
            using (SqlConnection conn = new SqlConnection("Data Source = localhost\\SQLEXPRESS; Initial Catalog = Example; Integrated Security = True"))
            {
                SqlCommand c = new SqlCommand("select * from Userdata where Username = @uname", conn);
                c.Parameters.AddWithValue("@uname", sn);
                conn.Open();
                SqlDataReader rdr = c.ExecuteReader();
                while (rdr.Read())
                {
                    input1.Value = rdr["Name"].ToString();
                    input2.Value = rdr["Email"].ToString();
                    input3.Value = rdr["Phone"].ToString();
                }
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            outputfeed.Text = (GridView1.SelectedRow.FindControl("lblfeed") as Label).Text;
            mpe.Show();
        }


        protected void UploadFeed(object sender, EventArgs e)
        {
            string constr = "Data Source = localhost\\SQLEXPRESS; Initial Catalog = Example; Integrated Security = True";
            string Msg = Request.Form["messagetext"];
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "insert into Feed values (@Name,@Email,@Phone,@Message)";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@Name", input1.Value);
                    cmd.Parameters.AddWithValue("@Email", input2.Value);
                    cmd.Parameters.AddWithValue("@Phone", input3.Value);
                    cmd.Parameters.AddWithValue("@Message", Msg);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Thank You For Your Feedback!!')</script>");
        }
    }
}