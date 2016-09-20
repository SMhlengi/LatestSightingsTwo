using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class uc_imageSearchResults : System.Web.UI.UserControl
    {
        public List<Dictionary<string, string>> imageResults = new List<Dictionary<string, string>>();
        public string searchItem { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            imageResults = library.SearchAllImages(searchItem);
        }
    }
}