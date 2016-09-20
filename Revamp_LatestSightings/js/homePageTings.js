function GetHomePageTings() {
    var postUrl = "/AjaxOperation.aspx/GetTings";
    $.ajax({
        type: "POST",
        url: postUrl,
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    }).done(
        function (data, textStatus, jqXHR) {
            console.log("----TINGS----");
            console.log(data.d);
            console.log(data.d.length);
            populateHomePageTingsHtml(data.d);
            populateHomePageTingsImages(data.d);
            init_portfolio_carousel();

        }
    ).fail(
        function (data, textStatus, jqXHR) {
        }
    );
}

function init_portfolio_carousel() {
    /*-------------------------------------------------*/
    /* =  portfolio OWL Carousel
	/*-------------------------------------------------*/
    try {
        $("#owl-slider").owlCarousel({
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: false,
            dots: false,
            nav: true,
            navText: ['', ''],
            items: 4,
            loop: true,
            responsive: {
                0: {
                    items: 1
                },
                787: {
                    items: 2
                },
                979: {
                    items: 3
                },
                1199: {
                    items: 4
                }
            }
        });
    } catch (err) {

    }
}


function populateHomePageTingsHtml(tings) {
    for (var i = 0; i < tings.length; i++) {
        //setTingImage(".ting" + i, tings[i].id);
        setTingTitle(".ting" + i, tings[i].title);
        setTingTimeAndPark(".ting" + i, tings[i].time, tings[i].name, tings[i].labelStatus);
        setTingAnchor(".ting" + i, tings[i].id);
    }
}

function populateHomePageTingsImages(tings) {

    setTimeout(function ()
    {
        for (var i = 0; i < tings.length; i++) {

            setTingImage(".ting" + i, tings[i].id);
        }
    }, 4000);
}

function setTingImage(control, tingId) {
    $(control + " img").removeClass("tingImage");
    $(control + " img").attr("src", "");
    $(control + " img").attr("src", "http://tingsservice.socialengine.co.za/tings/image/" + tingId)
}

function setTingTitle(control, title) {
    $(control + " h4").html(title);
}

function setTingAnchor(control, tingid) {
    $(control + " a").attr("href", "/sighting/" + tingid);
}

function setTingTimeAndPark(control, time, parkname, labelStatus) {
    $(control + " p").html(labelStatus + " @ " + time + " <br>" + parkname);
}


$(document).ready(function () {
    GetHomePageTings();
    setTimeout(function () {
        //$(".loadingImage").hide();
        $("#owl-slider").css("visibility", "visible");
    }, 1000);
});