using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Revamp_LatestSightings
{
    public partial class resetpassword : System.Web.UI.Page
    {
        private string emailaddress { get; set; }
        private string userID { get; set; }
        protected Dictionary<string, string> status = new Dictionary<string, string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(HttpContext.Current.Request.QueryString["email"]))
            {
                RedirectToHomeUrl();
            }
            else if (!String.IsNullOrEmpty(HttpContext.Current.Request.QueryString["id"]))
            {
                SqlConnection conn = new SqlConnection();
                SqlCommand query = new SqlCommand();
                SqlDataReader data = null;

                userID = GetUserID();

                status = DataLayer.GetUserProfile(userID, conn, query, data);
                if (status["recordExist"] == "false")
                    RedirectToHomeUrl();
            }
        }

        private void RedirectToHomeUrl()
        {
            HttpContext.Current.Response.Redirect("/");
        }

        private string GetEmailAddress()
        {
            return HttpContext.Current.Request.QueryString["email"];
        }

        private string GetUserID()
        {
            return HttpContext.Current.Request.QueryString["id"];
        }
    }
}