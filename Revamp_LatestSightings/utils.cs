using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Configuration;
using DotNetHelpers.UltimateImageResizer;

namespace Revamp_LatestSightings
{
    public class utils
    {
        public static void SendSuccessfullyRegisteredMail(string firstname, string lastname, string emailAddress, string url)
        {
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", emailAddress);
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                message.Subject = "Successfully Registered with Latest Sightings";
                message.IsBodyHtml = true;
                string emailMessage = ReturnRegistrationMail(firstname, lastname, emailAddress);

                message.Body = emailMessage;
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
            }
        }

        public static bool SendContactUsMail(string name, string emailAddress, string messageDetails)
        {
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", ConfigurationManager.AppSettings["contactUsEmailAddress"]);
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                message.Subject = "Contact Us Message";
                message.IsBodyHtml = true;
                string emailMessage = ReturnContactUsMessage(name, emailAddress, messageDetails);

                message.Body = emailMessage;
                smtpClient.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private static string ReturnContactUsMessage(string firstname, string emailaddress, string message)
        {
            string EmailMessage = "";

            EmailMessage += "<html>" + Environment.NewLine;
            EmailMessage += "<head>" + Environment.NewLine;
            EmailMessage += "<style>" + Environment.NewLine;
            EmailMessage += "body { margin: 10px; }" + Environment.NewLine;
            EmailMessage += "body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}" + Environment.NewLine;
            EmailMessage += "</style>" + Environment.NewLine;
            EmailMessage += "</head>" + Environment.NewLine;
            EmailMessage += "<body style\"margin: 5px 0 0 0;\">" + Environment.NewLine;

            // new code 
            EmailMessage += "Howzit, My Name is " + firstname + " <br />";
            EmailMessage += "Email Address:  " + emailaddress + " <br /><br />";
            EmailMessage +=  message + "<br /><br />";
            // end of new code 
            EmailMessage += "</body>" + Environment.NewLine;
            EmailMessage += "</html>";

            return EmailMessage;
        }

        private static string ReturnRegistrationMail(string firstname, string lastname, string emailaddress)
        {
            string EmailMessage = "";

            EmailMessage += "<html>" + Environment.NewLine;
            EmailMessage += "<head>" + Environment.NewLine;
            EmailMessage += "<style>" + Environment.NewLine;
            EmailMessage += "body { margin: 10px; }" + Environment.NewLine;
            EmailMessage += "body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}" + Environment.NewLine;
            EmailMessage += "</style>" + Environment.NewLine;
            EmailMessage += "</head>" + Environment.NewLine;
            EmailMessage += "<body style\"margin: 5px 0 0 0;\">" + Environment.NewLine;

            // new code 
            EmailMessage += "Howzit " + firstname + " <br /><br />";
            EmailMessage += " Welcome to the Latest Sightings partner programme! You have successfully registered as a video contributor. We look forward to receiving your amazing wildlife videos! <br /><br />";
            EmailMessage += "You can login to your account <a href='http://lscms2.socialengine.co.za/'> here </a> with your username ( " + emailaddress + " ). <br /><br />";
            EmailMessage += "The way it works from here is:<br />";
            EmailMessage += "<ol>";
            EmailMessage += "<li> Login and upload your amazing footage <a href='http://lscms2.socialengine.co.za/'> here </a></li>";
            EmailMessage += "<li> We'll check it out and see if we can use it.</li>";
            EmailMessage += "<li> We'll then let you know whether it's been selected to go onto our channel. This might take some time. Once selected it might also be a while before your video goes live.</li>";
            EmailMessage += "<li> We will update you along the way and you can always log into your account to check the status.</li>";
            EmailMessage += "<li> At this point we will ask you to update your banking details or PayPal account.</li>";
            EmailMessage += "<li> Once live you can sit back, relax and watch your earnings grow!</li>";
            EmailMessage += "<li> Go on another safari and grab more amazing footage. </li> </ol><br />";
            EmailMessage += "You can find some useful tips on shooting better videos <a href='http://vimeo.com/videoschool/101'> here. </a> <br /><br />";
            EmailMessage += "Check out what works by going to the YouTube channel <a href='https://www.youtube.com/user/Animatedcams'> here. </a> <br /><br />";
            EmailMessage += "Please visit us at http://www.latestsightings.com/" + ReturnEmailSignature();
            // end of new code 
            EmailMessage += "</body>" + Environment.NewLine;
            EmailMessage += "</html>";

            return EmailMessage;
        }

        public static bool SendForgottonPasswordEmail(string emailAddress, string userId = "")
        {
            if (!String.IsNullOrEmpty(userId))
            {
                bool mailSent = false;
                string url = ConfigurationManager.AppSettings["forgottenPasswordUrlUsingUserID"].ToString();
                url += userId;
                try
                {
                    MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", emailAddress);
                    SmtpClient smtpClient = new SmtpClient();
                    smtpClient.Port = 25;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Host = "freeza.aserv.co.za";
                    NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                    smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                    message.Subject = "Latest Sightings Reset Password";
                    message.IsBodyHtml = true;
                    string emailMessage = ReturnResetPasswordMail(url);

                    message.Body = emailMessage;
                    smtpClient.Send(message);
                    mailSent = true;
                }
                catch (Exception ex)
                {
                }
                return mailSent;
            }
            else
            {
                bool mailSent = false;
                string url = ConfigurationManager.AppSettings["forgottenPasswordUrl"].ToString();
                url += emailAddress;
                try
                {
                    MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", emailAddress);
                    SmtpClient smtpClient = new SmtpClient();
                    smtpClient.Port = 25;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Host = "freeza.aserv.co.za";
                    NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                    smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                    message.Subject = "Latest Sightings Reset Password";
                    message.IsBodyHtml = true;
                    string emailMessage = ReturnResetPasswordMail(url);

                    message.Body = emailMessage;
                    smtpClient.Send(message);
                    mailSent = true;
                }
                catch (Exception ex)
                {
                }
                return mailSent;
            }
        }

        private static string ReturnResetPasswordMail(string url)
        {
            string EmailMessage = "";

            EmailMessage += "<html>" + Environment.NewLine;
            EmailMessage += "<head>" + Environment.NewLine;
            EmailMessage += "<style>" + Environment.NewLine;
            EmailMessage += "body { margin: 10px; }" + Environment.NewLine;
            EmailMessage += "body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}" + Environment.NewLine;
            EmailMessage += "</style>" + Environment.NewLine;
            EmailMessage += "</head>" + Environment.NewLine;
            EmailMessage += "<body style\"margin: 5px 0 0 0;\">" + Environment.NewLine;
            EmailMessage += "Howzit <br /><br />";
            EmailMessage += "Please click on the below link to reset your password <br />" + url;
            EmailMessage += ReturnEmailSignature();
            EmailMessage += "</body>" + Environment.NewLine;
            EmailMessage += "</html>";

            return EmailMessage;
        }

        public static bool SendVideoEmailLinkToAdministrator(string userid, string fullname, string title, string videoId)
        {
            bool mailSent = false;
            string url = ConfigurationManager.AppSettings["viewVideoUrl"].ToString();
            url += string.Format("{0}&video={1}", userid, videoId);
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", ConfigurationManager.AppSettings["videoAdministratorEmailAddress"].ToString());
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                message.Subject = "New Video Upload called " + title;

                string str = "Howzit" + Environment.NewLine + Environment.NewLine +
                             fullname + " has uploaded a video. " + Environment.NewLine + Environment.NewLine +
                             "Title : " + title + Environment.NewLine + Environment.NewLine +
                             "Please click on the below link to view / download the video." + Environment.NewLine + Environment.NewLine +
                             url;

                message.Body = str;
                smtpClient.Send(message);
                mailSent = true;
            }
            catch (Exception ex)
            {
            }
            return mailSent;
        }

        public static string AddTwoStrings(string one, string two)
        {
            return one + " " + two;
        }

        /// <summary>
        /// Gets the MIME type of the file name specified based on the file name's
        /// extension.  If the file's extension is unknown, returns "octet-stream"
        /// generic for streaming file bytes.
        /// </summary>
        /// <param name="sFileName">The name of the file for which the MIME type
        /// refers to.</param>
        public static string GetMimeTypeByFileName(string sFileName)
        {
            string sMime = "application/octet-stream";

            string sExtension = System.IO.Path.GetExtension(sFileName);
            if (!string.IsNullOrEmpty(sExtension))
            {
                sExtension = sExtension.Replace(".", "");
                sExtension = sExtension.ToLower();

                if (sExtension == "pdf")
                {
                    sMime = "application/pdf";
                }
                else if (sExtension == "webm")
                {
                    sMime = "video/webm";
                }
                else if (sExtension == "flv")
                {
                    sMime = "video/x-flv";
                }
                else if (sExtension == "ogv")
                {
                    sMime = "video/ogg";
                }
                else if (sExtension == "ogg")
                {
                    sMime = "video/ogg";
                }
                else if (sExtension == "avi")
                {
                    sMime = "video/x-msvideo";
                }
                else if (sExtension == "wmv")
                {
                    sMime = "video/x-ms-wmv";
                }
                else if (sExtension == "mp4")
                {
                    sMime = "video/mp4";
                }
                else if (sExtension == "m4v")
                {
                    sMime = "video/mp4";
                }
                else if (sExtension == "mpg")
                {
                    sMime = "video/mpeg";
                }
                else if (sExtension == "mpeg")
                {
                    sMime = "video/mpeg";
                }
                else if (sExtension == "mpe")
                {
                    sMime = "video/mpeg";
                }
                else if (sExtension == "svi")
                {
                    sMime = "video/x-msvideo";
                }
                else if (sExtension == "mov")
                {
                    sMime = "video/quicktime";
                }
            }

            return sMime;
        }

        /// <summary>
        /// Streams the bytes specified as a file with the name specified using HTTP to the 
        /// calling browser.
        /// </summary>
        /// <param name="sFileName">The name of the file as it will apear when the user
        /// clicks either open or save as in their browser to accept the file
        /// download.</param>
        /// <param name="fileBytes">The file as a byte array to be streamed.</param>
        public static void StreamFileToBrowser(string sFileName, byte[] fileBytes)
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            context.Response.Clear();
            context.Response.ClearHeaders();
            context.Response.ClearContent();
            context.Response.AppendHeader("content-length", fileBytes.Length.ToString());
            context.Response.ContentType = GetMimeTypeByFileName(sFileName);
            context.Response.AppendHeader("content-disposition", "attachment; filename=" + sFileName);
            context.Response.BinaryWrite(fileBytes);

            // use this instead of response.end to avoid thread aborted exception (known issue):
            // http://support.microsoft.com/kb/312629/EN-US
            context.ApplicationInstance.CompleteRequest();
        }

        internal static void SendAcceptedVideoEmail(string useremail, string filename, string firstname)
        {
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", useremail);
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                message.Subject = "Latest Sightings Video Upload";
                message.IsBodyHtml = true;
                string emailMessage = ReturnAcceptedVideoEmail(firstname, filename);

                message.Body = emailMessage;
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
            }
        }

        private static string ReturnAcceptedVideoEmail(string firstname, string filename)
        {
            string EmailMessage = "";

            EmailMessage += "<html>" + Environment.NewLine;
            EmailMessage += "<head>" + Environment.NewLine;
            EmailMessage += "<style>" + Environment.NewLine;
            EmailMessage += "body { margin: 10px; }" + Environment.NewLine;
            EmailMessage += "body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}" + Environment.NewLine;
            EmailMessage += "</style>" + Environment.NewLine;
            EmailMessage += "</head>" + Environment.NewLine;
            EmailMessage += "<body style\"margin: 5px 0 0 0;\">" + Environment.NewLine;

            EmailMessage += "Howzit " + firstname + " <br /><br />";
            EmailMessage += "Great news, your video <strong>" + filename + "</strong> has been accepted. We are editing it and queueing it for publication. This might take some time.<br />Please be patient. We will let you know when it is online.";
            EmailMessage += "<br />Please note that only once your video is online, we will ask you to log in to provide your banking details. You will also then be able to start viewing your earnings.";
            EmailMessage += ReturnEmailSignature();
            EmailMessage += "</body>" + Environment.NewLine;
            EmailMessage += "</html>";

            return EmailMessage;
        }

        internal static void SendDeclineEmailMessage(string useremail, string filename, string firstname, string declindedOptions, string adviceSuggestions)
        {
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", useremail);
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                message.Subject = "Latest Sightings Video Upload ";
                message.IsBodyHtml = true;
                string emailMessage = ReturnDeclineVideoMail(firstname, declindedOptions, adviceSuggestions, filename);

                message.Body = emailMessage;
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
            }
        }

        private static string ReturnDeclineVideoMail(string firstname, string declindedOptions, string adviceSuggestions, string filename)
        {
            string EmailMessage = "";

            EmailMessage += "<html>" + Environment.NewLine;
            EmailMessage += "<head>" + Environment.NewLine;
            EmailMessage += "<style>" + Environment.NewLine;
            EmailMessage += "body { margin: 10px; }" + Environment.NewLine;
            EmailMessage += "body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}" + Environment.NewLine;
            EmailMessage += "</style>" + Environment.NewLine;
            EmailMessage += "</head>" + Environment.NewLine;
            EmailMessage += "<body style\"margin: 5px 0 0 0;\">" + Environment.NewLine;

            // new code 
            EmailMessage += "Howzit " + firstname + " <br /><br />";
            EmailMessage += " We regret to inform you that your video <strong> " + filename + "</strong> has been declined ";
            if (!String.IsNullOrEmpty(declindedOptions))
            {
                EmailMessage += "for the following reasons. <br />";
                EmailMessage += "<ol>";
                string[] reasons = declindedOptions.Split(':');
                Array.Resize(ref reasons, reasons.Length - 1);

                foreach (var reason in reasons)
                {
                    EmailMessage += "<li>" + reason + "</li>";
                }
                EmailMessage += "</ol><br />";
            }

            if (!String.IsNullOrEmpty(adviceSuggestions))
            {
                EmailMessage += adviceSuggestions;
            }
            EmailMessage += "<br /><br />Should you wish to discuss this further, please get in touch with us by emailing <strong>videos@latestsightings.com.</strong><br /><br />";
            EmailMessage += "Keep on sending in your videos.";
            EmailMessage += ReturnEmailSignature();
            EmailMessage += "</body>" + Environment.NewLine;
            EmailMessage += "</html>";

            return EmailMessage;
        }

        private static string ReturnEmailSignature()
        {
            return "<br /><br /> Warm regards <br />The Latest Sightings Team";
        }

        public static string FullyQualifiedMonthName(int intMonth)
        {
            switch (intMonth)
            {
                case 1: 
                    return "January";
                case 2:
                    return "February";
                case 3:
                    return "March";
                case 4:
                    return "April";
                case 5:
                    return "May";
                case 6:
                    return "June";
                case 7:
                    return "July";
                case 8:
                    return "August";
                case 9:
                    return "September";
                case 10:
                    return "October";
                case 11:
                    return "November";
                case 12:
                    return "December";
                default:
                    return "January";
            }
        }

        public static Dictionary<string, string> CleanUpArticleForBloglist(Dictionary<string, string> CateogryArticle)
        {
            if (IsMicrosoftWordGeneratedArticle(CateogryArticle["body"]))
            {
                CateogryArticle = CleanUpWordArticle(CateogryArticle);
                return CateogryArticle;
            }
            else if (DoesArticleContainIframe(CateogryArticle["body"]))
            {
                CateogryArticle = CleanUpArticleWithIframe(CateogryArticle);
                return CateogryArticle;
            }
            else
            {
                CateogryArticle = CleanupNormalArticle(CateogryArticle);
                return CateogryArticle;
            }

            CateogryArticle["body"] = CateogryArticle["body"].Remove(0, 2);
            int startIndex = CateogryArticle["body"].IndexOf('>');
            //if (startIndex == 0)
            //{
            //    CateogryArticle["body"] = CateogryArticle["body"].Remove(0, 2);
            //    startIndex = CateogryArticle["body"].IndexOf('>');
            //}
            int endIndex = CateogryArticle["body"].IndexOf('<');
            int substract = endIndex - startIndex;
            CateogryArticle["body"] = CateogryArticle["body"].Substring(startIndex + 1, substract - 1);
            if (CateogryArticle["body"].Length > 84)
                CateogryArticle["body"] = CateogryArticle["body"].Substring(0, 80) + " [...]";
            else
                CateogryArticle["body"] += " [...]";
            return CateogryArticle;
        }

        private static Dictionary<string, string> CleanupNormalArticle(Dictionary<string, string> CateogryArticle)
        {
            string article = CateogryArticle["body"].Substring(0, 320);
            article = RemoveHtmlTags(article);
            article = article.Trim();
            CateogryArticle["body"] = article + "....";
            return CateogryArticle;
        }

        private static Dictionary<string, string> CleanUpArticleWithIframe(Dictionary<string, string> CateogryArticle)
        {
            int indexOfFirstClosingParagraphTag = CateogryArticle["body"].IndexOf("</iframe></p>");
            if (indexOfFirstClosingParagraphTag != -1)
            {
                CateogryArticle["body"] = CateogryArticle["body"].Substring(indexOfFirstClosingParagraphTag + 13, 220);
                CateogryArticle["body"] = RemoveHtmlTags(CateogryArticle["body"]);
                CateogryArticle["body"] += "....";
                return CateogryArticle;
            }
            else
            {
                indexOfFirstClosingParagraphTag = CateogryArticle["body"].IndexOf("</iframe>");
                CateogryArticle["body"] = CateogryArticle["body"].Substring(indexOfFirstClosingParagraphTag + 9, 220);
                CateogryArticle["body"] = RemoveHtmlTags(CateogryArticle["body"]);
                CateogryArticle["body"] += "....";
                return CateogryArticle;
            }
        }

        private static Dictionary<string,string> CleanUpWordArticle(Dictionary<string, string> CateogryArticle)
        {
            int lastAccuranceOfEndIf = CateogryArticle["body"].LastIndexOf("<![endif]--></p>");
            string articleBody = CateogryArticle["body"].Substring(lastAccuranceOfEndIf + 16);
            if (articleBody != "")
            {
                string closingParagraphTag = "</p>";
                int firstAccuraceOfClosingParagraphTag = articleBody.IndexOf(closingParagraphTag);
                string articleFirstParagraph = articleBody.Substring(0, firstAccuraceOfClosingParagraphTag + 4);
                CateogryArticle["body"] = articleFirstParagraph + "....";
                return CateogryArticle;
            }
            else
            {
                CateogryArticle["body"] = ""; // bad article
                return CateogryArticle;
            }
        }

        private static string RemoveHtmlTags(string article)
        {
            return article.Replace("<p>", "").Replace("</p>", "").Replace("&nbsp;","");
        }

        private static bool DoesArticleContainIframe(string article)
        {
            if (article.Contains("iframe"))
                return true;
            return false;
        }

        private static bool IsMicrosoftWordGeneratedArticle(string articleBody)
        {
            if (articleBody.Contains("<![endif]--></p>"))
                return true;
            return false;
        }

        internal static bool SendEnquireMail(string name, string email, string country, string tel, string dateOfTravel, string numberOfAdults, string numberOfChildren, string specialRequest, string numberofnightstravelled, string EnquiredLodgeName)
        {
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", ConfigurationManager.AppSettings["contactUsEmailAddress"]);
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                message.Subject = "Enquire Form | " + EnquiredLodgeName;
                message.IsBodyHtml = true;
                string emailMessage = ReturnEnquireFormMessage(name, email, country, tel, dateOfTravel, numberOfAdults, numberOfChildren, specialRequest, numberofnightstravelled);

                message.Body = emailMessage;
                smtpClient.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private static string ReturnEnquireFormMessage(string name, string email, string country, string tel, string dateOfTravel, string numberOfAdults, string numberOfChildren, string specialRequest, string numberofnightstravelled)
        {
            string EmailMessage = "";

            EmailMessage += "<html>" + Environment.NewLine;
            EmailMessage += "<head>" + Environment.NewLine;
            EmailMessage += "<style>" + Environment.NewLine;
            EmailMessage += "body { margin: 10px; }" + Environment.NewLine;
            EmailMessage += "body { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}" + Environment.NewLine;
            EmailMessage += "</style>" + Environment.NewLine;
            EmailMessage += "</head>" + Environment.NewLine;
            EmailMessage += "<body style\"margin: 5px 0 0 0;\">" + Environment.NewLine;

            // new code 
            EmailMessage += "Howzit, My Name is " + name + " <br /><br />";
            EmailMessage += "<strong>Email: </strong> " + email + " <br />";
            EmailMessage += "<strong>Country: </strong> " + country + " <br />";
            if (String.IsNullOrEmpty(tel))
                EmailMessage += "<strong>Telephone: </strong> " + "Not Specified" + " <br />";
            else
                EmailMessage += "<strong>Telephone: </strong> " + tel + " <br />";
            
            if (String.IsNullOrEmpty(dateOfTravel))
                EmailMessage += "<strong>Date of travel: </strong> " + "Not Specified" + " <br />";
            else
                EmailMessage += "<strong>Date of travel: </strong> " + dateOfTravel + " <br />";

            if (String.IsNullOrEmpty(numberOfAdults))
                EmailMessage += "<strong>Number of adults: </strong> " + "Not Specified" + " <br />";
            else
                EmailMessage += "<strong>Number of adults: </strong> " + numberOfAdults + " <br />";

            if (String.IsNullOrEmpty(numberOfChildren))
                EmailMessage += "<strong>Number of children: </strong> " + "Not Specified" + " <br />";
            else
                EmailMessage += "<strong>Number of children: </strong> " + numberOfChildren + " <br />";

            if (String.IsNullOrEmpty(numberofnightstravelled))
                EmailMessage += "<strong>Number of nights travelled: </strong> " + "Not Specified" + " <br />";
            else
                EmailMessage += "<strong>Number of nights travelled: </strong> " + numberofnightstravelled + " <br />";

            if (String.IsNullOrEmpty(specialRequest))
                EmailMessage += "<strong>Special requests: </strong> " + "Not Specified" + " <br />";
            else
                EmailMessage += "<strong>Special requests: </strong> " + specialRequest + " <br />";

            EmailMessage += "<br />Thank you";
            // end of new code 
            EmailMessage += "</body>" + Environment.NewLine;
            EmailMessage += "</html>";

            return EmailMessage;
        }

        public static string ConvertToDateTimeFormat(string p)
        {
            string format = "ddd d MMM HH:mm";
            DateTime tingDate = DateTime.Parse(p);
            return tingDate.ToString(format);

        }

        public static string SendEmailToAdministratorTheVideoDetailsHaveBeenCaptured(Person userDetails, string title)
        {
            string mailSent = "false";
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", ConfigurationManager.AppSettings["videoAdministratorEmailAddress"].ToString());
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                message.Subject = "Video details captured";

                string str = "Hey team" + Environment.NewLine + Environment.NewLine;
                str += "Looks like ";
                str += (string.IsNullOrEmpty(userDetails.username)) ? userDetails.FirstName : userDetails.username;
                str += " has captured the following details for a file upload. " + Environment.NewLine + Environment.NewLine +
                "Title : " + title + Environment.NewLine + Environment.NewLine +
                "If you don't receive a video preview email soon, you best get in touch with ";

                str += (string.IsNullOrEmpty(userDetails.username)) ? userDetails.FirstName : userDetails.username;
                str += " using the following details;" + Environment.NewLine + Environment.NewLine +
                 userDetails.FirstName + " " + userDetails.LastName + Environment.NewLine +
                 userDetails.Email + Environment.NewLine +
                 userDetails.CellNumber + Environment.NewLine +
                 userDetails.TelephoneNumber;

                message.Body = str;
                smtpClient.Send(message);
                mailSent = "true";
            }
            catch (Exception ex)
            {
            }
            return mailSent;
        }

        public static string SendEmailToAdministratorAboutImageRecordCaptured(Person userDetails, Image imageObj, string type = "imageDetailsCaptured", string recordId = "")
        {
            string mailSent = "false";
            try
            {
                MailMessage message = new MailMessage("No-Reply@lscms.socialengine.co.za", ConfigurationManager.AppSettings["videoAdministratorEmailAddress"].ToString());
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Port = 25;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Host = "freeza.aserv.co.za";
                NetworkCredential networkCredential = new NetworkCredential("No-Reply@socialengine.co.za", "N0-R3ply");
                smtpClient.Credentials = (ICredentialsByHost)networkCredential;
                string str = "";

                if (type == "imageDetailsCaptured")
                {
                    message.Subject = "Image details captured";

                    str = "Hey team" + Environment.NewLine + Environment.NewLine;
                    str += "Looks like ";
                    str += (string.IsNullOrEmpty(userDetails.username)) ? userDetails.FirstName : userDetails.username;
                    str += " has captured the following details for a image upload. " + Environment.NewLine + Environment.NewLine +
                    "Title : " + imageObj.title + Environment.NewLine +
                    "Animal : " + imageObj.animal + Environment.NewLine +
                    "Activity : " + imageObj.activity + Environment.NewLine +
                    "Area : " + imageObj.area + Environment.NewLine +
                    "Tags : " + imageObj.tags + Environment.NewLine +
                    "Comment : " + imageObj.generalComment + Environment.NewLine + Environment.NewLine +
                    "If you don't receive a image preview email soon, you best get in touch with ";

                    str += (string.IsNullOrEmpty(userDetails.username)) ? userDetails.FirstName : userDetails.username;
                    str += " using the following details;" + Environment.NewLine + Environment.NewLine +
                     userDetails.FirstName + " " + userDetails.LastName + Environment.NewLine +
                     userDetails.Email + Environment.NewLine +
                     userDetails.CellNumber + Environment.NewLine +
                     userDetails.TelephoneNumber;
                }
                else if (type == "imagePreview")
                {
                    message.Subject = "Image Preview";
                    string url = ConfigurationManager.AppSettings["imagePreviewUrl"].ToString();
                    url += recordId;

                    str = "Hey team" + Environment.NewLine + Environment.NewLine;
                    str += "Looks like ";
                    str += (string.IsNullOrEmpty(userDetails.username)) ? userDetails.FirstName : userDetails.username;
                    str += " has uploaded the following image for a preview. " + Environment.NewLine +
                    url + Environment.NewLine + Environment.NewLine + "Details are as follows " + Environment.NewLine +
                    "Title : " + imageObj.title + Environment.NewLine +
                    "Animal : " + imageObj.animal + Environment.NewLine +
                    "Activity : " + imageObj.activity + Environment.NewLine +
                    "Area : " + imageObj.area + Environment.NewLine +
                    "Tags : " + imageObj.tags + Environment.NewLine +
                    "Comment : " + imageObj.generalComment + Environment.NewLine + Environment.NewLine;

                }

                message.Body = str;
                smtpClient.Send(message);
                mailSent = "true";
            }
            catch (Exception ex)
            {
            }
            return mailSent;
        }
    }
}