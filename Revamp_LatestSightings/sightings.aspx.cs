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
    public partial class sightings : System.Web.UI.Page
    {
        protected string tingId { get; set; }
        Dictionary<string, string> ting = new Dictionary<string, string>();
        protected List<Dictionary<string, string>> latestBlogs = null;
        protected string stringMonth = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (HasTingParameter())
            {
                latestBlogs = library.GetLatestCompletedArticles(4);
                GetMonthlyContributors();
                LoadTopEarningVideos();
                LoadLasteBLogs();
                loadLatestGalleries();
                loadAds();
                loadTopStories();

                tingId = Request.QueryString["id"].ToString();
                ting = library.GetTingInfo(tingId);
                SetPageMetaData();
                var tingserialized = JsonConvert.SerializeObject(ting);
                string javascriptFunction = string.Format("setTingInformation({0})", tingserialized);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", javascriptFunction, true);


            }

        }

        private void loadTopStories()
        {
            uc_top_stories topstories = (uc_top_stories)LoadControl("~/uc_top_stories.ascx");
            TopStories.Controls.Add(topstories);
        }

        private bool HasTingParameter()
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
            this.Master.desc = ting["description"];
            this.Master.artUrl = ConfigurationManager.AppSettings["siteUrl"] + "sighting/" + tingId;
            this.Master.imgUrl = ConfigurationManager.AppSettings["tingImageServiceCall"] + tingId;
            this.Master.title = ting["title"];

        }
    }
}