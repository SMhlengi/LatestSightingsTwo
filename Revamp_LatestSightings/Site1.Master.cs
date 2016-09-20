using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public bool ViewAddVideo = false;
        public bool ViewAddImage = false;
        public bool overRideMeta = false;
        public string desc { get; set; }
        public string artUrl { get; set; }
        public string imgUrl { get; set; }
        public string title { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("holidays"))
                Response.Redirect("http://latestbookings.com/vacations");

            uc_SiteHeader siteHeader = (uc_SiteHeader)LoadControl("~/uc_SiteHeader.ascx");
            if (Session["username"] != null)
                siteHeader.username = Session["username"].ToString();
            else
                siteHeader.username = "";

            headerPlaceHonder.Controls.Add(siteHeader);

            if (overRideMeta)
            {
                title_m.Attributes.Add("content", title);
                description.Attributes.Add("content", desc);
                articleUrl.Attributes.Add("content", artUrl);
                image.Attributes.Add("content", imgUrl);
            }
        }
    }
}