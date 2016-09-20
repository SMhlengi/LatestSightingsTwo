using LatestSightingsLibrary;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class UserFinancials : System.Web.UI.Page
    {
        private string id;

        public string userId
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

        private List<LatestSightingsLibrary.Video> _videos;
        private List<LatestSightingsLibrary.Video> videos
        {
            get
            {
                if (_videos == null)
                {
                    _videos = LatestSightingsLibrary.Video.GetContributorVideos(userId);
                }

                return _videos;
            }
            set
            {
                _videos = value;
            }
        }

        public string currencyScripts = string.Empty;
        public int year = DateTime.Now.Year;
        public int month = DateTime.Now.Month;

        protected void Page_Load(object sender, EventArgs e)
        {
            FillVideos();
            SetCurrencies();
            FillStats();
        }

        private void FillStats()
        {
            Month mnth = Month.GetMonth(DateTime.Now.Year, DateTime.Now.Month);
            if (mnth == null || (mnth != null && mnth.EstimatedEarnings <= 0))
            {
                mnth = Month.GetMonth(DateTime.Now.AddMonths(-1).Year, DateTime.Now.AddMonths(-1).Month);
            }

            if (mnth != null)
            {
                year = mnth.YearNumber;
                month = mnth.MonthNumber;

                List<YouTubeVideoAnalytics> anals = LatestSightingsLibrary.Video.GetYouTubeVideoAnalyticsByContributor(year, month, userId);
                decimal totalEarnings = 0;
                long totalViews = 0;

                if (anals != null)
                {
                    foreach (YouTubeVideoAnalytics anal in anals)
                    {
                        if (anal.EstimatedEarning > 0)
                        {
                            totalEarnings += ApplyRevenueShare("", anal.Id, anal.EstimatedEarning);
                        }
                        if (anal.Views > 0)
                            totalViews += anal.Views;
                    }
                }

                ltlEarnings.Text = "$" + totalEarnings.ToString();
                ltlViews.Text = string.Format(CultureInfo.InvariantCulture, "{0:N0}", totalViews);

                List<LatestSightingsLibrary.Video> videos = LatestSightingsLibrary.Video.GetContributorVideos(userId);

                List<YouTubeVideoAnalytics> stats = LatestSightingsLibrary.Video.GetYouTubeVideoAnalyticsByContributor(year, month, userId);
                if (stats != null && videos != null)
                {
                    stats = stats.OrderByDescending(x => x.EstimatedEarning).ToList();
                    StringBuilder sb = new StringBuilder();
                    int count = 1;
                    foreach (YouTubeVideoAnalytics stat in stats)
                    {
                        LatestSightingsLibrary.Video video = videos.FirstOrDefault(x => { return x.YoutubeId == stat.Id; });
                        if (video != null)
                        {
                            sb.Append("<tr>");
                            sb.Append("<td>" + count.ToString() + "</td>");
                            sb.Append("<td>" + video.Title + "</td>");
                            sb.Append("<td>$" + ApplyRevenueShare("", stat.Id, stat.EstimatedEarning) + "</td>");
                            sb.Append("</tr>");
                            count++;
                        }
                    }
                    ltlTop10Earnings.Text = sb.ToString();

                    stats = stats.OrderByDescending(x => x.Views).ToList();
                    sb = new StringBuilder();
                    count = 1;
                    foreach (YouTubeVideoAnalytics stat in stats)
                    {
                        LatestSightingsLibrary.Video video = videos.FirstOrDefault(x => { return x.YoutubeId == stat.Id; });
                        if (video != null)
                        {
                            sb.Append("<tr>");
                            sb.Append("<td>" + count.ToString() + "</td>");
                            sb.Append("<td>" + video.Title + "</td>");
                            sb.Append("<td>" + string.Format(CultureInfo.InvariantCulture, "{0:N0}", stat.Views) + "</td>");
                            sb.Append("</tr>");
                            count++;
                        }
                    }
                    ltlTop10Views.Text = sb.ToString();
                }
            }
        }

        private void FillVideos()
        {
            List<LatestSightingsLibrary.Video> contVideos = LatestSightingsLibrary.Video.GetContributorVideos(userId);
            if (contVideos != null && contVideos.Count > 0)
            {
                tableRow.Visible = true;
                alert.Visible = false;
            }
            else
            {
                tableRow.Visible = false;
                alert.Visible = true;
            }
        }

  

        private void SetCurrencies()
        {
            List<Currency> currencies = Currency.GetCurrencies();
            if (currencies != null)
            {
                int count = 1;
                StringBuilder sb = new StringBuilder();
                foreach (Currency currency in currencies)
                {
                    currencyScripts += "{ \"data\": \"Currency" + count.ToString() + "\", orderable: false },";
                    sb.Append("<th style=\"background-color:#554337; color: #FFFFFF; border-bottom: 0px;\">" + currency.Description + "</th>" + Environment.NewLine);
                    count++;
                }
                ltlCurrencies.Text = sb.ToString();
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
    }
}