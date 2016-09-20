using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;
using System.Configuration;
using System.Text;

namespace Revamp_LatestSightings
{

    public partial class partnership : System.Web.UI.Page
    {
        protected List<GalleryItem> featuredVideos = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTopEarningVideos();
            List<GalleryItem> fVideos = new List<GalleryItem>();
            fVideos = Galleries.GetFeatured(Galleries.GalleryType.Video);
            featuredVideos = (fVideos.Count() >= 4) ? fVideos.GetRange(0, 4) : fVideos;
            //LoadTopEarningVideos();
            //LoadLasteBLogs();
            //loadAds();
            //loadTopStories();
        }

        private void loadTopStories()
        {
            //uc_top_stories topstories = (uc_top_stories)LoadControl("~/uc_top_stories.ascx");
            //TopStories.Controls.Add(topstories);
        }

        private void LoadLasteBLogs()
        {
            //uc_LatestBlogs latestBlogs = (uc_LatestBlogs)LoadControl("~/uc_LatestBlogs.ascx");
            //plc_latestBlogs.Controls.Add(latestBlogs);
        }

        private void loadAds()
        {
            //ad_300by50 ad300 = (ad_300by50)LoadControl("~/ad_300by50.ascx");
            //ad300by50.Controls.Add(ad300);

            //uc_downloadLatestApp downloadApp = (uc_downloadLatestApp)LoadControl("~/uc_downloadLatestApp.ascx");
            //downloadapp.Controls.Add(downloadApp);
        }

        private void LoadTopEarningVideos()
        {
            uc_top_earning_videos topvids = (uc_top_earning_videos)LoadControl("~/uc_top_earning_videos.ascx");
            topearningvideos.Controls.Add(topvids);

        }
    }
}