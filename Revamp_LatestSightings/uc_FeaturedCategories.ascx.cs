using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class uc_FeaturedCategories : System.Web.UI.UserControl
    {
        public List<GalleryItem> featuredCategory = null;
        public int categoryId = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (featuredCategory == null)
                featuredCategory = Galleries.GetFeatured(Galleries.GalleryType.Category);
        }
    }
}