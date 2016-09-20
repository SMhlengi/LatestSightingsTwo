var LATESTGALLERIES = [];

function setLattestGalleries(json) {
    LATESTGALLERIES = json;
}

function populatePicsAndVideosTab() {
    for (var i = 0; i < $(".latestGalleriesPicsAndVideos .row .col-md-3").length; i++) {
        if (i % 2 == 0) { // dealing with videos
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find(".youtube").attr("rel", LATESTGALLERIES.photosAndVideos[i].YouTubeId);
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find(".youtube").attr("src", LATESTGALLERIES.photosAndVideos[i].Url2);
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find(".team-title").attr("title", LATESTGALLERIES.photosAndVideos[i].Title);
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find(".team-title").html("<h5><a href='#'>" + LATESTGALLERIES.photosAndVideos[i].Title + "</a></h5>")
        } else { // dealing with images
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find("input").attr("value", LATESTGALLERIES.photosAndVideos[i].Id);
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find("img").attr("src", "/UploadedImages/650x650/" + LATESTGALLERIES.photosAndVideos[i].Url);
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find(".team-title").attr("title", LATESTGALLERIES.photosAndVideos[i].Title);
            $($(".latestGalleriesPicsAndVideos .row .col-md-3")[i]).find(".team-title").html("<h5><a href='#'>" + LATESTGALLERIES.photosAndVideos[i].Title + "</a></h5>")
        }
    }
}

function populatePics() {
    var pictureList = "";
    var pic = '<div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage #clearLeft#">' +
                    '<input type="hidden" id="hiddenImageId" value="#photoId#" />' +
                    '<div class="team-member triggerAnimation animated pics" data-animate="fadeInUp">' +
                        '<div class="team-info">' +
                            '<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>' +
                            '<img alt="" src="/UploadedImages/650x650/#photoUrl#" class="galleryImage">' +

                        '</div>' +
                        '<div class="team-title" title="#photoTitle#">' +
                                '<h5><a href="#">#photoTitle2#</a></h5>' +
                        '</div>' +
                    '</div>' +
                '</div>';

    for (var i = 0; i < LATESTGALLERIES.photos.length; i++) {
        if (i == 4) {
            pictureList += pic.replace("#photoId#", LATESTGALLERIES.photos[i].Id).replace("#photoUrl#", LATESTGALLERIES.photos[i].Url).replace("#photoTitle#", LATESTGALLERIES.photos[i].Title).replace("#photoTitle2#", LATESTGALLERIES.photos[i].Title).replace("#clearLeft#", "clearLeft");
        } else {
            pictureList += pic.replace("#photoId#", LATESTGALLERIES.photos[i].Id).replace("#photoUrl#", LATESTGALLERIES.photos[i].Url).replace("#photoTitle#", LATESTGALLERIES.photos[i].Title).replace("#photoTitle2#", LATESTGALLERIES.photos[i].Title).replace("#clearLeft#", "");
        }
    }

    $(".latestGalleriesJustPics .row").html(pictureList);
}

function populateVids() {
    var videoList = "";
    var vid = '<div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 #clearLeft#">' +
                '<div class="team-member triggerAnimation animated videos" data-animate="fadeInUp">' +
                    '<div class="team-info">' +
                        '<div class="related-gallery-icon"><i class="fa fa-play"></i></div>' +
                        '<img class="youtube" rel="#YouTubeId#" src="#videoUrl2#">' +

                    '</div>' +
                    '<div class="team-title" title="#Title#">' +
                            '<h5><a href="#">#Title2#</a></h5>' +
                    '</div>' +
                '</div>' +
            '</div>';

    for (var i = 0; i < LATESTGALLERIES.videos.length; i++) {
        if (i == 4) {
            videoList += vid.replace("#YouTubeId#", LATESTGALLERIES.videos[i].YouTubeId).replace("#videoUrl2#", LATESTGALLERIES.videos[i].Url2).replace("#Title#", LATESTGALLERIES.videos[i].Title).replace("#Title2#", LATESTGALLERIES.videos[i].Title).replace("#clearLeft#", "clearLeft");
        } else {
            videoList += vid.replace("#YouTubeId#", LATESTGALLERIES.videos[i].YouTubeId).replace("#videoUrl2#", LATESTGALLERIES.videos[i].Url2).replace("#Title#", LATESTGALLERIES.videos[i].Title).replace("#Title2#", LATESTGALLERIES.videos[i].Title).replace("#clearLeft#", "");
        }
    }

    $(".latestGalleriesJustVideos .row").html(videoList);
}


$(document).ready(function () {
    console.log("----LatestGalleries----");
    console.log(LATESTGALLERIES);
    if (LATESTGALLERIES != 0) {
        populatePicsAndVideosTab();
        populatePics();
        populateVids();
        $(".latestGalleriesPicsAndVideos").css("visibility", "visible");
        $(".galleryloadingImage").hide();
    }
});