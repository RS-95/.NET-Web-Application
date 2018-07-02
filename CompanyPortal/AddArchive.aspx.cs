using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace CompanyPortal
{
    public partial class AddArchive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string contentType = FileUpload1.PostedFile.ContentType;
            int id = Convert.ToInt32(TextBoxID.Text);
            string description = Request.Form["desc"];
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string CS = ConfigurationManager.ConnectionStrings["myconnstring"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        string query = "insert into Archives values (@Id,@Name,@Desc,@Type,@Doc)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@Id", id);
                            cmd.Parameters.AddWithValue("@Name", filename);
                            cmd.Parameters.AddWithValue("@Desc", description);
                            cmd.Parameters.AddWithValue("@Type", contentType);
                            cmd.Parameters.AddWithValue("@Doc", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }

            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Archive Added!')</script>");

        }
    }
}