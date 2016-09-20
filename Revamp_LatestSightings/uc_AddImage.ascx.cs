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
    public partial class uc_AddImage : System.Web.UI.UserControl
    {
        public bool addImageDetails = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadImage_Click(object sender, EventArgs e)
        {            
            if (ImageFileUpload.HasFile)
            {
                string filename = "";
                // saving the original image
                try
                {
                    filename = Path.GetFileName(ImageFileUpload.FileName);
                    ImageFileUpload.SaveAs(ConfigurationManager.AppSettings["originalImage"].ToString() + filename);
                    Session["Imagefilename"] = null;
                    Session["Imagefilename"] = filename;
                }
                catch (Exception ex)
                {
                    // log exception
                }
                // end of saving the original image

                try
                {
                    using (ImageResizer resizer = new ImageResizer(ConfigurationManager.AppSettings["originalImage"].ToString() + filename))
                    {
                        // Make sure any images which are sideways are turned the right way around
                        resizer.RotateIfNeeded();

                        // Save it to disk as a large JPG, in its own special directory
                        resizer.Mode = ResizeMode.KeepOriginalRatioByCropping;
                        resizer.Resize(650, 650);
                        resizer.SaveToDisk(OutputImageFormat.Jpeg, ConfigurationManager.AppSettings["650by650"] + filename);


                        // Also save a thumbnail version
                        resizer.Mode = ResizeMode.KeepOriginalRatioByCropping;
                        resizer.Resize(80, 80);
                        resizer.SaveToDisk(OutputImageFormat.Jpeg, ConfigurationManager.AppSettings["80by80"] + filename);

                    }

                    SetAddImageDetails();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "fileUpload", "setImageUpload(true, true)", true);
                }
                catch (Exception ex)
                {
                    //errorLabel.Visible = true;
                    //errorLabel.Text = "Could not upload image: " + ex.Message;
                }
            }            
        }

        private void SetAddImageDetails()
        {
            addImageDetails = true;
        }
    }
}