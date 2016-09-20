using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace Revamp_LatestSightings
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected SqlConnection conn;
        protected SqlCommand query;
        protected SqlDataReader data;
        protected Dictionary<string, string> profile;
        protected bool profileComplete = false;
        protected bool CanUserViewFinancials = false;


        private string id;
        public string userId
        {
            get
            {
                if (String.IsNullOrEmpty(id) && Session["userid"] != null)
                {
                    id = Session["userid"].ToString();
                }
                return id;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["videoPreviewForUserId"] != null && Session["videoPreviewVideoId"] != null)
            {
                Response.Redirect("/videopreview.aspx?user=" + Session["videoPreviewForUserId"] + "&video=" + Session["videoPreviewVideoId"]);
            }
            else if (Session["videoPreviewForUserId"] != null)
            {
                Response.Redirect("/videopreview.aspx?user=" + Session["videoPreviewForUserId"]);
            }


            if (userId != null)
            {
                profile = GetUserProfile();
                if (isProfileComplete(profile))
                    profileComplete = true;

                LoadUserControls();
            }
            else
            {
                HttpContext.Current.Response.Redirect("/login");
            }

        }

        private void LoadUserControls()
        {
            Session["username"] = "Howzit " + profile["firstname"];
            addVideo uc_videoPage = (addVideo)LoadControl("~/addVideo.ascx");
            uc_videoPage.name = profile["firstname"] + " " + profile["lastname"];
            addVideoContent.Controls.Add(uc_videoPage);

            termsAndConditions uc_terms = (termsAndConditions)LoadControl("~/termsAndConditions.ascx");
            termsandCs.Controls.Add(uc_terms);

            videoList uc_videoList = (videoList)LoadControl("~/videoList.ascx");
            uc_videoList.userId = userId;
            videoListcontent.Controls.Add(uc_videoList);

            uc_viewFinancials yourmoney = (uc_viewFinancials)LoadControl("~/uc_viewFinancials.ascx");
            plc_addImage.Controls.Add(yourmoney);

            //uc_AddImage uc_addImage = (uc_AddImage)LoadControl("~/uc_AddImage.ascx");
            //plc_addImage.Controls.Add(uc_addImage);

            ////uc_addcontent uc_AddContent = (uc_addcontent)LoadControl("~/uc_addcontent.ascx");
            ////addContentPlacehoder.Controls.Add(uc_AddContent);

            uc_addcontent uc_termsNCondition = (uc_addcontent)LoadControl("~/uc_addcontent.ascx");
            termsNConditionPlaceholder.Controls.Add(uc_termsNCondition);

            LoadProfileControl(profile);
            CanUserViewFinancials = SetViewFinancials(profile["active"]);

        }


        private bool SetViewFinancials(string status)
        {
            if (status == "True")
                return true;
            return false;
        }

        private bool isProfileComplete(Dictionary<string, string> profile)
        {
            if (profile["recordExist"] == "true")
            {
                if (ItemCaptured(profile["cellnumber"]))
                    if (ItemCaptured(profile["tellnumber"]))
                        if (ItemCaptured(profile["address"]))
                            return true;
                        else
                            return false;
                    else
                        return false;
                else
                    return false;
            }
            else
                return false;
        }

        private void LoadProfileControl(Dictionary<string, string> profile)
        {
            completeProfile uc_completeProfile = (completeProfile)LoadControl("~/completeProfile.ascx");
            uc_completeProfile.username = profile["firstname"];
            uc_completeProfile.firstname = profile["firstname"];
            uc_completeProfile.lastname = profile["lastname"];
            uc_completeProfile.email = profile["email"];
            uc_completeProfile.cellnumber = profile["cellnumber"];
            uc_completeProfile.telephone = profile["tellnumber"];
            uc_completeProfile.othercontact = profile["othercontact"];
            uc_completeProfile.skype = profile["skype"];
            uc_completeProfile.twitter = profile["twitter"];
            uc_completeProfile.facebook = profile["facebook"];
            uc_completeProfile.address = profile["address"];
            uc_completeProfile.bankdetails = profile["banking"];
            uc_completeProfile.paypaldetails = profile["paypal"];

            uc_completeProfile.accounttype = profile["accounttype"];
            uc_completeProfile.accountnumber = profile["accountnumber"];
            uc_completeProfile.branchname = profile["branchname"];
            uc_completeProfile.branchcode = profile["branchcode"];

            if (profileComplete)
                uc_completeProfile.IsVisible = false;

            content.Controls.Add(uc_completeProfile);
        }

        private bool ItemCaptured(string p)
        {
            if (String.IsNullOrEmpty(p))
                return false;
            return true;
        }

        private Dictionary<string, string> GetUserProfile()
        {
            Dictionary<string, string> userProfile = new Dictionary<string, string>();
            conn = new SqlConnection();
            query = new SqlCommand();
            data = null;
            userProfile = DataLayer.GetUserProfile(userId, conn, query, data);
            return userProfile;
        }

        protected void downloadTandC_Click(object sender, EventArgs e)
        {
            // the file name to get
            string fileName = ConfigurationManager.AppSettings["filenameForTermsAndConditions"];
            // get the file bytes to download to the browser
            byte[] fileBytes = System.IO.File.ReadAllBytes(ConfigurationManager.AppSettings["termsAndConditionsFilePath"] + fileName);
            // NOTE: You could also read the file bytes from a database as well.

            // download this file to the browser
            utils.StreamFileToBrowser(fileName, fileBytes);
        }
    }
}