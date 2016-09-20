using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public partial class videopreview : System.Web.UI.Page
    {
        private string id;
        protected string userId
        {
            get
            {
                if (String.IsNullOrEmpty(id) && Session["userid"] != null)
                {
                    id = Session["userid"].ToString();
                }
                return id;
            }
        }

        private Boolean videoRecordFound = false;
        protected Video videoRecord;
        protected Dictionary<string, string> contributor;
        public bool downloadVideoPanel = false;
        public List<DeclineVideoStatus> declineStatuses = null;
        public string title { get; set; }
        public string filename {get;set;}

        protected void Page_Load(object sender, EventArgs e)
        {
            // /videopreview.aspx?user=c835aa60-05f9-41dd-b656-38606c282f6c&video=9cb0a1cd-348e-49bb-b671-a5bb70ec3a77
            if (DoesUserIdQueryStringExists())
            {
                Session["videoPreviewForUserId"] = null;
                Session["videoPreviewVideoId"] = null;
                Session["videoPreviewForUserId"] = Request.QueryString["user"].ToString();

                if (DoesVideoIdQueryStringExists())
                {
                    Session["videoPreviewVideoId"] = Request.QueryString["video"].ToString();
                }

            }

            if (String.IsNullOrEmpty(userId))
                HttpContext.Current.Response.Redirect("/login");
            else
            {
                SqlConnection conn = new SqlConnection();
                SqlCommand query = new SqlCommand();
                SqlDataReader data = null;
                videoRecord = new Video();
                contributor = new Dictionary<string, string>();

                if (DoesVideoIdQueryStringExists())
                    videoRecord = DataLayer.GetVideoRecord(conn, query, Session["videoPreviewForUserId"].ToString(), data, Session["videoPreviewVideoId"].ToString());
                else
                    videoRecord = DataLayer.GetVideoRecord(conn, query, Session["videoPreviewForUserId"].ToString(), data);

                contributor = DataLayer.GetUserProfile(Session["videoPreviewForUserId"].ToString(), conn, query, data);
                Session["videoPreviewForUserId"] = null;
                Session["videoPreviewVideoId"] = null;
                if (videoRecord != null)
                {
                    title = videoRecord.Title;
                    filename = videoRecord.filename;

                    //if (!IsMp4(videoRecord))
                    //{
                    //}

                    downloadVideoPanel = true;
                    Hiddenfilename.Value = videoRecord.filename;

                    declineStatuses = new List<DeclineVideoStatus>();
                    declineStatuses = DataLayer.GetDeclineStatuses(conn, query, data, declineStatuses);
                }
            }
        }

        private bool DoesVideoIdQueryStringExists()
        {
            if (String.IsNullOrEmpty(Request.QueryString["video"]))
                return false;
            else
                return true;
        }

        private bool IsMp4(Video videoRecord)
        {
            string sExtension = System.IO.Path.GetExtension(videoRecord.filename);
            if (!string.IsNullOrEmpty(sExtension))
            {
                sExtension = sExtension.Replace(".", "");
                sExtension = sExtension.ToLower();

                if (sExtension == "mp4")
                    return true;
            }
            return false;
        }

        private bool DoesUserIdQueryStringExists()
        {
            if (String.IsNullOrEmpty(Request.QueryString["user"]))
                return false;
            else
                return true;
        }

        protected void downloadVideo_Click(object sender, EventArgs e)
        {
            // the file name to get
            string fileName = Hiddenfilename.Value;
            // get the file bytes to download to the browser
            byte[] fileBytes = System.IO.File.ReadAllBytes(ConfigurationManager.AppSettings["savePath"] + fileName);
            // NOTE: You could also read the file bytes from a database as well.

            // download this file to the browser
            utils.StreamFileToBrowser(fileName, fileBytes);
        }
    }
}