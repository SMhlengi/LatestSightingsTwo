var PARKTINGS = [];
var imageCounter = 0;
var parkTingsLength = 0;
var park = "";

function InitializeParkTings(json, parkId) {
    PARKTINGS = json;
    park = parkId;
}

function displayPARKTINGS(index) {
    $(".sightingTingTitle").html(PARKTINGS[index].title);
    $(".tingDescription").html("");
    $(".tingDescription").append("Description: " + PARKTINGS[index].description + "<br>");
    $(".tingDescription").append("Date: " + PARKTINGS[index].time + "<br>");
    $(".tingDescription").append("Visibility: " + ReturnVisibilityStar(parseInt(PARKTINGS[index].visibility)) + " " + parseInt(PARKTINGS[index].visibility) + "/5 <br />");
    $(".tingDescription").append("Tinged by: " + PARKTINGS[index].username);
    $(".image-gallery-item img").attr("src", "http://tingsservice.socialengine.co.za/tings/image/" + PARKTINGS[index].id)
    LODGE_lat = PARKTINGS[index].latitude;
    LODGE_long = PARKTINGS[index].longitude;
}

function ReturnVisibilityStar(starsCount) {
    htmlStars = "";
    for (var i = 0; i < starsCount; i++) {
        htmlStars += '<i style="color:#ff9900;" class="fa fa-star"></i>';
    }

    return htmlStars;
}

function ReturnCounter(operation) {
    if (operation == "add"){
        if ((imageCounter + 1) != parkTingsLength) {
            imageCounter += 1;
            return imageCounter;
        } else {
            imageCounter = 0;
            return imageCounter;
        }
    } else {
        if ((imageCounter - 1) != -1) {
            imageCounter -= 1;
            return imageCounter;
        } else {
            imageCounter = parkTingsLength - 1;
            return imageCounter;
        }
    }
}

function imageNext() {
    var index = ReturnCounter("add");
    displayPARKTINGS(index);
}

function imagePrev() {
    var index = ReturnCounter("minus");
    displayPARKTINGS(index);
}

function initialize() {
    var mapOptions = {
        zoom: 13,
        center: new google.maps.LatLng(parseFloat(LODGE_lat), parseFloat(LODGE_long)),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    marker = new google.maps.Marker({
        position: map.getCenter(),
        animation: google.maps.Animation.DROP,
        map: map
    });
}


function LoadNextTing(index) {
    location.href = "/park/" + park + "/ting/" + PARKTINGS[index].id;
}

$(document).ready(function () {
    console.log("----PARKtINGS----");
    console.log(PARKTINGS);
    console.log("parkID");
    console.log(park);
    parkTingsLength = PARKTINGS.length;
    displayPARKTINGS(0);
    initialize();

    if (parkTingsLength == 2) {
        $(".owl-prev").hide();
    }

    $(".owl-next").click(function () {
        var index = ReturnCounter("add");
        LoadNextTing(index);
    });

    $(".owl-prev").click(function () {
        console.log("clicking on prev");
        imagePrev();
        initialize();
    })


});