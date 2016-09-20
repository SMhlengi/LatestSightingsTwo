$(document).ready(function () {
    var areasArray = [];
    var animalsArray = [];
    var activityArray = [];
    var titleArray = [];
    var keywordsArray = [];

    GetImageGalleryFilters()
    GetVideoGalleryFilters()

    $(function () {
        $(".youtube").YouTubeModal({ autoplay: 0, width: 640, height: 480 });
    });


    function GetImageGalleryFilters() {

        var postUrl = "/AjaxOperation.aspx/GetGalleryFilters";
        $.ajax({
            type: "POST",
            url: postUrl,            
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {                
                if (data.d != null) {
                    console.log(data.d);
                    constructAreasArray(data.d.areas);
                    constructAnimalArray(data.d.animals);
                    constructActivityArray(data.d.activity);
                }
                $(function () {
                    $("#area").autocomplete({
                        source: areasArray
                    });

                    $("#animal").autocomplete({
                        source: animalsArray
                    });

                    $("#activity").autocomplete({
                        source: activityArray
                    });
                });
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    // videoGalleryFilters
    function GetVideoGalleryFilters() {

        var postUrl = "/AjaxOperation.aspx/GetVideoGalleryFilters";
        $.ajax({
            type: "POST",
            url: postUrl,
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d != null) {
                    console.log(data.d);
                    constructTitlesArray(data.d.title);
                    constructKeywordsArray(data.d.keywords);
                }
                $(function () {
                    $("#videoTitle").autocomplete({
                        source: titleArray
                    });

                    $("#keywords").autocomplete({
                        source: keywordsArray
                    });
                });
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }
    // end of videoGalleryFilters

    function constructTitlesArray(allTitles) {
        for (var i = 0; i < allTitles.length; i++) {
            titleArray.push(allTitles[i]);
        }
    }

    function constructKeywordsArray(allKeywords) {
        for (var i = 0; i < allKeywords.length; i++) {
            keywordsArray.push(allKeywords[i]);
        }
    }

    function constructAreasArray(allAreas) {
        for (var i = 0; i < allAreas.length; i++) {
            areasArray.push(allAreas[i]);
        }
    }

    function constructAnimalArray(allAnimals) {
        for (var i = 0; i < allAnimals.length; i++) {
            animalsArray.push(allAnimals[i]);
        }
    }

    function constructActivityArray(allActivities) {
        for (var i = 0; i < allActivities.length; i++) {
            activityArray.push(allActivities[i]);
        }
    }

    $(".ResetSearchFilters").click(function () {
        $("#area").val("");
        $("#animal").val("");
        $("#activity").val("");
        $("#videoTitle").val("");
        $("#keywords").val("");
    });

    $(".FilterSearch").click(function () {
        if ($(".media-selection").val() != "Search Options") {
            RemoveAllImagesInGallerySearchResultsAndHideEachImageContainer();
            RemoveAllVideosInVideoGallerySearchResultsAndHideEachImageContainer();
            GalleryImageSearch($(".media-selection").val());
        }
    });

    function GalleryImageSearch(filterBy) {
        var postUrl = "";
        var ajaxParameters = "";
        if (filterBy == "videos") {
            ajaxParameters = "{'title' : '" + $("#videoTitle").val() + "', 'keywords' : '" + $("#keywords").val() + "'}";
            postUrl = "/AjaxOperation.aspx/VideoGalleryFilterSearch";
        } else if (filterBy == "photos") {
            ajaxParameters = "{'areas' : '" + $("#area").val() + "', 'animal' : '" + $("#animal").val() + "', 'activity' : '" + $("#activity").val() + "', 'media' : '" + "images" + "'}";
            postUrl = "/AjaxOperation.aspx/GalleryFilterSearch";
        }

        $.ajax({
            type: "POST",
            url: postUrl,
            data: ajaxParameters,
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d != null) {
                    console.log(data.d);
                    $(".galleryLatestPhotos").html("Filter Results");
                    $(".galleryLatestVideos").hide();
                    $(".galleryLatestVideos").next().hide();
                    $(".videosGalleryContainer").hide();
                    $(".imageGalleryContainer").hide("slow");
                    if (filterBy == "photos") {
                        $(".gallerySearchResults").show();
                        processImageSearchResults(data.d);
                    } else if (filterBy == "videos") {
                        $(".gallerySearchResults").hide();
                        $(".VideoGallerySearchResults").show();
                        processVideoSearchResults(data.d);
                    }
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function processImageSearchResults(images) {
        var imageCounter = 0;
        for (var i = 0; i < images.length; i++) {
            imageCounter += 1;
            img = $(".gallerySearchResults" + imageCounter).find("img")
            img.attr("src", "/UploadedImages/original/" + images[i].filename);
            anchor = $(".gallerySearchResults" + imageCounter).find("a");
            anchor.html(images[i].title);
            $(".gallerySearchResults" + imageCounter).show();
        }
    }

    function processVideoSearchResults(videos) {
        var VideoCounter = 0;
        for (var i = 0; i < videos.length; i++) {
            VideoCounter += 1;
            img = $(".VideoGallerySearchResults" + VideoCounter).find("img")
            img.attr("src", videos[i].Url);
            img.attr("rel", videos[i].YouTubeId);
            tooltip = $(".VideoGallerySearchResults" + VideoCounter).find(".team-title");
            tooltip.attr("title", videos[i].Title);
            anchor = $(".VideoGallerySearchResults" + VideoCounter).find("a");
            var title = videos[i].Title;
            if (title.length > 35) {
                anchor.html(title.substr(0, 32));
            } else {
                anchor.html(videos[i].Title);
            }
            
            $(".VideoGallerySearchResults" + VideoCounter).show();
        }
    }

    function RemoveAllImagesInGallerySearchResultsAndHideEachImageContainer() {
        var counter = 0;
        for (var i = 0; i < 24; i++) {
            counter += 1;
            imgcontainer = $(".gallerySearchResults" + counter).find("img")
            imgcontainer.attr("src", "");
            link = $(".gallerySearchResults" + counter).find("a");
            link.html("");
            $(".gallerySearchResults" + counter).hide();
        }

    }

    function RemoveAllVideosInVideoGallerySearchResultsAndHideEachImageContainer() {
        var counter = 0;
        for (var i = 0; i < 24; i++) {
            counter += 1;
            imgcontainer = $(".VideoGallerySearchResults" + counter).find("img")
            imgcontainer.attr("src", "");
            imgcontainer.attr("rel", "");
            link = $(".VideoGallerySearchResults" + counter).find("a");
            link.html("");
            tooltip = $(".VideoGallerySearchResults" + counter).find(".team-title");
            tooltip.attr("title", "");
            $(".VideoGallerySearchResults" + counter).hide();
        }

    }

    $(".gallerySearchResults .triggerAnimation").click(function () {
        var imgSrc = $(this).find("img").attr("src");
        $(".popup_ex").find(".portfolio-featured-image").find("img").attr("src", imgSrc);
        $("#over_lay").show();
        $(".popup_ex").show();

        $(".popup_ex").find(".fa-times-circle").click(function () {
            $("#over_lay").hide();
            $(".popup_ex").hide();
        });
    });

    //$(".fa-times-circle").click(function () {
    //    $(this).find("#over_lay").hide();
    //    $(this).find(".popup_ex").hide();
    //});

    $(".filterImage").click(function () {
        var imageId = $(this).find("#hiddenImageId").val();
        var imgSrc = $(this).find("img").attr("src");
        $(".latestGalleryImage" + imageId).find(".portfolio-featured-image").find("img").attr("src", imgSrc);
        $(".latestGalleryImage" + imageId).find("#over_lay").show();
        $(".latestGalleryImage" + imageId).find(".popup_ex").show();

        closeImageDialog(imageId);
    });

    $(".media-selection").change(function () {
        var itemChoosen = $(".media-selection").val();
        if (itemChoosen == "videos") {
            $("#gallerySearch").hide();
            $("#videoSearch").show();
        } else if (itemChoosen == "photos") {
            $("#videoSearch").hide();
            $("#gallerySearch").show();
        }
    });

    $(".Uploadyourown").click(function () {
        location.href = "/login";
    });


    function closeImageDialog(id) {
        $(".latestGalleryImage" + id).find(".fa-times-circle").click(function () {
            $(".latestGalleryImage" + id).find("#over_lay").hide();
            $(".latestGalleryImage" + id).find(".popup_ex").hide();
        });
    }
});