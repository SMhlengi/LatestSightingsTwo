var TINGINFO = [];
var LODGE_lat = "";
var LODGE_long = ""

function setTingInformation(json) {
    TINGINFO = json;
}

function displayTingInfo() {
    $(".sightingTingTitle").html(TINGINFO.title)
    $(".tingDescription").append("Description: " + TINGINFO.description + "<br>");
    $(".tingDescription").append("Date: " + TINGINFO.time + "<br>");
    $(".tingDescription").append("Visibility: " + ReturnVisibilityStar(parseInt(TINGINFO.visibility)) + " " + parseInt(TINGINFO.visibility) + "/5 <br />");
    $(".tingDescription").append("Tinged by " + TINGINFO.tingUser);
    $("#lodgeImage").attr("src", "http://tingsservice.socialengine.co.za/tings/image/" + TINGINFO.tingid)
    setTimeout(function () { $("#lodgeImage").show(); }, 500);
    LODGE_lat = TINGINFO.latitude;
    LODGE_long = TINGINFO.longitude;
}


function ReturnVisibilityStar(starsCount) {
    htmlStars = "";
    for (var i = 0; i < starsCount; i++) {
        htmlStars += '<i style="color:#ff9900;" class="fa fa-star"></i>';
    }

    return htmlStars;
}

function initialize() {
    var mapOptions = {
        zoom: 9,
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


function SetNextAndPreviosTingButtons() {
    $(".owl-next").attr("href", "/park/" + TINGINFO.parkid + "/ting/" + TINGINFO.NextTingId);
    $(".owl-prev").attr("href", "/park/" + TINGINFO.parkid + "/ting/" + TINGINFO.PreviousTingId);
}

$(document).ready(function () {
    console.log("----TING INFO");
    console.log(TINGINFO);
    displayTingInfo();
    initialize();
    SetNextAndPreviosTingButtons();
});