using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using LatestSightingsLibrary;
using Newtonsoft.Json;

namespace Revamp_LatestSightings
{
    public partial class tvlodgeTwo : System.Web.UI.Page
    {
        public string prizes = null;
        public string lodoid = "";
        public string lodgeName = null;
        //public List<Dictionary<string, string>> topFiveTingers;
        public List<Dictionary<string, string>> lodgeTings;
        public string json;

        protected void Page_Load(object sender, EventArgs e)
        {
            string tingImageUrlFolder = ConfigurationManager.AppSettings["tingImageServiceCall"];
            Dictionary<string, string> lodge = new Dictionary<string, string>();
            string lodgename = Request.QueryString["p"];
            lodgename = StripAwayUnderscores(lodgename);
            if (!String.IsNullOrEmpty(lodgename))
            {
                lodge = library.GetLodge(lodgename);
                if (lodge["lodgeFound"] == "1")
                {
                    processLodgePrizesAndName(lodge);
                    processLodgeLogo(lodge["logo"]);
                    //processLodgeTopFiveTingers(lodge["id"]); // not updating this yet
                    processLodgeTings(lodge);
                    json = JsonConvert.SerializeObject(lodgeTings);
                    var script = string.Format("setLodgeTingers({0}, '{1}', '{2}', '{3}')", json, tingImageUrlFolder, lodgename, lodge["id"]);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", script, true);
                    loadTingsUserControl();
                }
            }
        }

        private void loadTingsUserControl()
        {
            //uc_tvLodge_Tings tingsusercontrol = (uc_tvLodge_Tings)LoadControl("~/uc_tvLodge_Tings.ascx");
            //tings.Controls.Add(tingsusercontrol);
        }

        private string StripAwayUnderscores(string name)
        {
            return name.Replace("_", " ");
        }

        private void processLodgeLogo(string id)
        {
            lodoid = id;
        }

        private void processLodgeTings(Dictionary<string, string> lodge)
        {
            var dt = DateTime.Now;
            int counter = 0;
            string stringDate = "";
            stringDate = String.Format("{0}", Convert.ToString(dt.Year) + "-" + Convert.ToString(dt.Month) + "-" + Convert.ToString(dt.Day));
            lodgeTings = new List<Dictionary<string, string>>();
            lodgeTings = library.GetLodgeTingsByDate(lodge["id"], stringDate);
            while (lodgeTings.Count == 0)
            {
                counter -= 1;
                dt = DateTime.Now.AddDays(counter);
                stringDate = String.Format("{0}", Convert.ToString(dt.Year) + "-" + Convert.ToString(dt.Month) + "-" + Convert.ToString(dt.Day));
                lodgeTings = library.GetLodgeTingsByDate(lodge["id"], stringDate);
            }
        }

        private void processLodgeTopFiveTingers(string lodgeid)
        {
            //topFiveTingers = new List<Dictionary<string, string>>();
            //topFiveTingers = AjaxOperation.GetLodgeTopFiveTingers(lodgeid);
        }

        private void processLodgePrizesAndName(Dictionary<string, string> lodge)
        {
            prizes = lodge["prizes"];
            lodgeName = lodge["name"];
        }
    }
}