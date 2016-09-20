using LatestSightingsLibrary;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public partial class ting : System.Web.UI.Page
    {
        public string tingId{get;set;}
        public Guid parkId;
        public Dictionary<string, string> TingInfo = new Dictionary<string, string>();
        public List<Dictionary<string, string>> parkTings = new List<Dictionary<string, string>>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HasParkIdAndTingId())
            {
                tingId = Request.QueryString["t"].ToString();
                parkId = new Guid(Request.QueryString["p"].ToString());
                parkTings = library.GetParkTings(parkId, 25);
                //TingInfo = library.GetTingInfo(tingId);
                TingInfo = GetTingInformation(parkTings, tingId);
                PopulateNextAndPreviosTings();
                SetPageMetaData();
                var tingserialized = JsonConvert.SerializeObject(TingInfo);
                string javascriptFunction = string.Format("setTingInformation({0})", tingserialized);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", javascriptFunction, true);


            }
        }

        private void PopulateNextAndPreviosTings()
        {
            int indexOfTingRecord = Convert.ToInt32(TingInfo["indexOfTingRecord"]);
            PopulateNextTing(indexOfTingRecord);
            PopulatePreviousTing(indexOfTingRecord);
        }

        private void PopulatePreviousTing(int indexOfTingRecord)
        {
            int parkTingsLength = parkTings.Count;
            if ((indexOfTingRecord - 1) != -1)
                indexOfTingRecord -= 1;
            else
                indexOfTingRecord = parkTingsLength - 1;

            TingInfo.Add("PreviousTingId", parkTings[indexOfTingRecord]["id"]);

        }

        private void PopulateNextTing(int indexOfTingRecord)
        {
            int parkTingsLength = parkTings.Count;
            if ((indexOfTingRecord + 1) != parkTingsLength)
                indexOfTingRecord += 1;
            else
                indexOfTingRecord = 0;

            TingInfo.Add("NextTingId", parkTings[indexOfTingRecord]["id"]);
        }

        private Dictionary<string, string> GetTingInformation(List<Dictionary<string, string>> parkTings, string tingId)
        {
            Dictionary<string, string> tingInformation = null;
            for (int i = 0; i < parkTings.Count; i++)
            {
                if (tingId == parkTings[i]["id"])
                {
                    tingInformation = new Dictionary<string, string>();
                    tingInformation.Add("time", parkTings[i]["time"].ToString());
                    tingInformation.Add("title", parkTings[i]["title"].ToString());
                    tingInformation.Add("visibility", parkTings[i]["visibility"].ToString());
                    tingInformation.Add("traffic", parkTings[i]["traffic"].ToString());
                    tingInformation.Add("location", parkTings[i]["location"].ToString());
                    tingInformation.Add("description", parkTings[i]["description"].ToString());
                    tingInformation.Add("longitude", parkTings[i]["longitude"].ToString());
                    tingInformation.Add("latitude", parkTings[i]["latitude"].ToString());
                    tingInformation.Add("animalid", parkTings[i]["animalid"].ToString());
                    tingInformation.Add("tingUser", library.GetTingerUserName(parkTings[i]["userid"].ToString()));
                    tingInformation.Add("tingid", parkTings[i]["id"].ToString());
                    tingInformation.Add("indexOfTingRecord", i.ToString());
                    tingInformation.Add("parkid", parkTings[i]["parkid"].ToString());
                    break;
                }
            }
            return tingInformation;
        }

        private bool HasParkIdAndTingId()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["p"]) && !(String.IsNullOrEmpty(Request.QueryString["t"])))
                return true;
            return false;
        }

        private bool HasTingId()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                return true;
            return false;
        }

        private void SetPageMetaData()
        {
            this.Master.overRideMeta = true;
            this.Master.desc = TingInfo["description"];
            this.Master.artUrl = ConfigurationManager.AppSettings["siteUrl"] + "park/" + parkId + "/ting/" + tingId;
            this.Master.imgUrl = ConfigurationManager.AppSettings["tingImageServiceCall"] + TingInfo["tingid"];
            this.Master.title = TingInfo["title"];

        }
    }
}