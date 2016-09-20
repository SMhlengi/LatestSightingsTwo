using LatestSightingsLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace Revamp_LatestSightings
{
    public partial class uc_homeLatestBlogs : System.Web.UI.UserControl
    {
        protected List<Dictionary<string, string>> latestBlogs = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            latestBlogs = library.GetLatestCompletedArticles(4);
            var blogs = JsonConvert.SerializeObject(latestBlogs);
            var blogsScriptFunction = String.Format("constructLatestBlogs({0})", blogs);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", blogsScriptFunction, true);

        }
    }
}