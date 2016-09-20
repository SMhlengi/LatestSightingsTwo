using LatestSightingsLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;

namespace Revamp_LatestSightings
{
    public partial class _default : System.Web.UI.Page
    {
        protected List<GalleryItem> topFeaturedArticles = null;
        protected List<GalleryItem> featuredVideos = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //topFeaturedArticles = Galleries.GetFeatured(Galleries.GalleryType.Article);
            featuredVideos = Galleries.GetFeatured(Galleries.GalleryType.Video);
            //CleanUpArticleForBillboard();
            LoadLatestMonthlyContributors();
            LoadTopEarningVideos();
            LoadLasteBLogs();
            loadLatestGalleries();
            buildYouTubeVideosArray(featuredVideos);
            loadAds();
            loadBB();
            loadTings();
            
        }

        private void loadTings()
        {
            uc_homepageTings tings = (uc_homepageTings)LoadControl("~/uc_homepageTings.ascx");
            tings_homepage.Controls.Add(tings);
        }

        private void loadBB()
        {
            uc_billboard bb = (uc_billboard)LoadControl("~/uc_billboard.ascx");
            BB_placeholder.Controls.Add(bb);
        }

        private void loadAds()
        {
            ad_300by50 ad300 = (ad_300by50)LoadControl("~/ad_300by50.ascx");
            ad300by50.Controls.Add(ad300);

            uc_downloadLatestApp downloadApp = (uc_downloadLatestApp)LoadControl("~/uc_downloadLatestApp.ascx");
            downloadapp.Controls.Add(downloadApp);
        }

        private void buildYouTubeVideosArray(List<GalleryItem> featuredVideos)
        {
            if (featuredVideos != null && featuredVideos.Count > 0)
            {
                List<string> youtubeArray = new List<string>();
                StringBuilder sb = new StringBuilder();
                sb.Append("<script>");
                sb.Append("var youtubeArray = new Array;");
                int counter = 0;
                foreach (GalleryItem item in featuredVideos)
                {
                    counter += 1;
                    if (counter <= 5)
                        sb.Append("youtubeArray.push('" + item.YouTubeId + "');");
                }
                sb.Append("</script>");

                ClientScript.RegisterStartupScript(this.GetType(), "buildingYouTubeArray", sb.ToString());
            }
        }

        private void loadLatestGalleries()
        {
            uc_homepageLatestGalleries l_galleries = (uc_homepageLatestGalleries)LoadControl("~/uc_homepageLatestGalleries.ascx");
            latestGalleries.Controls.Add(l_galleries);
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
                article.ArticleBody = article.ArticleBody.Substring(startIndex + 1, substract - 1);
                article.ArticleBody += " [...]";
            }
        }

        private void LoadLatestMonthlyContributors()
        {
            uc_TopMonthlyContributors contributors = (uc_TopMonthlyContributors)LoadControl("~/uc_TopMonthlyContributors.ascx");
            monthlyTopContributors.Controls.Add(contributors);
        }

        private void LoadLasteBLogs()
        {
            uc_homeLatestBlogs latestBlogs = (uc_homeLatestBlogs)LoadControl("~/uc_homeLatestBlogs.ascx");
            plc_latestBlogs.Controls.Add(latestBlogs);
        }

        private void LoadTopEarningVideos()
        {
            uc_top_earning_videos topvids = (uc_top_earning_videos)LoadControl("~/uc_top_earning_videos.ascx");
            topearningvideos.Controls.Add(topvids);

        }
    }
}