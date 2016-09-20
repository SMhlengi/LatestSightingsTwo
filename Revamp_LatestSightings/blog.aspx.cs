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
    public partial class blog : System.Web.UI.Page
    {
        protected int categoryId;
        protected int articleId;
        protected Dictionary<string, string> article = null;
        protected string blog_friendlyTitle = "";
        protected string BlogUrlTitle = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            GetParameters();
            if (HasArticleNotBeenSet())
                GetArticle();
            LoadLatestBlogs();
            LoadLatestMonthlyContributors();
            LoadTopEarningVideos();
            loadOtherRelatedArticles();
            LoadFeaturedCategories();
            SetPageMetaData();
            LoadAd();
        }

        private bool HasArticleNotBeenSet()
        {
            if (article == null)
                return true;
            return false;

        }

        private void LoadAd()
        {
            ad_300by50 ad300 = (ad_300by50)LoadControl("~/ad_300by50.ascx");
            ad300by50.Controls.Add(ad300);
        }

        private void SetPageMetaData()
        {
            this.Master.overRideMeta = true;
            this.Master.desc = article["header"];
            this.Master.title = article["header"];
            this.Master.artUrl = ConfigurationManager.AppSettings["siteUrl"] + "/blog/" + BlogUrlTitle;
            this.Master.imgUrl = ConfigurationManager.AppSettings["articleImagePath"] + article["picture"];     
        }

        private void loadOtherRelatedArticles()
        {
            uc_categoryOtherRelatedStories relatedArticles = (uc_categoryOtherRelatedStories)LoadControl("~/uc_categoryOtherRelatedStories.ascx");
            relatedArticles.categoryId = categoryId;
            otherRelatedArticles.Controls.Add(relatedArticles);
        }

        private void LoadLatestBlogs()
        {
            uc_LatestBlogs latestBlogs = (uc_LatestBlogs)LoadControl("~/uc_LatestBlogs.ascx");
            lastBlogs.Controls.Add(latestBlogs);
        }

        private void GetArticle()
        {
            article = library.GetArticle(articleId);
        }

        private void GetParameters()
        {
            if (NoFriendlyUrl())
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    articleId = Convert.ToInt32(Request.QueryString["id"]);
                }

                if (!string.IsNullOrEmpty(Request.QueryString["cat"]))
                {
                    categoryId = Convert.ToInt32(Request.QueryString["cat"]);
                }
            }
            else
            {
                string articleUrl = Request.QueryString["p"].ToString();
                if (IsThisFacebookArticleUrl(Request.QueryString["p"].ToString()))
                {
                    int indexOfQuestionMark = Request.QueryString["p"].ToString().IndexOf("?");
                    articleUrl = Request.QueryString["p"].ToString().Substring(0, indexOfQuestionMark);
                }
                article = library.GetArticle("'" + articleUrl.Replace("_", " ") + "'", true);
                blog_friendlyTitle = articleUrl.Replace("_", " ");
                BlogUrlTitle = articleUrl;
                categoryId = Convert.ToInt32(article["categoryId"]);
            }
        }

        private bool IsThisFacebookArticleUrl(String param)
        {
            if (param.ToLower().Contains("fb_action_ids"))
                return true;
            return false; 
        }

        private bool NoFriendlyUrl()
        {
            if (String.IsNullOrEmpty(Request.QueryString["p"]))
                return true;
            return false;
        }

        private void LoadLatestMonthlyContributors()
        {
            uc_TopMonthlyContributors contributors = (uc_TopMonthlyContributors)LoadControl("~/uc_TopMonthlyContributors.ascx");
            monthlyTopContributors.Controls.Add(contributors);
        }

        private void LoadFeaturedCategories()
        {
            uc_FeaturedCategories f_categories = (uc_FeaturedCategories)LoadControl("~/uc_FeaturedCategories.ascx");
            f_categories.categoryId = categoryId;
            cagegories.Controls.Add(f_categories);
        }

        private void LoadTopEarningVideos()
        {
            uc_top_earning_videos topvids = (uc_top_earning_videos)LoadControl("~/uc_top_earning_videos.ascx");
            topearningvideos.Controls.Add(topvids);

        }


    }
}