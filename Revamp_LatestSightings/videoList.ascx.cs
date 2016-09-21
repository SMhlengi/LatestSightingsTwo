using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Revamp_LatestSightings
{
    public partial class videoList : System.Web.UI.UserControl
    {
        public string userId { get; set; }
        public List<VideoSetting> userVideos;

        protected void Page_Load(object sender, EventArgs e)
        {
            userVideos = new List<VideoSetting>();
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            userVideos = DataLayer.GetUserVideos(conn, query, data, userVideos, userId);
            uc_video_packages v_packages = (uc_video_packages)LoadControl("~/uc_video_packages.ascx");
            vpreview.Controls.Add(v_packages);
        }
    }
}