using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class financialsTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            uc_viewFinancials yourmoney = (uc_viewFinancials)LoadControl("~/uc_viewFinancials.ascx");
            fin.Controls.Add(yourmoney);
        }
    }
}