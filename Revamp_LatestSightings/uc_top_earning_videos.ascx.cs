using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class uc_top_earning_videos : System.Web.UI.UserControl
    {
        public List<Stat> video_stats = new List<Stat>();
        protected void Page_Load(object sender, EventArgs e)
        {

            video_stats = Stat.GetTopEarningVideos();
            CutShortTitle();
            GetOnly5Videos();
        }

        private void GetOnly5Videos()
        {
            if (video_stats.Count >= 5)
                video_stats = video_stats.GetRange(0, 5);
        }

        private void CutShortTitle()
        {
            if (video_stats != null && video_stats.Count > 0)
            {
                foreach (var video in video_stats)
                {
                    if (!String.IsNullOrEmpty(video.VideoTitle))
                        if (video.VideoTitle.Length > 40)
                        {
                            video.VideoTitle = video.VideoTitle.Substring(0, 40) + " ...";
                        }
                }
            }
        }
    }
}