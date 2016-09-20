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
    public partial class parksightings : System.Web.UI.Page
    {
        public List<Dictionary<string, string>> parkTings = new List<Dictionary<string, string>>();
        public Guid parkid;
        protected List<Dictionary<string, string>> latestBlogs = null;
        protected string stringMonth = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HasParkId())
            {
                latestBlogs = library.GetLatestCompletedArticles(4);
                GetMonthlyContributors();
                LoadTopEarningVideos();
                LoadLasteBLogs();
                loadLatestGalleries();
                loadAds();
                loadTopStories();
                parkid = new Guid(Request.QueryString["id"].ToString());
                parkTings = library.GetParkTings(parkid);
                SetPageMetaData();
                var tings = JsonConvert.SerializeObject(parkTings);
                string functionCall = String.Format("InitializeParkTings({0}, '{1}');", tings, parkid);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", functionCall, true);

            }
        }

        private void loadTopStories()
        {
            uc_top_stories topstories = (uc_top_stories)LoadControl("~/uc_top_stories.ascx");
            TopStories.Controls.Add(topstories);
        }

        private bool HasParkId()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                return true;
            return false;
        }

        private void loadAds()
        {
            ad_300by50 ad300 = (ad_300by50)LoadControl("~/ad_300by50.ascx");
            ad300by50.Controls.Add(ad300);

            uc_downloadLatestApp downloadApp = (uc_downloadLatestApp)LoadControl("~/uc_downloadLatestApp.ascx");
            downloadapp.Controls.Add(downloadApp);
        }

        private void GetMonthlyContributors()
        {
            stringMonth = utils.FullyQualifiedMonthName(DateTime.Now.Month);
            uc_TopMonthlyContributors Contributors = (uc_TopMonthlyContributors)LoadControl("~/uc_TopMonthlyContributors.ascx");
            topTenContributors.Controls.Add(Contributors);
        }

        private void LoadLasteBLogs()
        {
            uc_LatestBlogs latestBlogs = (uc_LatestBlogs)LoadControl("~/uc_LatestBlogs.ascx");
            plc_latestBlogs.Controls.Add(latestBlogs);
        }

        private void loadLatestGalleries()
        {
            uc_latestGalleris l_galleries = (uc_latestGalleris)LoadControl("~/uc_latestGalleris.ascx");
            latestGalleries.Controls.Add(l_galleries);
        }

        private void LoadTopEarningVideos()
        {
            uc_top_earning_videos topvids = (uc_top_earning_videos)LoadControl("~/uc_top_earning_videos.ascx");
            topearningvideos.Controls.Add(topvids);

        }

        private void SetPageMetaData()
        {
            this.Master.overRideMeta = true;
            this.Master.desc = parkTings[0]["description"];
            this.Master.artUrl = ConfigurationManager.AppSettings["siteUrl"] + "park/" + parkid + "/ting/" + parkTings[0]["id"];
            this.Master.imgUrl = ConfigurationManager.AppSettings["tingImageServiceCall"] + parkTings[0]["id"];
            this.Master.title = parkTings[0]["title"];

        }

    }
}