using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class resumableFileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //termsAndConditions uc_terms = (termsAndConditions)LoadControl("~/termsAndConditions.ascx");
            //termsandCs.Controls.Add(uc_terms);
            uc_resumableFileUpload uc_rfu = (uc_resumableFileUpload)LoadControl("~/uc_resumableFileUpload.ascx");
            fileup_resumable.Controls.Add(uc_rfu);

        }
    }
}