using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;
using Newtonsoft.Json;

namespace Revamp_LatestSightings
{
    public partial class htings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadHomePageTings();
        }

        private void loadHomePageTings()
        {
            uc_tings homepageTings = (uc_tings)LoadControl("~/uc_tings.ascx");
            hometings.Controls.Add(homepageTings);
        }
    }
}