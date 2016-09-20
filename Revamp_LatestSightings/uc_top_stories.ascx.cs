using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class uc_top_stories : System.Web.UI.UserControl
    {
        protected List<GalleryItem> topFeaturedArticles = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            topFeaturedArticles = Galleries.GetFeatured(Galleries.GalleryType.Article);
        }
    }
}