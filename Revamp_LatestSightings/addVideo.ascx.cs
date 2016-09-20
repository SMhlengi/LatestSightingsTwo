using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace Revamp_LatestSightings
{
    public partial class addVideo : System.Web.UI.UserControl
    {
        public bool addVideoDetails = false;
        public string name;

        protected void Page_Load(object sender, EventArgs e)
        {
            uc_dashboard_resumable_file_upload uc_rfu = (uc_dashboard_resumable_file_upload)LoadControl("~/uc_dashboard_resumable_file_upload.ascx");
            fileup_resumable.Controls.Add(uc_rfu);
        }

        protected void Uploader1_FileUploaded(object sender, CuteWebUI.UploaderEventArgs args)
        {
            SetAddVideoDetails();
            string newname = args.FileName;
            args.CopyTo(ConfigurationManager.AppSettings["savePath"] + newname);
            Session["videofilename"] = null;
            Session["videofilename"] = newname;

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "fileUpload", "setVideoUpload(true, true)", true);
        }

        protected void justIncaseSecondaryFileuploadButton_Click(object sender, EventArgs e)
        {
            SetAddVideoDetails();

            if (justIncaseSecondaryFileupload.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(justIncaseSecondaryFileupload.FileName);
                    justIncaseSecondaryFileupload.SaveAs(ConfigurationManager.AppSettings["savePath"].ToString() + filename);
                    //string newname = args.FileName;
                    //args.CopyTo(ConfigurationManager.AppSettings["savePath"] + newname);
                    Session["videofilename"] = null;
                    Session["videofilename"] = filename;
                }
                catch (Exception ex)
                {
                    // log exception
                }
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "fileUpload", "setVideoUpload(true, true)", true);
        }

        private void SetAddVideoDetails()
        {
            addVideoDetails = true;
        }
    }
}