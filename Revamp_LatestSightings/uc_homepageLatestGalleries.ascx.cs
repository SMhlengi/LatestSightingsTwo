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
    public partial class uc_homepageLatestGalleries : System.Web.UI.UserControl
    {
        protected Dictionary<string, List<GalleryItem>> latestGalleries = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            latestGalleries = new Dictionary<string, List<GalleryItem>>();
            latestGalleries = AjaxOperation.GetHomePageLatestGalleries();
            var galleries = JsonConvert.SerializeObject(latestGalleries);
            var scriptFunction = String.Format("setLattestGalleries({0});", galleries);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", scriptFunction, true);
        }
    }
}