using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace Revamp_LatestSightings
{
    public class DataLayer
    {
        private const string SQL_INSERT_PERSON = "INSERT INTO latestsightings.dbo.people (id, firstname, lastname, email, password, active, role, cellNumber, telNumber, otherContact, twitter, facebook, skype, address, banking, paypal, screenName) VALUES (@id, @firstname, @lastname, @email, @password, @active, @role, @cellNumber, @telNumber, @otherContact, @twitter, @facebook, @skype, @address, @banking, @paypal, @screenName);";
        private const string SQL_UPDATE_PERSON = "UPDATE latestsightings.dbo.people SET firstname = @firstname, lastname = @lastname, email = @email, password = @password, active = @active, role = @role, cellNumber = @cellNumber, telNumber = @telNumber, otherContact = @otherContact, twitter = @twitter, facebook = @facebook, skype = @skype, address = @address, banking = @banking, paypal = @paypal, modified = @modified WHERE (id = @id);";
        private const string SQL_SELECT_PERSON = "SELECT firstname, lastname, id FROM latestsightings.dbo.people WHERE (email = @email and password = @password);";
        private const string SQL_SELECT_PERSON_BASED_ON_EMAIL = "SELECT firstname, lastname, id FROM latestsightings.dbo.people WHERE (email = @email);";
        private const string SQL_UPDATE_PASSWORD = "UPDATE latestsightings.dbo.people SET password = @password where (id = @userid);";
        private const string SQL_UPDATE_VIDEO = "UPDATE latestsightings.dbo.videos SET filename = @filename, videoStatus = @videostatus, status = @videostatus where (id = @videoidrecord);";
        private const string SQL_SELECT_ALL_PERSON_RECORD = "Select * from latestsightings.dbo.people where (id = @id);";
        private const string SQL_UPDATE_PROFILE = "UPDATE latestsightings.dbo.people SET firstname = @firstname, lastname = @lastname, email = @email, cellNumber = @cellNumber, telNumber = @telNumber, otherContact = @otherContact, twitter = @twitter, facebook = @facebook, skype = @skype, address = @address, banking = @banking, paypal = @paypal, accountType = @accounttype, accountNumber = @accountNumber, branchName = @branchName, branchCode = @branchCode WHERE (id = @id);";
        private const string SQL_INSERT_VIDEO = "INSERT INTO latestsightings.dbo.videos (contributor, id, title, alias, dateRecieved, ipDate, ipDocument, revenueShare, keywords, region, notes, created, modified, status, youtubeId, dateUploaded, dateRemoved, filename, videoStatus) VALUES (@contributor, @id, @title, @alias, @dateRecieved, @ipDate, @ipDocument, @revenueShare, @keywords, @region, @notes, @created, @modified, @status, @youtubeId, @dateUploaded, @dateRemoved, @filename, @videoStatus); SELECT TOP 1 id FROM latestsightings.dbo.videos WHERE contributor =  @contributor ORDER BY Created DESC";
        private const string SQL_DOES_VIDEO_EXIST = "SELECT TOP 1 filename from latestsightings.dbo.videos WHERE (filename = @name)";
        private const string SQL_DOES_IMG_EXIST = "SELECT TOP 1 original from latestsightings.dbo.images WHERE (original = @name)";
        private const string SQL_INSERT_IMAGE = "INSERT INTO latestsightings.dbo.[images] (contributor, original, eightyBYeighty, sixFiftyBYsixFifty, display, dateAdded, dateModified, animal, activity, area, tags, generalComment, title) VALUES (@contributor, @original, @eightyBYeighty, @sixFiftyBYsixFifty, @display, @dateAdded, @dateModified, @animal, @activity, @area, @tags, @generalComment, @title); SELECT TOP 1 id FROM latestsightings.dbo.images WHERE contributor =  @contributor ORDER BY dateAdded DESC";
        private const string SQL_GET_IMAGE_BASED_ON_ID = "SELECT * FROM latestsightings.dbo.[images] where id = @imageId";
        private const string SQL_UPDATE_IMAGES = "Update latestsightings.dbo.images SET eightyBYeighty = @filename, sixFiftyBYsixFifty = @filename, original = @filename  where (id = @recordid);";
        private const string SQL_SELECT_PERSON_VIDEOS = "Select * from latestsightings.dbo.videos where (contributor = @contributor);";
        private const string SQL_SELECT_PERSON_BASED_ON_ID = "SELECT firstname, lastname, email, cellNumber, telNumber, screenName FROM latestsightings.dbo.people WHERE (id = @userid);";
        private const string SQL_SELECT_USER_LASTEST_VIDEO = "SELECT TOP (1) * from latestsightings.dbo.videos WHERE (contributor = @contributor) AND (videoStatus = 'Pending') ORDER BY created DESC";

        private const string SQL_SELECT_USER_VIDEO = "SELECT * from latestsightings.dbo.videos WHERE (contributor = @contributor) AND (id = @videoId);";
        private const string SQL_UPDATE_VIDEO_STATUS = "Update latestsightings.dbo.videos SET videoStatus = @videostatus where (id = @recordid);";
        private const string SQL_SELECT_DECLINE_STATUSES = "Select * from latestsightings.dbo.declineVideoStatuses";
        private const string SQL_INSERT_NEW_DECLINE_VIDEO_REASON = "Insert into latestsightings.dbo.declineVideoStatuses (reason) VALUES (@reason);";
        private const string SQL_SELECT_GALLERY_FILTERS = "SELECT area, animal, activity from latestsightings.dbo.images";
        private const string SQL_SELECT_VIDEO_GALLERY_FILTERS = "SELECT a.Title, a.keywords FROM latestsightings.dbo.videos a INNER JOIN latestsightings.dbo.youTubeVideo b ON b.Id = a.YoutubeId WHERE (a.Status = 'Published' AND a.youtubeId <> '')";        
        private const string SQL_SEARCH = "SELECT sixFiftyBYsixFifty, title from latestsightings.dbo.images WHERE (contributor = @contributor) AND (animal LIKE '%'" +  "@animal" + "'%') AND (activity LIKE '%'" + "@activity" + "'%') AND (area LIKE '%'" + "@area" + "'%') AND (display = 0)";
        private const string SQL_DOES_EMAIL_EXIST = "SELECT TOP 1 email from latestsightings.dbo.newsletterSubscriptions WHERE (email = @email)";
        private const string SQL_DOES_SCREEN_NAME_EXIST = "SELECT TOP 1 screenName from latestsightings.dbo.people WHERE (screenName = @userScreenName)";
        private const string SQL_NEWSLETTER_SUBSCRIPTION = "INSERT INTO latestsightings.dbo.[newsletterSubscriptions] (email) VALUES (@emailaddress);";

        internal static bool DoesScreenNameExist(string screenname, SqlConnection conn, SqlCommand query, SqlDataReader data)
        {
            ConfigureConnection(conn, query);
            bool screenNameFound = false;
            try
            {
                conn.Open();
                query.CommandText = SQL_DOES_SCREEN_NAME_EXIST;
                query.Parameters.Add("userScreenName", System.Data.SqlDbType.VarChar).Value = screenname;
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    screenNameFound = true;
                }
                data.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                conn.Close();
                data.Close();
                // log exception
            }
            return screenNameFound;
        }


        public static bool SaveRegistration(Person person, SqlConnection conn, SqlCommand query)
        {
            ConfigureConnection(conn, query);
            return SavePerson(person, conn, query);
        }

        public static Dictionary<string, string> AreCredentialsValid(string email, string password, SqlConnection conn, SqlCommand query, SqlDataReader data)
        {
            Dictionary<string, string> userdata = new Dictionary<string, string>();
            userdata.Add("credentialsValid", "false");
            ConfigureConnection(conn, query);
            try
            {
                conn.Open();
                query.CommandText = SQL_SELECT_PERSON;
                query.Parameters.Add("email", System.Data.SqlDbType.VarChar).Value = email;
                query.Parameters.Add("password", System.Data.SqlDbType.VarChar).Value = password;
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    userdata["credentialsValid"] = "true";
                    while (data.Read())
                    {
                        userdata.Add("firstname", data["firstname"].ToString());
                        userdata.Add("lastname", data["lastname"].ToString());
                        userdata.Add("id", data["id"].ToString());
                        userdata.Add("encreptedPassword", Encription.Encrypt(password));
                    }
                }
                conn.Close();
                data.Close();
            }
            catch (Exception ex)
            {
                // to do: log exception
                conn.Close();
            }
            return userdata;
        }

        public static void ConfigureConnection(SqlConnection conn, SqlCommand query)
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            query.Connection = conn;
        }

        public static bool SavePerson(Person person, SqlConnection conn, SqlCommand sqlQuery)
        {
            bool saved = false;
            bool update = true;

            if (string.IsNullOrEmpty(person.Id))
            {
                person.Id = Guid.NewGuid().ToString();
                update = false;
            }

            try
            {
                conn.Open();
                sqlQuery.CommandText = update == true ? SQL_UPDATE_PERSON : SQL_INSERT_PERSON;
                sqlQuery.Parameters.Add("id", System.Data.SqlDbType.VarChar).Value = person.Id == null ? string.Empty : person.Id;
                sqlQuery.Parameters.Add("firstname", System.Data.SqlDbType.VarChar).Value = person.FirstName == null ? string.Empty : person.FirstName;
                sqlQuery.Parameters.Add("lastname", System.Data.SqlDbType.VarChar).Value = person.LastName == null ? string.Empty : person.LastName;
                sqlQuery.Parameters.Add("email", System.Data.SqlDbType.VarChar).Value = person.Email == null ? string.Empty : person.Email;
                sqlQuery.Parameters.Add("password", System.Data.SqlDbType.VarChar).Value = person.Password == null ? string.Empty : person.Password;
                sqlQuery.Parameters.Add("active", System.Data.SqlDbType.Bit).Value = person.Active == null ? true : person.Active;
                sqlQuery.Parameters.Add("role", System.Data.SqlDbType.Int).Value = person.Role == null ? 3 : person.Role;
                sqlQuery.Parameters.Add("cellNumber", System.Data.SqlDbType.VarChar).Value = person.CellNumber == null ? string.Empty : person.CellNumber;
                sqlQuery.Parameters.Add("telNumber", System.Data.SqlDbType.VarChar).Value = person.TelephoneNumber == null ? string.Empty : person.TelephoneNumber;
                sqlQuery.Parameters.Add("otherContact", System.Data.SqlDbType.VarChar).Value = person.OtherContact == null ? string.Empty : person.OtherContact;
                sqlQuery.Parameters.Add("twitter", System.Data.SqlDbType.VarChar).Value = person.Twitter == null ? string.Empty : person.Twitter;
                sqlQuery.Parameters.Add("facebook", System.Data.SqlDbType.VarChar).Value = person.Facebook == null ? string.Empty : person.Facebook;
                sqlQuery.Parameters.Add("skype", System.Data.SqlDbType.VarChar).Value = person.Skype == null ? string.Empty : person.Skype;
                sqlQuery.Parameters.Add("address", System.Data.SqlDbType.VarChar).Value = person.Address == null ? string.Empty : person.Address;
                sqlQuery.Parameters.Add("banking", System.Data.SqlDbType.VarChar).Value = person.Banking == null ? string.Empty : person.Banking;
                sqlQuery.Parameters.Add("paypal", System.Data.SqlDbType.VarChar).Value = person.Paypal == null ? string.Empty : person.Paypal;
                sqlQuery.Parameters.Add("modified", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                sqlQuery.Parameters.Add("screenName", System.Data.SqlDbType.VarChar).Value = person.screenName;
                sqlQuery.ExecuteNonQuery();
                conn.Close();

                saved = true;
                HttpContext.Current.Session["userid"] = person.Id;
            }
            catch (Exception ex)
            {
                //ExHandler.RecordError(ex);
            }
            finally
            {
                conn.Dispose();
            }

            return saved;
        }

        internal static Dictionary<string, string> DoesEmailExists(string emailaddress, SqlConnection conn, SqlCommand query, SqlDataReader data)
        {
            Dictionary<string, string> status = new Dictionary<string, string>();
            status.Add("doesEmailExits", "false");
            ConfigureConnection(conn, query);
            bool emailFound = false;
            try
            {
                conn.Open();
                query.CommandText = SQL_SELECT_PERSON_BASED_ON_EMAIL;
                query.Parameters.Add("email", System.Data.SqlDbType.VarChar).Value = emailaddress;
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    status["doesEmailExits"] = "true";
                    while (data.Read())
                    {
                        status["firstname"] = data["firstname"].ToString();
                        status["lastname"] = data["lastname"].ToString();
                        status["email"] = emailaddress;
                        status["id"] = data["id"].ToString();
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                conn.Close();
                data.Close();
                // log exception
            }
            return status;
        }

        internal static bool UpdatePassword(string password, string email, SqlConnection conn, SqlCommand query)
        {
            bool status = false;
            ConfigureConnection(conn, query);
            try
            {
                conn.Open();
                query.CommandText = SQL_UPDATE_PASSWORD;
                query.Parameters.Add("userid", System.Data.SqlDbType.VarChar).Value = email;
                query.Parameters.Add("password", System.Data.SqlDbType.VarChar).Value = password;
                query.ExecuteNonQuery();
                status = true;
                conn.Close();
            }
            catch (Exception ex)
            {
                // log error
                conn.Close();
            }
            return status;
        }

        internal static Dictionary<string, string> GetUserProfile(string userId, SqlConnection conn, SqlCommand query, SqlDataReader data)
        {
            ConfigureConnection(conn, query);
            Dictionary<string, string> person = new Dictionary<string, string>();
            person["recordExist"] = "false";
            try
            {
                query.CommandText = SQL_SELECT_ALL_PERSON_RECORD;
                query.Parameters.Add("id", System.Data.SqlDbType.VarChar).Value = userId;
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    person["recordExist"] = "true";
                    while (data.Read())
                    {
                        person["firstname"] = data["firstname"].ToString();
                        person["lastname"] = data["lastname"].ToString();
                        person["email"] = data["email"].ToString();
                        person["cellnumber"] = data["cellNumber"].ToString();
                        person["tellnumber"] = data["telNumber"].ToString();
                        person["othercontact"] = data["otherContact"].ToString();
                        person["twitter"] = data["twitter"].ToString();
                        person["facebook"] = data["facebook"].ToString();
                        person["skype"] = data["skype"].ToString();
                        person["address"] = data["address"].ToString();
                        person["banking"] = data["banking"].ToString();
                        person["paypal"] = data["paypal"].ToString();
                        person["accounttype"] = data["accountType"].ToString();
                        person["accountnumber"] = data["accountNumber"].ToString();
                        person["branchname"] = data["branchName"].ToString();
                        person["branchcode"] = data["branchCode"].ToString();
                        person["active"] = data["active"].ToString();
                        person["id"] = data["id"].ToString();

                    }
                    data.Close();
                    conn.Close();
                }
            }
            catch
            {
                // log exception
                conn.Close();
            }
            return person;
        }

        internal static bool UpdateProfile(SqlConnection conn, SqlCommand sqlQuery, string firstname, string lastname, string telephonenumber, string othercontact, string address, string bank, string payPal, string facebook, string twitter, string skype, string email, string cellnumber, string userId, string accounttype, string accountnumber, string branchname, string brachcode)
        {
            ConfigureConnection(conn, sqlQuery);
            bool updateStatus = false;

            try
            {
                conn.Open();
                sqlQuery.CommandText = SQL_UPDATE_PROFILE;
                sqlQuery.Parameters.Add("id", System.Data.SqlDbType.VarChar).Value = userId;
                sqlQuery.Parameters.Add("firstname", System.Data.SqlDbType.VarChar).Value = firstname;
                sqlQuery.Parameters.Add("lastname", System.Data.SqlDbType.VarChar).Value = lastname;
                sqlQuery.Parameters.Add("email", System.Data.SqlDbType.VarChar).Value = email;
                sqlQuery.Parameters.Add("cellNumber", System.Data.SqlDbType.VarChar).Value = cellnumber;
                sqlQuery.Parameters.Add("telNumber", System.Data.SqlDbType.VarChar).Value = telephonenumber;
                sqlQuery.Parameters.Add("otherContact", System.Data.SqlDbType.VarChar).Value = othercontact;
                sqlQuery.Parameters.Add("twitter", System.Data.SqlDbType.VarChar).Value = twitter;
                sqlQuery.Parameters.Add("facebook", System.Data.SqlDbType.VarChar).Value = facebook;
                sqlQuery.Parameters.Add("skype", System.Data.SqlDbType.VarChar).Value = skype;
                sqlQuery.Parameters.Add("address", System.Data.SqlDbType.VarChar).Value = address;
                sqlQuery.Parameters.Add("banking", System.Data.SqlDbType.VarChar).Value = bank;
                sqlQuery.Parameters.Add("paypal", System.Data.SqlDbType.VarChar).Value = payPal;
                sqlQuery.Parameters.Add("accountType", System.Data.SqlDbType.VarChar).Value = accounttype;
                sqlQuery.Parameters.Add("accountNumber", System.Data.SqlDbType.VarChar).Value = accountnumber;
                sqlQuery.Parameters.Add("branchName", System.Data.SqlDbType.VarChar).Value = branchname;
                sqlQuery.Parameters.Add("branchCode", System.Data.SqlDbType.VarChar).Value = brachcode;
                sqlQuery.ExecuteNonQuery();
                conn.Close();
                updateStatus = true;
            }
            catch (Exception ex)
            {
                //ExHandler.RecordError(ex);
                conn.Close();
            }
            finally
            {
                conn.Dispose();
            }

            return updateStatus;
        }

        internal static string SaveVideoDetails(Video video, SqlConnection conn, SqlCommand query, string filename)
        {
            ConfigureConnection(conn, query);
            string recordId = "-1";
            if (!String.IsNullOrEmpty(filename))
            {
                if (DoesVideoAlreadyExists(conn, query, filename))
                {
                    return "-2";
                }
            }

            try
            {
                conn.Open();
                query.CommandText = SQL_INSERT_VIDEO;
                query.Parameters.Add("id", System.Data.SqlDbType.VarChar).Value = video.Id == null ? string.Empty : video.Id;
                query.Parameters.Add("title", System.Data.SqlDbType.VarChar).Value = video.Title == null ? string.Empty : video.Title;
                query.Parameters.Add("alias", System.Data.SqlDbType.VarChar).Value = video.Alias == null ? string.Empty : video.Alias;
                query.Parameters.Add("dateRecieved", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                //query.Parameters.Add("ipDate", System.Data.SqlDbType.DateTime).Value = video.IPDate == null ? DateTime.Now : video.IPDate;
                query.Parameters.Add("ipDate", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                query.Parameters.Add("ipDocument", System.Data.SqlDbType.VarChar).Value = video.IPDocument == null ? string.Empty : video.IPDocument;
                query.Parameters.Add("revenueShare", System.Data.SqlDbType.VarChar).Value = video.RevenueShare == null ? string.Empty : video.RevenueShare;
                query.Parameters.Add("keywords", System.Data.SqlDbType.VarChar).Value = video.Keywords == null ? string.Empty : video.Keywords;
                query.Parameters.Add("region", System.Data.SqlDbType.VarChar).Value = video.Region == null ? string.Empty : video.Region;
                query.Parameters.Add("notes", System.Data.SqlDbType.VarChar).Value = video.Notes == null ? string.Empty : video.Notes;
                query.Parameters.Add("created", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                query.Parameters.Add("modified", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                query.Parameters.Add("status", System.Data.SqlDbType.VarChar).Value = video.Status;
                query.Parameters.Add("contributor", System.Data.SqlDbType.VarChar).Value = video.Contributor;
                query.Parameters.Add("youtubeId", System.Data.SqlDbType.VarChar).Value = string.Empty;
                query.Parameters.Add("dateUploaded", System.Data.SqlDbType.DateTime).Value = video.DateUploaded;
                query.Parameters.Add("dateRemoved", System.Data.SqlDbType.DateTime).Value = video.DateRemoved;
                query.Parameters.Add("filename", System.Data.SqlDbType.VarChar).Value = filename;
                query.Parameters.Add("videoStatus", System.Data.SqlDbType.VarChar).Value = video.Status;
                recordId = query.ExecuteScalar().ToString();
                conn.Close();
            }
            catch (Exception ex)
            {
                // ExHandler.RecordError(ex);
                // must log errro
                conn.Close();
            }
            finally
            {
                conn.Dispose();
            }
            return recordId;
        }

        public static bool DoesVideoAlreadyExists(SqlConnection conn, SqlCommand query, string filename)
        {
            SqlDataReader data;
            query.CommandText = SQL_DOES_VIDEO_EXIST;
            query.Parameters.Add("name", System.Data.SqlDbType.VarChar).Value = filename;
            conn.Open();
            data = query.ExecuteReader();
            if (data.HasRows)
            {
                data.Close();
                conn.Close();
                return true;
            }
            data.Close();
            conn.Close();
            return false;

        }

        public static bool DoesVideoAlreadyExists(SqlConnection conn, SqlCommand query, SqlDataReader data, string filename, string fileType="vid")
        {
            // private const string SQL_DOES_IMG_EXIST = "SELECT TOP 1 original from latestsightings.dbo.images WHERE (original = @name)";
            ConfigureConnection(conn, query);

            query.CommandText = (fileType.ToLower() == "vid") ? SQL_DOES_VIDEO_EXIST : SQL_DOES_IMG_EXIST;
            query.Parameters.Add("name", System.Data.SqlDbType.VarChar).Value = filename;
            conn.Open();
            data = query.ExecuteReader();
            if (data.HasRows)
            {
                data.Close();
                conn.Close();
                return true;
            }
            data.Close();
            conn.Close();
            return false;

        }

        internal static string SaveImageDetails(Image image, SqlConnection conn, SqlCommand query)
        {
            string recordId = "-1";
            ConfigureConnection(conn, query);
            try
            {
                conn.Open();
                query.CommandText = SQL_INSERT_IMAGE;
                query.Parameters.Add("contributor", System.Data.SqlDbType.VarChar).Value = image.contributor;
                query.Parameters.Add("original", System.Data.SqlDbType.VarChar).Value = "not set";
                query.Parameters.Add("eightyBYeighty", System.Data.SqlDbType.VarChar).Value = "not set";
                query.Parameters.Add("dateAdded", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                query.Parameters.Add("dateModified", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                query.Parameters.Add("sixFiftyBYsixFifty", System.Data.SqlDbType.VarChar).Value = "not set";
                query.Parameters.Add("animal", System.Data.SqlDbType.VarChar).Value = image.animal;
                query.Parameters.Add("activity", System.Data.SqlDbType.VarChar).Value = image.activity;
                query.Parameters.Add("area", System.Data.SqlDbType.VarChar).Value = image.area;
                query.Parameters.Add("tags", System.Data.SqlDbType.VarChar).Value = image.tags;
                query.Parameters.Add("display", System.Data.SqlDbType.Bit).Value = 0;
                query.Parameters.Add("generalComment", System.Data.SqlDbType.VarChar).Value = image.generalComment;
                query.Parameters.Add("title", System.Data.SqlDbType.VarChar).Value = image.title;
                recordId = query.ExecuteScalar().ToString();
                query.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                // ExHandler.RecordError(ex);
                // must log errro
                conn.Close();
            }
            finally
            {
                conn.Dispose();
            }
            return recordId;
        }

        internal static List<VideoSetting> GetUserVideos(SqlConnection conn, SqlCommand query, SqlDataReader data, List<VideoSetting> userVideos, string userId)
        {
            // private const string SQL_SELECT_PERSON_VIDEOS = "Select * from latestsightings.dbo.people where (contributor = @contributor);";
            ConfigureConnection(conn, query);
            userVideos = new List<VideoSetting>();
            try
            {
                query.CommandText = SQL_SELECT_PERSON_VIDEOS;
                query.Parameters.Add("contributor", System.Data.SqlDbType.VarChar).Value = userId;
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        VideoSetting video = new VideoSetting();
                        video.Name = data["title"].ToString();
                        video.Alias = data["alias"].ToString();
                        video.RevSplit = data["revenueShare"].ToString();
                        video.Uploaded = "Y";
                        if (data["videoStatus"].ToString() == "Accepted")
                            video.Accepted = "Yes";
                        else if (data["videoStatus"].ToString() == "Declined")
                            video.Accepted = "No";
                        else
                            video.Accepted = "--";
                        userVideos.Add(video);
                    }
                    data.Close();
                    conn.Close();
                }

            }
            catch
            {
                conn.Close();
            }

            return userVideos;

        }

        internal static Person GetUserDetails(SqlConnection conn, SqlCommand query, string userID, SqlDataReader data, Person person)
        {
            // SELECT firstname, lastname, email, cellNumber, telNumber, screenName
            ConfigureConnection(conn, query);
            query.CommandText = SQL_SELECT_PERSON_BASED_ON_ID;
            query.Parameters.Add("userid", System.Data.SqlDbType.VarChar).Value = userID;
            try
            {
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    person = new Person();
                    while (data.Read())
                    {
                        person.FirstName = data["firstname"].ToString();
                        person.LastName = data["lastname"].ToString();
                        person.Email = data["email"].ToString();
                        person.CellNumber = data["cellNumber"].ToString();
                        person.TelephoneNumber = data["telNumber"].ToString();
                        if (!DBNull.Value.Equals(data["screenName"]))
                        {
                            person.username = data["screenName"].ToString();
                        }
                        else
                        {
                            person.username = string.Empty;
                        }
                    }
                }
                conn.Close();
                data.Close();
            }
            catch
            {
                // log exception 
                conn.Close();
            }
            return person;
        }

        internal static Video GetVideoRecord(SqlConnection conn, SqlCommand query, string contributor, SqlDataReader data, string videoId = "")
        {
            ConfigureConnection(conn, query);

            if (String.IsNullOrEmpty(videoId))
                query.CommandText = SQL_SELECT_USER_LASTEST_VIDEO;
            else
                query.CommandText = SQL_SELECT_USER_VIDEO;

            query.Parameters.Add("contributor", System.Data.SqlDbType.VarChar).Value = contributor;

            if (!String.IsNullOrEmpty(videoId))
                query.Parameters.Add("videoId", System.Data.SqlDbType.VarChar).Value = videoId;

            conn.Open();
            Video vid = new Video();
            try
            {
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        vid.Id = data["id"].ToString();
                        vid.Title = data["title"].ToString();
                        vid.Notes = data["notes"].ToString();
                        vid.Status = data["videoStatus"].ToString();
                        vid.filename = data["filename"].ToString();
                        vid.Contributor = data["contributor"].ToString();
                    }
                    conn.Close();
                    data.Close();
                }
            }
            catch
            {
                // log exception
                conn.Close();
            }

            conn.Close();
            return vid;
        }

        internal static bool UpdateVideoStatus(SqlConnection conn, SqlCommand query, string vidid, string vidstatus)
        {
            bool updatedStatus = false;
            ConfigureConnection(conn, query);
            query.CommandText = SQL_UPDATE_VIDEO_STATUS;
            query.Parameters.Add("videostatus", System.Data.SqlDbType.VarChar).Value = vidstatus;
            query.Parameters.Add("recordid", System.Data.SqlDbType.VarChar).Value = vidid;
            try
            {
                conn.Open();
                query.ExecuteNonQuery();
                updatedStatus = true;
            }
            catch
            {
                conn.Close();
            }
            conn.Close();
            return updatedStatus;
        }

        internal static List<DeclineVideoStatus> GetDeclineStatuses(SqlConnection conn, SqlCommand query, SqlDataReader data, List<DeclineVideoStatus> declineStatuses)
        {
            ConfigureConnection(conn, query);
            declineStatuses = new List<DeclineVideoStatus>();
            DeclineVideoStatus declineStatus;
            query.CommandText = SQL_SELECT_DECLINE_STATUSES;
            try
            {
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        declineStatus = new DeclineVideoStatus();
                        declineStatus.id = data["id"].ToString();
                        declineStatus.reason = RemoveSingleAndDoubleQuotes(data["reason"].ToString());
                        declineStatuses.Add(declineStatus);
                    }
                    data.Close();
                    conn.Close();
                }
            }
            catch
            {
                // log exception
            }
            conn.Close();
            return declineStatuses;
        }

        internal static Dictionary<string, List<string>> GetGallerySeachFilters(SqlConnection conn, SqlCommand query, SqlDataReader data, Dictionary<string, List<string>> seachFilters)
        {
            ConfigureConnection(conn, query);
            query.CommandText = SQL_SELECT_GALLERY_FILTERS;
            seachFilters = new Dictionary<string, List<string>>();
            List<string> animalsList = new List<string>();
            List<string> areasList = new List<string>();
            List<string> activityList = new List<string>();

            try
            {
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        animalsList.Add(data["animal"].ToString());
                        areasList.Add(data["area"].ToString());
                        activityList.Add(data["activity"].ToString());
                    }
                    data.Close();
                    conn.Close();
                    seachFilters.Add("animals", animalsList);
                    seachFilters.Add("areas", areasList);
                    seachFilters.Add("activity", activityList);
                }
            }
            catch
            {
                // log exception
            }
            conn.Close();
            return seachFilters;
        }


        internal static Dictionary<string, List<string>> GetVideoGallerySeachFilters(SqlConnection conn, SqlCommand query, SqlDataReader data, Dictionary<string, List<string>> seachFilters)
        {
            ConfigureConnection(conn, query);
            query.CommandText = SQL_SELECT_VIDEO_GALLERY_FILTERS;
            seachFilters = new Dictionary<string, List<string>>();
            List<string> title = new List<string>();
            List<string> keywords = new List<string>();

            try
            {
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        title.Add(data["title"].ToString());
                        keywords.Add(data["keywords"].ToString());
                    }
                    data.Close();
                    conn.Close();
                    seachFilters.Add("title", title);
                    seachFilters.Add("keywords", keywords);
                }
            }
            catch
            {
                // log exception
            }
            conn.Close();
            return seachFilters;
        }

        private static string RemoveSingleAndDoubleQuotes(string p)
        {
            p = p.Replace("'", "");
            p = p.Replace("\"", "");
            return p;
        }

        internal static Boolean AddNewDeclineVideoReason(SqlConnection conn, SqlCommand query, string reason)
        {
            ConfigureConnection(conn, query);
            Boolean status = false;
            query.CommandText = SQL_INSERT_NEW_DECLINE_VIDEO_REASON;
            query.Parameters.Add("reason", System.Data.SqlDbType.VarChar).Value = reason;
            try
            {
                conn.Open();
                query.ExecuteNonQuery();
                status = true;
            }
            catch
            {
                // log exception
            }
            conn.Close();
            return status;
        }


        internal static List<Dictionary<string, string>> GallerySearch(SqlConnection conn, SqlCommand query, SqlDataReader data, List<Dictionary<string, string>> searchResults, string areas, string animal, string activity)
        {
            ConfigureConnection(conn, query);
            searchResults = new List<Dictionary<string, string>>();
            Dictionary<string, string> results = new Dictionary<string, string>();
            string string_query = ReturnSearch(areas, animal, activity);
     
            query.CommandText = string_query;
            //query.Parameters.Add("contributor", System.Data.SqlDbType.VarChar).Value = userid;
            //query.Parameters.Add("animal", System.Data.SqlDbType.VarChar).Value = animal;
            //query.Parameters.Add("activity", System.Data.SqlDbType.VarChar).Value = activity;
            //query.Parameters.Add("area", System.Data.SqlDbType.VarChar).Value = areas;
            try
            {
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        results = new Dictionary<string, string>();
                        results.Add("type", "image");
                        results.Add("title", data["title"].ToString());
                        results.Add("filename", data["sixFiftyBYsixFifty"].ToString());
                        searchResults.Add(results);
                    }
                }
            }
            catch
            {
                // log exception
            }
            conn.Close();
            return searchResults;
        }

        private static string ReturnSearch(string areas, string animal, string activity)
        {
            areas = areas.Trim();
            animal = animal.Trim();
            activity = activity.Trim();
            string query = "SELECT sixFiftyBYsixFifty, title from latestsightings.dbo.images ";
            if (!String.IsNullOrEmpty(areas))
                    query += " Where (area like '%" + areas + "%') AND";

            if (!String.IsNullOrEmpty(animal))
                if (query.EndsWith("AND"))
                    query += " (animal LIKE '%" + animal + "%') AND";
                else
                    query += " WHERE (animal LIKE '%" + animal + "%') AND";


            if (!String.IsNullOrEmpty(activity))
                if (query.EndsWith("AND"))
                    query += " (activity like '%" + activity + "%') AND";
                else
                    query += " Where (activity like '%" + activity + "%') AND";

            
            
            query += " (display = 1)";

            return query;
        }

        public static bool subscribeToNewsletter(string email, SqlConnection conn, SqlCommand query, SqlDataReader data)
        {
            ConfigureConnection(conn, query);
            query.CommandText = SQL_DOES_EMAIL_EXIST;
            query.Parameters.Add("email", System.Data.SqlDbType.VarChar).Value = email;
            bool emailExists = false;
            try
            {
                conn.Open();
                data = query.ExecuteReader();
                if (data.HasRows)
                    emailExists = true;
                conn.Close();
                data.Close();

                if (emailExists == false)
                {
                    query.CommandText = SQL_NEWSLETTER_SUBSCRIPTION;
                    query.Parameters.Add("emailaddress", System.Data.SqlDbType.VarChar).Value = email;
                    conn.Open();
                    query.ExecuteNonQuery();
                    conn.Close();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        internal static bool UpdateFileUploadRecordDetails(SqlConnection conn, SqlCommand query, SqlDataReader data, string filename, string recordId,string fileType="vid")
        {
            ConfigureConnection(conn, query);
            bool updatedStatus = false;
            // private const string SQL_UPDATE_VIDEO = "UPDATE latestsightings.dbo.videos SET filename = @filename, videoStatus = @videostatus, status = @videostatus where (id = @videoidrecord);";
            // private const string SQL_UPDATE_IMAGES = "Update latestsightings.dbo.images SET eightyBYeighty = @filename, sixFiftyBYsixFifty = @filename, original = @filename  where (id = @recordid);";
            if (fileType.ToLower() == "vid")
            {
                query.CommandText = SQL_UPDATE_VIDEO;
                query.Parameters.Add("filename", System.Data.SqlDbType.VarChar).Value = filename;
                query.Parameters.Add("videoidrecord", System.Data.SqlDbType.VarChar).Value = recordId;
                query.Parameters.Add("videostatus", System.Data.SqlDbType.VarChar).Value = "Pending";
            }
            else
            {
                query.CommandText = SQL_UPDATE_IMAGES;
                query.Parameters.Add("filename", System.Data.SqlDbType.VarChar).Value = filename;
                query.Parameters.Add("recordid", System.Data.SqlDbType.VarChar).Value = recordId;
            }
            try
            {
                conn.Open();
                query.ExecuteNonQuery();
                updatedStatus = true;
            }
            catch
            {
                // log error
            }
            conn.Close();
            return updatedStatus;

        }

        internal static Image GetImage(string recordid, SqlConnection conn, SqlCommand query, SqlDataReader data, Image imgObj)
        {
            // private const string SQL_GET_IMAGE_BASED_ON_ID = "SELECT * FROM latestsightings.dbo.[images] where id = @imageId";
            ConfigureConnection(conn, query);
            query.CommandText = SQL_GET_IMAGE_BASED_ON_ID;
            query.Parameters.Add("imageId", System.Data.SqlDbType.Int).Value = Convert.ToInt32(recordid);
            conn.Open();
            data = query.ExecuteReader();
            if (data.HasRows)
            {
                while(data.Read())
                {
                    imgObj.activity = data["activity"].ToString();
                    imgObj.animal = data["animal"].ToString();
                    imgObj.area = data["area"].ToString();
                    imgObj.generalComment = data["generalComment"].ToString();
                    imgObj.title = data["title"].ToString();
                }
            }
            conn.Close();
            data.Close();
            return imgObj;
        }

        internal static string getImageFileName(SqlConnection conn, SqlCommand query, SqlDataReader data, string id)
        {
            string filename = "";
            ConfigureConnection(conn, query);
            query.CommandText = SQL_GET_IMAGE_BASED_ON_ID;
            query.Parameters.Add("imageId", System.Data.SqlDbType.Int).Value = Convert.ToInt32(id);
            conn.Open();
            data = query.ExecuteReader();
            if (data.HasRows)
            {
                while(data.Read())
                {
                    filename = data["original"].ToString();
                }
            }
            conn.Close();
            data.Close();
            return filename;
        }
    }
}