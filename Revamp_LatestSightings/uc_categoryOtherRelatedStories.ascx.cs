using LatestSightingsLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class uc_categoryOtherRelatedStories : System.Web.UI.UserControl
    {
        public List<Dictionary<string, string>> cateogryArticles { get; set; }
        public int categoryId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadOtherRelatedArticles();
        }

        private void LoadOtherRelatedArticles()
        {
            cateogryArticles = new List<Dictionary<string, string>>();

            cateogryArticles = library.GetArticlesBasedOnCategoryId(Convert.ToInt32(categoryId));
        }

        
    }
}