using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public partial class uc_tings : System.Web.UI.UserControl
    {
        protected List<Dictionary<string, string>> tings = new List<Dictionary<string, string>>();
        protected void Page_Load(object sender, EventArgs e)
        {           
            tings = library.GetTopTings(Convert.ToInt32(ConfigurationManager.AppSettings["homeTingsNumber"]));
        }
    }
}