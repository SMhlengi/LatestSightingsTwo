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

        }
    ).fail(
        function (data, textStatus, jqXHR) {
        }
    );
}


function populateHomePageTingsHtml(tings) {
    for (var i = 0; i < tings.length; i++) {
        //setTingImage(".ting" + i, tings[i].id);
        setTingTitle(".ting" + i, tings[i].title);
        setTingTimeAndPark(".ting" + i, tings[i].time);
        setTingAnchor(".ting" + i, tings[i].id);
    }
}

function populateHomePageTingsImages(tings) {

    setTimeout(function () {
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

function setTingTimeAndPark(control, time) {
    $(control + " p").html("Today @ " + time + " <br>Kruger Park <br> South Africa");
}


$(document).ready(function () {
    GetHomePageTings();
    setTimeout(function () {
        //$(".loadingImage").hide();
        $("#owl-slider").css("visibility", "visible");
    }, 1000);
});