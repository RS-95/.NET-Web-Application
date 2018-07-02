using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

namespace CompanyPortal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //private bool AuthenticateUser(string username, string password)
        //{
        //    // ConfigurationManager class is in System.Configuration namespace
        //    string CS = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=Example;Integrated Security=True";
        //    // SqlConnection is in System.Data.SqlClient namespace
        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
        //        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        //        // SqlParameter is in System.Data namespace
        //        SqlParameter paramUsername = new SqlParameter("@UserName", username);
        //        SqlParameter paramPassword = new SqlParameter("@Password", password);

        //        cmd.Parameters.Add(paramUsername);
        //        cmd.Parameters.Add(paramPassword);

        //        con.Open();
        //        int ReturnCode = (int)cmd.ExecuteScalar();
        //        return ReturnCode == 1;
        //    }
        //}



        protected void btnLogin_Click(object sender, EventArgs e)
        {

            FormsAuthentication.Initialize();

            string CS = ConfigurationManager.ConnectionStrings["myconnstring"].ConnectionString;
            SqlConnection conn = new SqlConnection(CS);
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT roles FROM Users WHERE Username=@username AND Password=@password";

            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {

                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                   1, // Ticket version
                   txtUsername.Text, // Username associated with ticket
                   DateTime.Now, // Date/time issued
                   DateTime.Now.AddMinutes(30), // Date/time to expire
                   true, // "true" for a persistent user cookie
                   reader.GetString(0), // User-data, in this case the roles
                   FormsAuthentication.FormsCookiePath);// Path cookie valid for

                // Encrypt the cookie using the machine key for secure transport
                string hash = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(
                   FormsAuthentication.FormsCookieName, // Name of auth cookie
                   hash); // Hashed ticket

                // Set the cookie's expiration time to the tickets expiration time
                if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

                // Add the cookie to the list for outgoing response
                Response.Cookies.Add(cookie);

                // Redirect to requested URL, or homepage if no previous page requested
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (returnUrl == null) returnUrl = "/Home.aspx";

                Response.Redirect(returnUrl);
            }
            else
            {
                lblMessage.Text = "Username / password incorrect. Please try again.";
                dvMessage.Visible = true;
                lblMessage.Visible = true;
            }

            reader.Close();
            conn.Close();


        }
    }
}