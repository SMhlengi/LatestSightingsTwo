using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;
using System.Data.SqlClient;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public partial class imagepreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["p"] != null)
            {
                string id = Request.QueryString["p"].ToString();
                string filename = getFileName(id);
                setImagePreview(filename);

            }
        }

        private void setImagePreview(string filename)
        {
            previewUploadedImage.Src = ConfigurationManager.AppSettings["siteUrl"].ToString() + ConfigurationManager.AppSettings["originalImageFolderPath"].ToString() + filename;
        }

        private string getFileName(string id)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            return DataLayer.getImageFileName(conn, query, data, id);
        }
    }
}