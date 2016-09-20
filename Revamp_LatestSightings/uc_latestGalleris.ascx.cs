using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LatestSightingsLibrary;

namespace Revamp_LatestSightings
{
    public partial class uc_latestGalleris : System.Web.UI.UserControl
    {

        protected List<GalleryItem> latestPhotos = null;
        protected List<GalleryItem> latestVideos = null;
        protected List<GalleryItem> videosAndPhotos = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetLatestPhotos();
            GetLatestVideos();
            BuildCombinationOfVideosAndPhotos();
        }

        private void GetLatestPhotos()
        {
            latestPhotos = new List<GalleryItem>();
            latestPhotos = Galleries.GetGallery(Galleries.GalleryType.Image, 8);
        }

        private void GetLatestVideos()
        {
            latestVideos = new List<GalleryItem>();
            latestVideos = Galleries.GetGallery(Galleries.GalleryType.Video, 8);
        }

        private void BuildCombinationOfVideosAndPhotos()
        {
            videosAndPhotos = new List<GalleryItem>();
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
        }
    }
}