var LATESTBLOGS = [];

function constructLatestBlogs(json) {
    LATESTBLOGS = json
    console.log("---LATEST BLOGS---");
    console.log(LATESTBLOGS);
}

function showLatestBlogs() {
    $(".loadingImage").hide();
    $("#homepageLatestBlogs").css("visibility", "visible");
}

function buildBlogsHtml() {

    var blogList = '<div class="media recent-posts">' +
			'<a href="/blog/#blogurl#" class="pull-left"><img alt="" class="media-object sixtyBySixty" src="#articleImagePath#/#pictureurl#"></a>' +
			'<div class="media-body">' +
				'<h4 class="media-heading"><a href="/blog/#blogurl#">#blogheader#</a></h4>' +
			'</div>' +
		'</div>';

    if (LATESTBLOGS.length > 0) {
        var blogshtml = "";
        for (var i = 0; i < LATESTBLOGS.length; i++) {
            blogshtml += blogList.replace(/#blogurl#/g, LATESTBLOGS[i].urlName.replace(/ /g, "_")).replace("#articleImagePath#", "http://cdn.socialengine.co.za/latestsightings/article").replace("#pictureurl#", LATESTBLOGS[i].picture).replace("#blogheader#", LATESTBLOGS[i].header);
        }

        $("#homepageLatestBlogs").prepend(blogshtml);
    }

}


$(document).ready(function () {
    console.log("---latestblogs---");
    console.log(LATESTBLOGS);
    setTimeout(function ()
    {
        buildBlogsHtml();
        showLatestBlogs();
    },
    5000);

    
});