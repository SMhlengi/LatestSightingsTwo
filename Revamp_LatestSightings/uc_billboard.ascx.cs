using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;
using Newtonsoft.Json;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public partial class uc_billboard : System.Web.UI.UserControl
    {
        protected List<GalleryItem> topFeaturedArticles = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            topFeaturedArticles = Galleries.GetFeatured(Galleries.GalleryType.Article);
            CleanUpArticleForBillboard();
            var billboardJson = JsonConvert.SerializeObject(topFeaturedArticles);
            var functionScriptCall = string.Format("constructBillboard({0});", billboardJson);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", functionScriptCall, true);
        }

        private void CleanUpArticleForBillboard()
        {
            foreach (var article in topFeaturedArticles)
            {
                article.ArticleBody = article.ArticleBody.Remove(0, 2);
                int startIndex = article.ArticleBody.IndexOf('>');
                int endIndex = article.ArticleBody.IndexOf('<');
                if (endIndex > 101)
                    endIndex = 101;
                int substract = endIndex - startIndex;
                if (substract > 0)
                {
                    article.ArticleBody = article.ArticleBody.Substring(startIndex + 1, substract - 1);
                    article.ArticleBody += " [...]";
                    article.Url = ConfigurationManager.AppSettings["articleImagePath"] + article.Url;
                }
                else
                {
                    article.ArticleBody = " ";
                    article.Url = ConfigurationManager.AppSettings["articleImagePath"] + article.Url;
                }


            }
        }
    }
}