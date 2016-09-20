using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Revamp_LatestSightings
{
    public partial class completeProfile : System.Web.UI.UserControl
    {

        public string username { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public string cellnumber { get; set; }
        public string telephone { get; set; }
        public string othercontact { get; set; }
        public string skype { get; set; }
        public string twitter { get; set; }
        public string facebook { get; set; }
        public string address { get; set; }
        public string bankdetails { get; set; }
        public string paypaldetails { get; set; }
        public string accounttype { get; set; }
        public string accountnumber { get; set; }
        public string branchname { get; set; }
        public string branchcode { get; set; }

        public Boolean IsVisible = true;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}