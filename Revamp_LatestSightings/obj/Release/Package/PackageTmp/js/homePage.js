$(document).ready(function () {

    $(function () {
        $(".youtube").YouTubeModal({ autoplay: 0, width: 640, height: 480 });
    });

    $("#justpics").click(function () {
        $(".latestGalleriesPicsAndVideos").hide();
        $(".latestGalleriesJustVideos").hide();
        $(".latestGalleriesJustPics").show();
    })

    $("#justvideos").click(function () {
        $(".latestGalleriesJustPics").hide();
        $(".latestGalleriesPicsAndVideos").hide();
        $(".latestGalleriesJustVideos").show();
    });

    $("#showall").click(function () {
        $(".latestGalleriesJustPics").hide();
        $(".latestGalleriesJustVideos").hide();
        $(".latestGalleriesPicsAndVideos").show();
    });

    //$(".filterImage").click(function () {
    //    var imgSrc = $(this).find("img").attr("src");
    //    $(".popup_ex").find(".portfolio-featured-image").find("img").attr("src", imgSrc);
    //    $("#over_lay").show();
    //    $(".popup_ex").show();
    //});

    $(".filterImage").click(function () {
        var imageId = $(this).find("#hiddenImageId").val();
        var imgSrc = $(this).find("img").attr("src");
        $(".latestGalleryImage" + imageId).find(".portfolio-featured-image").find("img").attr("src", imgSrc);
        $(".latestGalleryImage" + imageId).find("#over_lay").show();
        $(".latestGalleryImage" + imageId).find(".popup_ex").show();

        closeImageDialog(imageId);
    });

    function closeImageDialog(id) {
        $(".latestGalleryImage" + id).find(".fa-times-circle").click(function () {
            $(".latestGalleryImage" + id).find("#over_lay").hide();
            $(".latestGalleryImage" + id).find(".popup_ex").hide();
        });
    }

});