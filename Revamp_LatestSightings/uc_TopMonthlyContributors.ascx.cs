using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class uc_TopMonthlyContributors : System.Web.UI.UserControl
    {
        protected List<Stat> contributorsViews = null;
        protected string stringMonth = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            var dt = DateTime.Now;
            contributorsViews = Stat.GetContributorViews(dt.Year, dt.Month, 10);
            int counter = 0;
            while (contributorsViews == null)
            {
                counter -= 1;                
                dt = dt.AddMonths(counter);
                contributorsViews = Stat.GetContributorViews(dt.Year, dt.Month, 10);
            }
            stringMonth = utils.FullyQualifiedMonthName(dt.Month);
        }
    }
}