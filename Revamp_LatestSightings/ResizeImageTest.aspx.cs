using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetHelpers.UltimateImageResizer;
using System.IO;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public partial class ResizeImageTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void UploadImage_Click(object sender, EventArgs e)
        {
            try
            {
                using (ImageResizer resizer = new ImageResizer(fileUpload.FileContent))
                {
                    // Make sure any images which are sideways are turned the right way around
                    resizer.RotateIfNeeded();

                    // Save it to disk as a large JPG, in its own special directory
                    resizer.Mode = ResizeMode.KeepOriginalRatio;
                    resizer.Resize(650, 650);
                    resizer.SaveToDisk(OutputImageFormat.Jpeg, ConfigurationManager.AppSettings["650by650"] + "musalarge");
                    

                    // Also save a thumbnail version
                    resizer.Mode = ResizeMode.KeepOriginalRatioByCropping;
                    resizer.Resize(80, 80);
                    resizer.SaveToDisk(OutputImageFormat.Jpeg, ConfigurationManager.AppSettings["80by80"] + "musasmall");
                   
                }
                //errorLabel.Visible = false;
            }
            catch (Exception ex)
            {
                //errorLabel.Visible = true;
                //errorLabel.Text = "Could not upload image: " + ex.Message;
            }
        }

    }
}