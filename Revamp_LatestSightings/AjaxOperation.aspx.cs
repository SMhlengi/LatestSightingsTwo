using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using Revamp_LatestSightings;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class AjaxOperation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static bool SaveRegistrationData(string firstname, string lastname, string email, string password, string screenName)
        {
            Boolean savedStatus = false;
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            Person person = new Person();

            person = SetPersonObject(person, firstname, lastname, email, password, screenName);

            savedStatus = DataLayer.SaveRegistration(person, conn, query);
            if (savedStatus)
                utils.SendSuccessfullyRegisteredMail(firstname, lastname, email, "http://lscms.socialengine.co.za");

            return savedStatus;

        }

        private static Person SetPersonObject(Person person, string firstname, string lastname, string email, string password, string screenName)
        {
            person.FirstName = firstname;
            person.LastName = lastname;
            person.Email = email;
            person.Password = password;
            person.Role = 3;
            person.screenName = screenName;
            return person;
        }

        [WebMethod]
        public static Dictionary<string, string> IsValidUser(string email, string password)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            Dictionary<string, string> userdata = DataLayer.AreCredentialsValid(email, password, conn, query, data);
            if (userdata["credentialsValid"] == "true")
                HttpContext.Current.Session["userid"] = userdata["id"];
            return userdata;
        }

        [WebMethod]
        public static Dictionary<string,string> DecreptPassword(string password)
        {
            Dictionary<string, string> decreptionResult = new Dictionary<string, string>();
            decreptionResult.Add("decrepted", "false");

            if (!String.IsNullOrEmpty(password))
            {
                decreptionResult["decrepted"] = "true";
                decreptionResult["decreption"] = Encription.Decrypt(password);
                
            }
            return decreptionResult;
        }

        [WebMethod]
        public static string EncreptPassword(string password)
        {
            return Encription.Encrypt(password);
        }

        [WebMethod]
        public static bool SendForgottonPasswordEmail(string email)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            Dictionary<string, string> userRecord = new Dictionary<string, string>();
            userRecord = DataLayer.DoesEmailExists(email, conn, query, data);
            if (userRecord["doesEmailExits"] == "false")
                return false;
            else
            {
                bool status = utils.SendForgottonPasswordEmail(email, userRecord["id"].ToString());
                return status;
            }
        }

        [WebMethod]
        public static bool UpdatePassword(string password, string email)
        {
            bool status = false;
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            status = DataLayer.UpdatePassword(password, email, conn, query);
            return status;
        }

        [WebMethod]
        public static bool UpdateProfile(string firstname, string lastname, string telephonenumber, string othercontact, string address, string bank, string payPal, string facebook, string twitter, string skype, string email, string cellnumber, string accounttype, string accountnumber, string branchname, string brachcode)
        {
            bool status = false;
            if (HttpContext.Current.Session["userid"] != null)
            {
                SqlConnection conn = new SqlConnection();
                SqlCommand query = new SqlCommand();
                status = DataLayer.UpdateProfile(conn, query, firstname, lastname, telephonenumber, othercontact, address, bank, payPal, facebook, twitter, skype, email, cellnumber, HttpContext.Current.Session["userid"].ToString(), accounttype, accountnumber, branchname, brachcode);
            }
            return status;
        }

        //[WebMethod]
        //public static bool SaveVideoDetails(string videoTitle, string alias, string keywords, string notes, string videofilename)
        //{
        //    Boolean savedStatus = false;
        //    if (HttpContext.Current.Session["userid"] != null && !String.IsNullOrEmpty(videofilename))
        //    {
        //        SqlConnection conn = new SqlConnection();
        //        SqlCommand query = new SqlCommand();
        //        SqlDataReader data = null;
        //        Video video = new Video();
        //        string userFullName;
        //        string recordId = "-1";

        //        video = SetVideoObject(videoTitle, alias, keywords, notes, HttpContext.Current.Session["userid"].ToString(), video);
        //        recordId = DataLayer.SaveVideoDetails(video, conn, query, videofilename);
        //        if (recordId != "-1")
        //        {
        //            if (recordId != "-2") // not a duplicate video
        //            {
        //                userFullName = DataLayer.GetFullName(conn, query, HttpContext.Current.Session["userid"].ToString(), data);
        //                if (!String.IsNullOrEmpty(userFullName))
        //                    savedStatus = utils.SendVideoEmailLinkToAdministrator(Convert.ToString(HttpContext.Current.Session["userid"]), userFullName, videoTitle, recordId);
        //            }
        //            else
        //            {
        //                savedStatus = true;
        //            }

        //        }
        //    }
        //    return savedStatus;
        //}

        private static Video SetVideoObject(string videoTitle, string alias, string keywords, string notes, string userId, Video video, string status = "Pending")
        {
            video.Id = Guid.NewGuid().ToString();
            video.Contributor = userId;
            video.Title = videoTitle;
            video.Alias = alias;
            video.Keywords = keywords;
            video.Notes = notes;
            //video.Status = "Pending";
            video.Status = status;
            video.DateRemoved = (DateTime)System.Data.SqlTypes.SqlDateTime.MaxValue;
            //video.DateRemoved = DateTime.Now.AddYears(20);
            video.DateUploaded = (DateTime)System.Data.SqlTypes.SqlDateTime.MinValue;
            //video.DateUploaded = DateTime.Now;

            return video;
        }

        private static Image SetImageObject(string animal, string activity, string area, string tags, string comments, string userId, Image image, string filename, string title)
        {
            //video.Id = Guid.NewGuid().ToString();
            image.contributor = userId;
            image.animal = animal;
            image.activity = activity;
            image.area = area;
            image.tags = tags;
            image.generalComment = comments;
            image.original = filename;
            image.eightyBYeighty = filename;
            image.sixFiftyBYsixFifty = filename;
            image.dateAdded = DateTime.Now;
            image.dateModified = DateTime.Now;
            image.title = title;
            return image ;
        }

        private static Image SetImageObject(string animal, string activity, string area, string tags, string comments, string userId, Image image, string title)
        {
            //video.Id = Guid.NewGuid().ToString();
            image.contributor = userId;
            image.animal = animal;
            image.activity = activity;
            image.area = area;
            image.tags = tags;
            image.generalComment = comments;
            //image.original = filename;
            //image.eightyBYeighty = filename;
            //image.sixFiftyBYsixFifty = filename;
            image.dateAdded = DateTime.Now;
            image.dateModified = DateTime.Now;
            image.title = title;
            return image;
        }


        [WebMethod]
        public static bool updateVideoStatus(string vidid, string status, string useremail, string userFullName, string filename, string declindedOptions, string adviceSuggestions, string firstname)
        {
            Boolean savedStatus = false;
            if (HttpContext.Current.Session["userid"] != null)
            {
                SqlConnection conn = new SqlConnection();
                SqlCommand query = new SqlCommand();
                savedStatus = DataLayer.UpdateVideoStatus(conn, query, vidid, status);
                if (savedStatus && status == "Accepted")
                    utils.SendAcceptedVideoEmail(useremail, filename, firstname);
                else if (savedStatus && status == "Declined")
                    utils.SendDeclineEmailMessage(useremail, filename, firstname, declindedOptions, adviceSuggestions);
            }
            return savedStatus;
        }

        [WebMethod]
        public static Boolean saveNewReason(string reason)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            Boolean status = false;
            status = DataLayer.AddNewDeclineVideoReason(conn, query, reason);
            return status;
        }

        [WebMethod]
        public static Dictionary<string, string> DoesEmailExistgs(string email)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            Dictionary<string, string> status = new Dictionary<string, string>();
            status = DataLayer.DoesEmailExists(email, conn, query, data);
            return status;
        }

        [WebMethod]
        public static bool DoesScreenNameExist(string screenName)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            bool status = DataLayer.DoesScreenNameExist(screenName, conn, query, data);
            return status;
        }

        [WebMethod]
        public static  Dictionary<string, List<string>> GetGalleryFilters()
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            Dictionary<string, List<string>> searchItems = new Dictionary<string,List<string>>();
            searchItems = DataLayer.GetGallerySeachFilters(conn, query, data, searchItems);
            return searchItems;
        }

        [WebMethod]
        public static Dictionary<string, List<string>> GetVideoGalleryFilters()
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            Dictionary<string, List<string>> searchItems = new Dictionary<string, List<string>>();
            searchItems = DataLayer.GetVideoGallerySeachFilters(conn, query, data, searchItems);
            return searchItems;
        }


        [WebMethod]
        public static List<Dictionary<string, string>> GalleryFilterSearch(string areas, string animal, string activity, string media = "images")
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            List<Dictionary<string, string>> searchResults = new List<Dictionary<string, string>>();
            searchResults = DataLayer.GallerySearch(conn, query, data, searchResults, areas, animal, activity);
            return searchResults;
        }

        [WebMethod]
        public static List<GalleryItem> VideoGalleryFilterSearch(string title, string keywords)
        {
            List<GalleryItem> videoGallery = null;
            
            if (!String.IsNullOrEmpty(title) && String.IsNullOrEmpty(keywords))
            {
                videoGallery = Galleries.GetGallery(Galleries.GalleryType.Video, title, Galleries.VideoSearchType.Title);
            }
            else if (!String.IsNullOrEmpty(title) && !String.IsNullOrEmpty(keywords))
            {
                videoGallery = Galleries.GetGallery(Galleries.GalleryType.Video, title, keywords);
            }
            else
            {
                videoGallery = Galleries.GetGallery(Galleries.GalleryType.Video, keywords, Galleries.VideoSearchType.Keywords);
            }

            return videoGallery;
        }

        [WebMethod]
        public static bool SubscribeToNewsLetter(string email)
        {
            bool status = false;
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            status = DataLayer.subscribeToNewsletter(email, conn, query, data);
            return status;
        }

        [WebMethod]
        public static bool SendContactUsEmail(string name, string email, string message)
        {
            bool status = utils.SendContactUsMail(name, email, message);
            return status;
        }

        [WebMethod]
        public static bool SendEnquireMail(string name, string email, string country, string tel, string dateOfTravel, string numberOfAdults, string numberOfChildren, string specialRequest, string numberofnightstravelled, string EnquiredLodgeName)
        {
            bool status = utils.SendEnquireMail(name, email, country, tel, dateOfTravel, numberOfAdults, numberOfChildren, specialRequest, numberofnightstravelled, EnquiredLodgeName);
            return status;
        }

        [WebMethod]
        public static List<Dictionary<string, string>> GetLodgeDetails(string lodgeName)
        {
            Dictionary<string, string> lodge = new Dictionary<string, string>();
            var dt = DateTime.Now;
            string stringDate = "";
            int counter = 0;

            lodge = library.GetLodge(lodgeName);
            stringDate = String.Format("{0}", Convert.ToString(dt.Year) + "-" + Convert.ToString(dt.Month) + "-" + Convert.ToString(dt.Day));
            List<Dictionary<string, string>> lodgeTings = new List<Dictionary<string, string>>();
            lodgeTings = library.GetLodgeTingsByDate(lodge["id"], stringDate);

            while (lodgeTings.Count == 0)
            {
                counter -= 1;
                dt = dt.AddDays(counter);
                stringDate = String.Format("{0}", Convert.ToString(dt.Year) + "-" + Convert.ToString(dt.Month) + "-" + Convert.ToString(dt.Day));
                lodgeTings = library.GetLodgeTingsByDate(lodge["id"], stringDate);
            }
            return lodgeTings;
        }

        private static List<Dictionary<string, string>> GetLodgeTings(string lodgeId)
        {
            return library.GetLodgeTings(lodgeId);
        }

        [WebMethod]
        public static List<Dictionary<string, string>> GetLodgeTopFiveTingers(string lodgeId)
        {
            return library.GetTopFiveLodgeTingers(lodgeId);
        }

        [WebMethod]
        public static List<Dictionary<string, string>> GetTings()
        {
            List<Dictionary<string, string>> tings = new List<Dictionary<string, string>>();
            tings = library.GetTopTings(Convert.ToInt32(ConfigurationManager.AppSettings["homeTingsNumber"]));
            return tings;               
        }

        [WebMethod]
        public static Dictionary<string, List<GalleryItem>> GetHomePageLatestGalleries()
        {
            List<GalleryItem> latestPhotos = GetLatestPhotos();
            List<GalleryItem> latestVideos = GetLatestVideos();
            List<GalleryItem> videosAndPhotos = BuildCombinationOfVideosAndPhotos(latestPhotos, latestVideos);
            Dictionary<string, List<GalleryItem>> latestGalleries = new Dictionary<string, List<GalleryItem>>()
            {
                {"photos", latestPhotos},
                {"videos", latestVideos},
                {"photosAndVideos", videosAndPhotos}
            };

            return latestGalleries;
        }

        private static List<GalleryItem> GetLatestPhotos()
        {
            var latestPhotos = new List<GalleryItem>();
            latestPhotos = Galleries.GetGallery(Galleries.GalleryType.Image, 8);
            return latestPhotos;
        }

        private static List<GalleryItem> GetLatestVideos()
        {
            var latestVideos = new List<GalleryItem>();
            latestVideos = Galleries.GetGallery(Galleries.GalleryType.Video, 8);
            return latestVideos;
        }

        private static List<GalleryItem> BuildCombinationOfVideosAndPhotos(List<GalleryItem> latestPhotos, List<GalleryItem> latestVideos)
        {
            var videosAndPhotos = new List<GalleryItem>();
            if (latestPhotos.Count > 3 && latestVideos.Count > 3)
            {
                videosAndPhotos.Add(latestVideos[0]);
                videosAndPhotos.Add(latestPhotos[0]);
                videosAndPhotos.Add(latestVideos[1]);
                videosAndPhotos.Add(latestPhotos[1]);
                videosAndPhotos.Add(latestVideos[2]);
                videosAndPhotos.Add(latestPhotos[2]);
                videosAndPhotos.Add(latestVideos[3]);
                videosAndPhotos.Add(latestPhotos[3]);
            }

            return videosAndPhotos;
        }

        [WebMethod]
        public static List<Dictionary<string,string>> GetParks()
        {
            List<Dictionary<string, string>> parks = new List<Dictionary<string, string>>();
            parks = library.GetParks();
            return parks;
        }

        [WebMethod]
        public static List<Dictionary<string, string>> GetKrugerTings()
        {
            List<Dictionary<string, string>> parks = new List<Dictionary<string, string>>();
            parks = library.GetParks();
            Guid parkid = new Guid(GetKrugerParkId(parks).ToString());
            parks = GetParkTings(parkid);
            return parks;
        }

        private static List<Dictionary<string, string>> GetParkTings(Guid parkid)
        {
            //var dt = DateTime.Now;
            //string stringDate = "";
            //int counter = 0;

            //stringDate = String.Format("{0}", Convert.ToString(dt.Year) + "-" + Convert.ToString(dt.Month) + "-" + Convert.ToString(dt.Day));
            List<Dictionary<string, string>> parkTings = new List<Dictionary<string, string>>();
            parkTings = library.GetLatest24HoursParkTings(parkid);

            //while (lodgeTings.Count == 0)
            //{
            //    counter -= 1;
            //    dt = dt.AddDays(counter);
            //    stringDate = String.Format("{0}", Convert.ToString(dt.Year) + "-" + Convert.ToString(dt.Month) + "-" + Convert.ToString(dt.Day));
            //    lodgeTings = library.GetParkTingsByDate(parkid);
            //}
            return parkTings;
        }


        private static Guid GetKrugerParkId(List<Dictionary<string, string>> parks)
        {
            Guid parkid = new Guid();
            foreach(var park in parks)
            {
                if (park["name"].ToString().Equals("kruger national park", StringComparison.OrdinalIgnoreCase))
                {
                    parkid = new Guid(park["id"]);
                }
            }
            return parkid;
        }

        [WebMethod]
        public static Dictionary<string, string> SaveVideoDetailsAndSendMail(string videoTitle, string alias, string keywords, string notes)
        {
            Dictionary<string, string> details = new Dictionary<string, string>()
            {
                {"savedStatus", "false"},
                {"videoId", "-1"}
            };
            if (HttpContext.Current.Session["userid"] != null)
            {
                SqlConnection conn = new SqlConnection();
                SqlCommand query = new SqlCommand();
                SqlDataReader data = null;
                Video video = new Video();

                video = SetVideoObject(videoTitle, alias, keywords, notes, HttpContext.Current.Session["userid"].ToString(), video, "Details of Video");
                details["videoId"] = DataLayer.SaveVideoDetails(video, conn, query, "");
                if (details["videoId"] != "-1")
                {
                    if (details["videoId"] != "-2") // not a duplicate video
                    {
                        Person userDetails = null;
                        userDetails = DataLayer.GetUserDetails(conn, query, HttpContext.Current.Session["userid"].ToString(), data, userDetails);
                        if (userDetails != null)
                            details["savedStatus"] =  utils.SendEmailToAdministratorTheVideoDetailsHaveBeenCaptured(userDetails, videoTitle);
                    }
                    else
                    {
                        details["savedStatus"] = "true";
                    }
                }
            }
            return details;
        }

        [WebMethod]
        public static Dictionary<string,string> SaveImageDetails(string animal, string activity, string area, string tags, string comments, string title)
        {
            Dictionary<string, string> details = new Dictionary<string, string>()
            {
                {"savedStatus", "false"},
                {"imageId", "-1"}
            };


            if (HttpContext.Current.Session["userid"] != null)
            {
                SqlConnection conn = new SqlConnection();
                SqlCommand query = new SqlCommand();
                SqlDataReader data = null;
                Image imageObj = new Image();
                //imageObj = SetImageObject(animal, activity, area, tags, comments, HttpContext.Current.Session["userid"].ToString(), imageObj, HttpContext.Current.Session["Imagefilename"].ToString(), title);
                imageObj = SetImageObject(animal, activity, area, tags, comments, HttpContext.Current.Session["userid"].ToString(), imageObj, title);
                details["imageId"] = DataLayer.SaveImageDetails(imageObj, conn, query);
                if (details["imageId"] != "-1")
                {
                    Person userDetails = null;
                    userDetails = DataLayer.GetUserDetails(conn, query, HttpContext.Current.Session["userid"].ToString(), data, userDetails);
                    if (userDetails != null)
                        details["savedStatus"] = utils.SendEmailToAdministratorAboutImageRecordCaptured(userDetails, imageObj);
                }
            }
            return details;
        }

        [WebMethod]
        public static bool DoesFileAlreadyExist(string filename, string fileType)
        {
            bool fileExists = false;
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            fileExists = DataLayer.DoesVideoAlreadyExists(conn, query, data, filename, fileType);
            return fileExists;
        }

        [WebMethod]
        public static bool UpdateRecordDetails(string videofilename, string recordid, string fileType)
        {
            bool recordUpdated = false;
            SqlConnection conn = new SqlConnection();
            SqlCommand query = new SqlCommand();
            SqlDataReader data = null;
            Video video = new Video();
            Image imageRecord = null;
            recordUpdated = DataLayer.UpdateFileUploadRecordDetails(conn, query, data, videofilename, recordid, fileType);
            if (recordUpdated)
            {
                //if (fileType.ToLower() == "img")
                //    utils.ResizeImage(videofilename);
                Person userDetails = null;
                userDetails = DataLayer.GetUserDetails(conn, query, HttpContext.Current.Session["userid"].ToString(), data, userDetails);
                if (userDetails != null && fileType.ToLower() == "vid")
                { 
                    video = DataLayer.GetVideoRecord(conn, query, HttpContext.Current.Session["userid"].ToString(), data, recordid);
                    recordUpdated = utils.SendVideoEmailLinkToAdministrator(Convert.ToString(HttpContext.Current.Session["userid"]), userDetails.FirstName + " " + userDetails.LastName, video.Title, recordid);
                }else if (userDetails != null && fileType.ToLower() == "img")
                {
                    imageRecord = new Image();
                    imageRecord = DataLayer.GetImage(recordid, conn, query, data, imageRecord);
                    var status = utils.SendEmailToAdministratorAboutImageRecordCaptured(userDetails, imageRecord, "imagePreview", recordid);
                    if (status == "true")
                        recordUpdated = true;
                }
            }
            return recordUpdated;
        }
    }
}