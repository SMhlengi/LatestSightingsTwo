using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class imageModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            uc_StyleSheets styles = (uc_StyleSheets)LoadControl("~/uc_StyleSheets.ascx");
            stylesheets.Controls.Add(styles);
            uc_JavaScripts scripts = (uc_JavaScripts)LoadControl("~/uc_JavaScripts.ascx");
            javascriptFiles.Controls.Add(scripts);
        }
    }
}