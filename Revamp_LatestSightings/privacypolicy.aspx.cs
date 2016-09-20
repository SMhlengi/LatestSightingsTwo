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
    public partial class privacypolicy : System.Web.UI.Page
    {

        protected int contentCategoryId = Convert.ToInt32(ConfigurationManager.AppSettings["contentCategoryId"]);
        protected Dictionary<string, string> privacyPolicy = null;
        List<Dictionary<string, string>> contents = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            contents = new List<Dictionary<string, string>>();
            privacyPolicy = new Dictionary<string, string>();
            contents = library.GetArticlesBasedOnCategoryId(contentCategoryId, true);
            Dictionary<string, string> terms = GetprivacyPolicy();
            LoadFeaturedCategories();
            LoadLatestMonthlyContributors();
            LoadTopEarningVideos();
            LoadLatestBlogs();
        }

        private Dictionary<string, string> GetprivacyPolicy()
        {

            foreach (var content in contents)
            {
                if (content["header"].ToLower().Contains("policy"))
                {
                    privacyPolicy = content;
                    return privacyPolicy;
                }
            }
            return null;
        }

        private void LoadFeaturedCategories()
        {
            uc_FeaturedCategories f_categories = (uc_FeaturedCategories)LoadControl("~/uc_FeaturedCategories.ascx");
            cagegories.Controls.Add(f_categories);
        }

        private void LoadLatestMonthlyContributors()
        {
            uc_TopMonthlyContributors contributors = (uc_TopMonthlyContributors)LoadControl("~/uc_TopMonthlyContributors.ascx");
            monthlyTopContributors.Controls.Add(contributors);
        }

        private void LoadLatestBlogs()
        {
            uc_LatestBlogs latestBlogs = (uc_LatestBlogs)LoadControl("~/uc_LatestBlogs.ascx");
            lastBlogs.Controls.Add(latestBlogs);
        }

        private void LoadTopEarningVideos()
        {
            uc_top_earning_videos topvids = (uc_top_earning_videos)LoadControl("~/uc_top_earning_videos.ascx");
            topearningvideos.Controls.Add(topvids);

        }

    }
}