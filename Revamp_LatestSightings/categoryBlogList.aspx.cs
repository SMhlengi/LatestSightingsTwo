using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class categoryBlogList : System.Web.UI.Page
    {
        protected List<GalleryItem> featuredCategory = null;
        protected List<Dictionary<string, string>> cateogryArticles = null;
        protected int categoryId = 0;

        //private string categoryId;
        //protected string CategoryId
        //{
        //    get
        //    {
        //        if (String.IsNullOrEmpty(categoryId) && Page.RouteData.Values["id"].ToString() != null)
        //            categoryId = Page.RouteData.Values["id"].ToString();

        //        return categoryId;
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HasCategoryUrl())
            {
                string categoryUrl = Request.QueryString["p"].ToString();
                categoryId = Convert.ToInt32(library.GetCategoryUrlId(categoryUrl));
                featuredCategory = new List<GalleryItem>();
                featuredCategory = Galleries.GetFeatured(Galleries.GalleryType.Category);
                LoadFeaturedCategoryArticles();
                LoadFeaturedCategories();
                loadLatestGalleries();
                LoadLatestMonthlyContributors();
                LoadTopEarningVideos();
                LoadAd();
            }

        }

        private bool HasCategoryUrl()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["p"].ToString()))
                return true;
            return false;
        }

        private void LoadAd()
        {
            ad_300by50 ad300 = (ad_300by50)LoadControl("~/ad_300by50.ascx");
            ad300by50.Controls.Add(ad300);
        }

        private void LoadFeaturedCategories()
        {
            uc_FeaturedCategories f_categories = (uc_FeaturedCategories)LoadControl("~/uc_FeaturedCategories.ascx");
            f_categories.featuredCategory = featuredCategory;
            f_categories.categoryId = categoryId;
            cagegories.Controls.Add(f_categories);
        }

        private void LoadFeaturedCategoryArticles()
        {
            cateogryArticles = new List<Dictionary<string, string>>();
            List<Dictionary<string, string>> c_articles = new List<Dictionary<string, string>>();
            
            //if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            //{
            //    categoryId = Convert.ToInt32(Request.QueryString["id"]);
            //}

            c_articles = library.GetArticlesBasedOnCategoryId(Convert.ToInt32(categoryId), true);
            foreach (var article in c_articles)
            {
                if (article["header"].Length > 65)
                    article["header"] = article["header"].Substring(0, 60) + " ...";
                if (!String.IsNullOrEmpty(article["urlName"]))
                    article["urlName"] = article["urlName"].Replace(" ", "_");
                cateogryArticles.Add(article);
            }
        }

        private void loadLatestGalleries()
        {
            uc_latestGalleris l_galleries = (uc_latestGalleris)LoadControl("~/uc_latestGalleris.ascx");
            latestGalleries.Controls.Add(l_galleries);
        }

        private void LoadLatestMonthlyContributors()
        {
            uc_TopMonthlyContributors contributors = (uc_TopMonthlyContributors)LoadControl("~/uc_TopMonthlyContributors.ascx");
            monthlyTopContributors.Controls.Add(contributors);
        }

        private void LoadTopEarningVideos()
        {
            uc_top_earning_videos topvids = (uc_top_earning_videos)LoadControl("~/uc_top_earning_videos.ascx");
            topearningvideos.Controls.Add(topvids);

        }
    }
}