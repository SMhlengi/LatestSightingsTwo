using LatestSightingsLibrary;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class VideoItemData : System.Web.UI.Page
    {
        private int draw = 1;
        private int index = 0;
        private int pageSize = 10;
        private int orderColumn = -1;
        private string orderColumnName = string.Empty;
        private string orderDirection = "asc";
        private string searchValue = string.Empty;
        private string videoId = string.Empty;
        private string youtubeId = string.Empty;
        private string contributor = "";

        private List<LatestSightingsLibrary.Video> _videos;
        private List<LatestSightingsLibrary.Video> videos
        {
            get
            {
                if (_videos == null)
                {
                    _videos = LatestSightingsLibrary.Video.GetContributorVideos(contributor);
                }

                return _videos;
            }
            set
            {
                _videos = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Set the page content type to json
            Response.ContentType = "application/json";

            // Set the data parameters passed in the query string
            SetParameters();

            // Get the list of videos and convert to the video data item format
            VideoDataItems data = new VideoDataItems();
            List<VideoItemDataItem> dataItems = GetDataItems();

            int totalRecords = dataItems.Count;
            int totalFilteredRecords = dataItems.Count;

            if (dataItems == null)
                dataItems = new List<VideoItemDataItem>();

            // Finish and serialize the json
            data.draw = draw;
            data.recordsTotal = totalRecords;
            data.recordsFiltered = totalFilteredRecords;
            data.data = dataItems;
            JavaScriptSerializer jss = new JavaScriptSerializer();

            // Output and end
            string output = jss.Serialize(data);
            Response.Write(output);
            Response.Flush();
            Response.End();
        }

        private List<VideoItemDataItem> GetDataItems()
        {
            List<VideoItemDataItem> data = new List<VideoItemDataItem>();

            List<ThirdPartyPayment> thirdPayments = ThirdPartyPayment.GetThirdPartyPayments(videoId);
            List<YouTubeVideoAnalytics> analytics = LatestSightingsLibrary.Video.GetYouTubeVideoAnalytics(youtubeId);

            if (analytics != null && analytics.Count > 0)
            {
                analytics = analytics.OrderByDescending(x => x.Year).ThenByDescending(x => x.Month).ToList();
                foreach (YouTubeVideoAnalytics analytic in analytics)
                {
                    VideoItemDataItem item = new VideoItemDataItem();
                    item.Year = analytic.Year;
                    item.Month = analytic.Month;
                    item.ItemMonth = analytic.Year.ToString() + " " + CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(analytic.Month);
                    item.YouTubeEarnings = analytic.Earning > 0 ? "R" + RoundtoTwo(analytic.Earning).ToString() : "$" + ApplyRevenueShare(videoId, "", analytic.EstimatedEarning).ToString();
                    item.Views = analytic.Views;
                    UpdateThirdPartyPayments(ref item, thirdPayments);

                    data.Add(item);
                }
            }

            return data;
        }

        private void UpdateThirdPartyPayments(ref VideoItemDataItem item, List<ThirdPartyPayment> thirdPayments)
        {
            int year = item.Year;
            int month = item.Month;

            item.Currency1 = 0;
            item.Currency2 = 0;
            item.Currency3 = 0;
            item.Currency4 = 0;
            item.Currency5 = 0;
            item.Currency6 = 0;
            item.Currency7 = 0;
            item.Currency8 = 0;
            item.Currency9 = 0;
            item.Currency10 = 0;

            if (thirdPayments != null)
            {
                List<ThirdPartyPayment> newthirdPayments = thirdPayments.FindAll(x => { return x.Year == year && x.Month == month; });

                if (newthirdPayments != null && newthirdPayments.Count > 0)
                {
                    foreach (ThirdPartyPayment paid in newthirdPayments)
                    {
                        item.GetType().GetProperty("Currency" + paid.Currency).SetValue(item, Math.Round(paid.Payment, 2, MidpointRounding.AwayFromZero), null);
                    }
                }
            }
        }

        private decimal RoundtoTwo(decimal value)
        {
            return decimal.Round(value, 2, MidpointRounding.AwayFromZero);
        }

        private decimal ApplyRevenueShare(string videoId, string youtubeId, decimal value)
        {
            decimal newValue = 0;
            string revenueShare = string.Empty;
            if (videos != null && videos.Count > 0)
            {
                LatestSightingsLibrary.Video vid = null;
                if (!String.IsNullOrEmpty(youtubeId))
                {
                    vid = videos.FirstOrDefault(x => { return x.YoutubeId == youtubeId; });
                }
                else
                {
                    vid = videos.FirstOrDefault(x => { return x.Id == videoId; });
                }
                if (vid != null)
                {
                    newValue = LatestSightingsLibrary.Financial.ApplyRevenueShare(value, vid.RevenueShare);
                    newValue = RoundtoTwo(newValue);
                }
            }

            return newValue;
        }

        private void SetParameters()
        {
            string ad = HttpUtility.UrlDecode(Request.QueryString.ToString());
            if (!String.IsNullOrEmpty(Request.QueryString["draw"]))
                draw = Convert.ToInt32(Request.QueryString["draw"]);
            if (!String.IsNullOrEmpty(Request.QueryString["start"]))
                index = Convert.ToInt32(Request.QueryString["start"]);
            if (!String.IsNullOrEmpty(Request.QueryString["length"]))
                pageSize = Convert.ToInt32(Request.QueryString["length"]);
            if (!String.IsNullOrEmpty(Request.QueryString["search[value]"]))
                searchValue = Request.QueryString["search[value]"].ToString().ToLower();
            if (!String.IsNullOrEmpty(Request.QueryString["order[0][column]"]))
                orderColumn = Convert.ToInt32(Request.QueryString["order[0][column]"]);
            if (!String.IsNullOrEmpty(Request.QueryString["order[0][dir]"]))
                orderDirection = Request.QueryString["order[0][dir]"].ToString().ToLower();
            if (!String.IsNullOrEmpty(Request.QueryString["videoId"]))
                videoId = Request.QueryString["videoId"].ToString().ToLower();
            if (!String.IsNullOrEmpty(Request.QueryString["youtubeId"]))
                youtubeId = Request.QueryString["youtubeId"].ToString().ToLower();
            if (!String.IsNullOrEmpty(Request.QueryString["contributorId"]))
                contributor = Request.QueryString["contributorId"].ToString().ToLower();

            if (orderColumn > -1 && !String.IsNullOrEmpty(Request.QueryString["columns[" + orderColumn + "][data]"]))
            {
                orderColumnName = Request.QueryString["columns[" + (orderColumn) + "][data]"].ToString();
            }
        }
    }

    [Serializable]
    public class VideoDataItems
    {
        public int draw { get; set; }
        public int recordsTotal { get; set; }
        public int recordsFiltered { get; set; }
        public List<VideoItemDataItem> data { get; set; }
    }

    [Serializable]
    public class VideoItemDataItem
    {
        public string ItemMonth { get; set; }
        public string YouTubeEarnings { get; set; }
        public decimal Currency1 { get; set; }
        public decimal Currency2 { get; set; }
        public decimal Currency3 { get; set; }
        public decimal Currency4 { get; set; }
        public decimal Currency5 { get; set; }
        public decimal Currency6 { get; set; }
        public decimal Currency7 { get; set; }
        public decimal Currency8 { get; set; }
        public decimal Currency9 { get; set; }
        public decimal Currency10 { get; set; }
        public long Views { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }
    }
}