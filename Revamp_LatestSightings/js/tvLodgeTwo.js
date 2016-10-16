// Page Aspect Ratio ------------------------------

// Script credit: http://stackoverflow.com/users/1902943/mcsharp
// Found here: http://stackoverflow.com/questions/20590239/maintain-aspect-ratio-of-div-but-fill-screen-width-and-height-in-css

window.onload = function () {
    //Let's create a function that will scale an element with the desired ratio
    //Specify the element id, desired width, and height
    function keepAspectRatio(id, width, height) {
        var aspectRatioDiv = document.getElementById(id);
        aspectRatioDiv.style.width = window.innerWidth;
        aspectRatioDiv.style.height = (window.innerWidth / (width / height)) + "px";
    }

    //run the function when the window loads
    keepAspectRatio("aspectRatio", 16, 9);

    //run the function every time the window is resized
    window.onresize = function (event) {
        keepAspectRatio("aspectRatio", 16, 9);
    }
}

// Carousel ----------------------------------------

// Refer to this link for customisation options: http://bxslider.com/options


var LODGEJson = [];
var tingImageFolderUrl = "";
var myVar = "";
var mapsTimeoutVariable = "";
var lodgeName = "";
var lodgeId = "";
var counter = 0;
var LODGE_lat = "";
var LODGE_long = "";
//var markers = [];
var map;
var infowindow;
var showKrugerTings = false;
var friendlyLodgeName = "";
var tingsCounter = "";
var TingOverlay = "";
var latestTingDate = "";
var parkGuid = "";
var LATESTingsJSON = [];

function setLodgeTingers(json, FolderUrl, name, id) {
    LODGEJson = json;
    tingImageFolderUrl = FolderUrl;
    lodgeName = name;
    lodgeId = id;
    var marker;
}

// Sets the map on all markers in the array.
function setAllMap(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

function showMarkers() {
    setAllMap(map);
}

function clearMarkers() {
    setAllMap(null);
}

function deleteMarkers() {
    clearMarkers();
    markers = [];
}

function setNewMapOfSouthAfrica() {
    LODGE_lat = -28.4792811;
    LODGE_long = 24.6722268, 6;

    var mapOptions = {
        zoom: 5,
        center: new google.maps.LatLng(parseFloat(LODGE_lat), parseFloat(LODGE_long)),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
       mapOptions);
}

function initialize() {
    var mapOptions = {
        zoom: 13,
        center: new google.maps.LatLng(parseFloat(LODGE_lat), parseFloat(LODGE_long)),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    infowindow = new google.maps.InfoWindow({
        content: TingOverlay
    });

    marker = new google.maps.Marker({
        position: map.getCenter(),
        animation: google.maps.Animation.DROP,
        map: map
    });
    //markers.push(marker);
    setTimeout(function () { infowindow.open(map, marker); }, 1000);


    mapsTimeoutVariable = setInterval(function () { displayNewMap() }, 13000);

    function displayNewMap() {
        infowindow.close();
        marker.setMap(null);
        map.setCenter({ lat: parseFloat(LODGE_lat), lng: parseFloat(LODGE_long) });
        marker = new google.maps.Marker({
            position: map.getCenter(),
            map: map,
            animation: google.maps.Animation.DROP,
        });
        //markers.push(marker);
        infowindow.setContent(TingOverlay);        
        setTimeout(function () { infowindow.open(map, marker); }, 1000);
    }

}

function GetLatesingTings() {
    var postUrl = "/AjaxOperation.aspx/GetLatest24HoursParkTings";
    $.ajax({
        type: "POST",
        url: postUrl,
        data: "{'parkGuid' : '" + parkGuid + "', 'dateOfMostRecentTing' : '" + latestTingDate + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    }).done(
        function (data, textStatus, jqXHR) {
            if (data.d.length > 0) {
                console.log("NEW TINGS FOUND !!!!");
                console.log(data);
                LATESTingsJSON = data.d;
                UpdateLODGEJson(data.d);
            } else {
                LATESTingsJSON = [];
            }
        }
    ).fail(
        function (data, textStatus, jqXHR) {
        }
    );
}


function UpdateLODGEJson(latestTings) {

    for (var i = 0; i < latestTings.length; i++) {
        LODGEJson.push(latestTings[i]);
    }
}

function init_carousel() {
    /*-------------------------------------------------*/
    /* =  portfolio OWL Carousel
	/*-------------------------------------------------*/
    console.log("INITIALIZING SLIDER !!!!")
    var currentActiveItem;
    var lastActiveItemBeforeSliderDestroy;
    reload = false;

    var slider = $('.bxslider').bxSlider({
        mode: 'vertical',
        speed: 9000,
        slideMargin: 0,
        minSlides: 4,
        maxSlides: 4,
        auto: true,
        moveSlides: 1,
        pager: false,
        controls: false,
        adaptiveHeight: false,
        onSlideAfter: function ($slideElement, oldIndex, newIndex) {
            // new code
            //($($slideElement.prevObject)[0])
            $($slideElement[0]).addClass("active");
            $($slideElement[0]).prev().removeClass("active");
            lastActiveItemBeforeSliderDestroy = $slideElement[0];
            // end of new code

            //console.log("TOTAL TINGS!!!!");
            //console.log($slideElement.prevObject.length);

            if (newIndex == ($slideElement.prevObject.length - 1)) {

                console.log("REACHED THE LAST TINGS !!");
                setTimeout(function () {                    
                    slider.destroySlider();
                    AppendItemsOnToSlider();
                    console.log("RELOADING SLIDER");
                    reload = true;
                    slider.reloadSlider();
                }, 9000)

            } else if (newIndex == ($slideElement.prevObject.length - 3)) {
                console.log("NEARLY AT THE END OF THE TINGS, CHECKING FOR NEW TINGS");
                GetLatesingTings();
            }
        },
        // new code
        onSliderLoad: function () {
            setUpMapsOverLaysAndDisplayAt12MIntervals(); // every 12 seconds set up new Info window content
            initialize();                                // every 12 seconds display new map with Info window content
            //setTingsCounter(LODGEJson.length);
            // get active item 
            // remove active class on last item
            if (reload == false) {
                currentActiveItem = $(".bxslider .active"); // for some reason it returns two: beginning and end item
                console.log("SETTING CURRENT ACTIVE ITEM");
                $($(currentActiveItem)[1]).removeClass("active");
            } else {
                $($(currentActiveItem)[0]).addClass("active");
                console.log("LAST SLIDE ITEM");
                $(lastActiveItemBeforeSliderDestroy).removeClass("active");

            }
        }
        // end of new code
    });

    function AppendItemsOnToSlider() {
        if (LATESTingsJSON.length > 0) {
            console.log("APPENDING ITEMS ONTO THE SLIDER");
            populateTingsHtml(LATESTingsJSON, true);
        } else {
            console.log("NOT ITEMS TO APPEND");
        }
    }
}

function destroy_carousel() {

    $("#owl-slider").data('owlCarousel').destroy();
}

function populateTingsHtml(tings, sliderReload) {
    var tingTemplate = '<li class="#activeStatus#">' +
                            '<div class="pic">' +
                                '<img src="#tingimage#"/>' +
                            '</div>' +
                            '<div class="info">' +
                                '<h3>#title#</h3>' +
                                '<h5 class="datetime">#time#</h5>' +
                            '</div>' +
                        '</li>';
    var ting = "";

    if (sliderReload == false) {
        for (var i = 0; i < tings.length; i++) {
            if (i == 0) {
                ting += tingTemplate.replace("#activeStatus#", "active").replace("#title#", tings[i].title).replace("#time#", tings[i].time).replace("#tingimage#", "http://tingsservice.socialengine.co.za/tings/image/" + tings[i].id);
                SetLatestTingDateAndParkGuid(tings[i].unformatedTime, tings[i].parkId)
            } else {
                ting += tingTemplate.replace("#activeStatus#", "").replace("#title#", tings[i].title).replace("#time#", tings[i].time).replace("#tingimage#", "http://tingsservice.socialengine.co.za/tings/image/" + tings[i].id);
            }
        }
        $(".bxslider").html(ting);

    } else if (sliderReload == true) {
        SetLatestTingDateAndParkGuid(tings[0].unformatedTime, tings[0].parkId)
        for (var i = 0; i < tings.length; i++) {
            ting += tingTemplate.replace("#activeStatus#", "").replace("#title#", tings[i].title).replace("#time#", tings[i].time).replace("#tingimage#", "http://tingsservice.socialengine.co.za/tings/image/" + tings[i].id);            
        }
        $('.bxslider').append(ting);
    }
}

function SetLatestTingDateAndParkGuid(tingDate, parkid) {
    console.log("LATEST TING DATE AND PARK ID");
    console.log(tingDate);
    console.log(parkid);
    latestTingDate = tingDate;
    parkGuid = parkid;
}

function setTingsCounter(number) {
    tingsCounter = number;
}

function rememberLodgeName() {
    friendlyLodgeName = $("#lodgeName").val();
}

function SetKrugerTitleHeaderTingName() {
    console.log("Setting up Kruger National Park tings");
    //$($(".page-titles")[0]).html("Kruger Park Tings");
}

function SetLodgeTittleHeaderTingName() {
    $($(".page-titles")[0]).html(friendlyLodgeName);
}

function moveArrow(percentage) {
    switch (percentage) {
        case "30%":
            $(".arrowrow").css("width", percentage);
            break;
        case "36%":
            $(".arrowrow").css("width", percentage);
            $(".arrowrow").css("float", "right");
            break;
        case "10%":
            $(".arrowrow").css("width", percentage);
            $(".arrowrow").css("float", "right");
            break;
        default:
            $(".arrowrow").css({ 'float': '' });
            $(".arrowrow").css("width", "84%");
    }
}

function setUpMapsOverLaysAndDisplayAt12MIntervals() {
    console.log("setUpMapsOverLaysAndDisplayAt12MIntervals");
    setUpMapsOverlay(LODGEJson[counter]);
    myVar = setInterval(function () { setupNewMapsOverlay() }, 13000);
}

function setupNewMapsOverlay() {
    if (counter != (LODGEJson.length - 1)) {
        counter += 1;
        //if (counter == LODGEJson.length - 3) {
        //    moveArrow("30%");
        //} else if (counter == LODGEJson.length - 2) {
        //    moveArrow("36%");
        //} else if (counter == LODGEJson.length - 1) {
        //    moveArrow("10%");
        //}
        setUpMapsOverlay(LODGEJson[counter]);
    } else {
        myStopFunction();
    }
}

function UpdateKrugerFlag() {
    if (showKrugerTings == false) {
        showKrugerTings = true;
    } else {
        showKrugerTings = false;
    }
}

function showHideTingsCarousel(status) {
    if (status == "hidden") {
        $(".bx-wrapper").css("visibility", status);
    } else {
        $(".bx-wrapper").css("visibility", status);
    }
}

function myStopFunction() {
    counter = 0;
    clearInterval(myVar);
    clearInterval(mapsTimeoutVariable);
    console.log("STOP MAP OVERLAY ITERATION");
    //setUpDisplayAllMarkersInOneMap();
    //UpdateKrugerFlag();
    //showHideTingsCarousel("hidden");

    /*t = setTimeout(function () {
        if (showKrugerTings == true) {
            SetKrugerTitleHeaderTingName();
            SetUpKrugerTings();
            showHideTingsCarousel("visible");
        } else {
            SetLodgeTittleHeaderTingName();
            deleteMarkers();
            refreshTop5TingersAndRegreshTings()
            showHideTingsCarousel("visible");
        }
    }, 15000);*/
}

function refreshTop5TingersAndRegreshTings() {
    clearTingSlider();
    RefreshTop5Tingers();
    RefreshTings();
}

function clearTingSlider() {
    for (var i = 0; i < tingsCounter; i++) {
        $("#owl-slider").data('owlCarousel').removeItem();
    }
}

function SetUpKrugerTings() {
    deleteMarkers();
    clearTingSlider();
    GetKrugerTings();
}

function RefreshTop5Tingers() {
    var postUrl = "/AjaxOperation.aspx/GetLodgeTopFiveTingers";
    $.ajax({
        type: "POST",
        url: postUrl,
        data: "{'lodgeId' : '" + lodgeId + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    }).done(
        function (data, textStatus, jqXHR) {
            if (data.d.length > 0) {
                UpdateTop5TingersLodge(data.d);
            }
        }
    ).fail(
        function (data, textStatus, jqXHR) {
        }
    );
}


function UpdateTop5TingersLodge(tingers) {
    $("#top5tingers tr").remove();
    var headers = "<tr><td>Username</td><td>Today's Tingers</td></tr>";
    $("#top5tingers").prepend(headers);
    for (var i = 0; i < tingers.length; i++) {
        var newrow = "<tr><td>#name</td><td>#total</td></tr>";
        newrow = newrow.replace("#name", tingers[i].username).replace("#total", tingers[i].tingsTotal);
        $("#top5tingers tr:last").after(newrow);
    }
}

function setUpMapsOverlay(lodgeDetails) {
    //showTingInformation();
    LODGE_lat = lodgeDetails.latitude;
    LODGE_long = lodgeDetails.longitude;

    TingOverlay = '<div class="card"> ' +
        '<img src="#TingImage#"> ' +
        '<div class="info-wrap"> ' +
            '<div class="profile">' +
                '<img src="images/profilepic.jpg"> ' +
                '<div class="profile-txt"> ' +
                    '<p>#tingedBy#</p>' +
                    '<h3>#TingTitle#</h3>' +
                '</div>' +
            '</div>' +
            '<div class="location">' +
                '<p>#location#</p>' +
            '</div>' +
            '<div class="detail">' +
                '<div class="visibility"> ' +
                    '<div class="stars">' +
                        '#visibility_stars#' +
                    '</div>' +
                    '<h5>Visibility</h5>' +
                '</div>' +
                '<div class="traffic">' +
                    '<div>' +
                        '#visibility_traffic#' +
                    '</div>' +
                    '<h5>Traffic</h5>' +
                '</div>' +
            '</div>' +
            '<div class="des">' +
                '<p>#tingdesc# </p>' +
            '</div>' +
        '</div>' +
    '</div>';

    var TingImage = tingImageFolderUrl + lodgeDetails.id;
    var tingedBy = "Tinged by: " + lodgeDetails.username;
    var TingTitle = lodgeDetails.title;
    var Tingdesc = lodgeDetails.description;
    var Tinglocation = lodgeDetails.location;
    var VisibilityStar = ReturnVisibilityStar(parseInt(lodgeDetails.visibility));
    var VisibilityTraffic = ReturnTraffic(parseInt(lodgeDetails.traffic));

    TingOverlay = TingOverlay.replace("#TingImage#", TingImage).replace("#tingedBy#", tingedBy).replace("#TingTitle#", TingTitle).replace("#location#", Tinglocation).replace("#visibility_stars#", VisibilityStar).replace("#visibility_traffic#", VisibilityTraffic).replace("#tingdesc#", Tingdesc);

    //$("#lodgeImage").attr("src", tingImageFolderUrl + lodgeDetails.id);
    // http://tingsservice.socialengine.co.za/uploads/1577F3D3-B3AB-4FA7-A46A-22D20E65EE03.jpg
    //$("#lodgeTitle").html(lodgeDetails.title);
    //$("#desc").html(lodgeDetails.description);
    //$("#location").html(lodgeDetails.location);
    //$("#tingedBy").html("Tinged by: " + lodgeDetails.username);
    //$("#time").html(lodgeDetails.time);
    //$("#visibility_traffic").html("Visibility: " + lodgeDetails.visibility + " | Traffic: " + lodgeDetails.traffic);
    //$("#visibility_traffic").html("Visibility: " + ReturnVisibilityStar(parseInt(lodgeDetails.visibility)) + " | Traffic: " + ReturnTraffic(parseInt(lodgeDetails.traffic)));
}

function ReturnVisibilityStar(starsCount) {

    var htmlStars = "";

    for (var i = 0; i < starsCount; i++) {
        htmlStars += '<i class="fa fa-star"></i>';
    }

    for (var i = starsCount; i < 5; i++) {
        htmlStars += '<i class="fa fa-star-o"></i>';
    }

    return htmlStars;
}

function ReturnTraffic(starsCount) {
    var htmlStars = "";


    for (var i = 0; i < starsCount; i++) {
        htmlStars += '<i class="fa fa-circle"></i>';
    }

    for (var i = starsCount; i < 5; i++) {
        htmlStars += '<i class="fa fa-circle-thin"></i>';
    }

    return htmlStars;
}

function setUpDisplayAllMarkersInOneMap() {
    setNewMapOfSouthAfrica();
    displayAllTingsPicture();
    hideTingInformation();
    tout = setTimeout(function () {
        showMarkers();
    }, 1500);
}


function displayAllTingsPicture() {
    $("#lodgeImage").attr("src", "http://latestsightings.socialengine.co.za/images/alltings.PNG");
}

function hideTingInformation() {
    $("#lodgeTitle").hide();
    $(".NoBottomMargin").hide();
}

function showTingInformation() {
    //$("#lodgeTitle").show();
    //$(".NoBottomMargin").show();
}


function setIndexOfLastTing() {
    indexOfLastTing = LODGEJson.length - 1;
    //console.log("INDEX OF LAST ITEM");
    //console.log(indexOfLastTing);
}

$(document).ready(function () {
    //console.log(LODGEJson);

    rememberLodgeName();
    populateTingsHtml(LODGEJson, false);
    init_carousel();
});