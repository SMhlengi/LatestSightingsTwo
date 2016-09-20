using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public class Video
    {
        public string Contributor { get; set; }
        public Person Person { get; set; }
        public string Id { get; set; }
        public string Title { get; set; }
        public string Alias { get; set; }
        public DateTime Recieved { get; set; }
        public DateTime IPDate { get; set; }
        public string IPDocument { get; set; }
        public string RevenueShare { get; set; }
        public string Keywords { get; set; }
        public string Region { get; set; }
        public string Notes { get; set; }
        public string Status { get; set; }
        public string videoStatus { get; set; }
        public string YoutubeId { get; set; }
        public DateTime DateUploaded { get; set; }
        public DateTime DateRemoved { get; set; }
        public string filename { get; set; }

    }
}