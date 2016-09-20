using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public partial class uc_SiteHeader : System.Web.UI.UserControl
    {
        public string username { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["userid"] = null;
            Response.Redirect("/");
        }
    }
}