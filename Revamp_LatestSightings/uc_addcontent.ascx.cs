using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class uc_addcontent : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // videopackages
            uc_video_packages vid_packages = (uc_video_packages)LoadControl("~/uc_video_packages.ascx");
            videopackages.Controls.Add(vid_packages);
        }
    }
}