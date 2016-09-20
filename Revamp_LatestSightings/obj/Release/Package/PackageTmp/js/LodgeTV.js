var LODGEJson = [];
var tingImageFolderUrl = "";
var myVar = "";
var mapsTimeoutVariable = "";
var lodgeName = "";
var lodgeId = "";
var counter = 0;
var LODGE_lat = "";
var LODGE_long = "";
var markers = [];
var map;
var showKrugerTings = false;
var friendlyLodgeName = "";
var tingsCounter = "";

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

    marker = new google.maps.Marker({
        position: map.getCenter(),
        animation: google.maps.Animation.DROP,
        map: map
    });
    markers.push(marker);


    mapsTimeoutVariable = setInterval(function () { displayNewMap() }, 12000);

    function displayNewMap() {
        marker.setMap(null);
        map.setCenter({ lat: parseFloat(LODGE_lat), lng: parseFloat(LODGE_long) });
        marker = new google.maps.Marker({
            position: map.getCenter(),
            map: map,
            animation: google.maps.Animation.DROP,
        });
        markers.push(marker);
    }

}

function init_carousel() {
    /*-------------------------------------------------*/
    /* =  portfolio OWL Carousel
	/*-------------------------------------------------*/
    try {
        $("#owl-slider").owlCarousel({
            autoPlay: 12000,
            items: 4,
            pagination: false,
            rewindNav: false,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]
        });
    } catch (err) {

    }
}

function destroy_carousel() {

    $("#owl-slider").data('owlCarousel').destroy();
}

function populateTingsHtml(tings) {
    console.log("---populateTingsHtml---");
    console.log(tings);
    var tingTemplate = '<div class="related-portfolio-item item ting">' +
               '<a href="#">' +
				'<div class="ls-member">' +
					'<div class="ls-info"><img alt="" src="#tingimage#" class=""></div>' +
					'<div class="ls-title">' +
						'<h4>#title#</h4>' +
						'<p>#time#</p>' +
					'</div>' +
				'</div>' +
            '</a>' +
		'</div>';
    var ting = "";
    for (var i = 0; i < tings.length; i++) {
        ting = tingTemplate.replace("#title#", tings[i].title).replace("#time#", tings[i].time).replace("#tingimage#", "http://tingsservice.socialengine.co.za/tings/image/" + tings[i].id);
        $("#owl-slider").data('owlCarousel').addItem(ting);
    }
}

function setTingCounter(number) {
    tingsCounter = number;
}

function rememberLodgeName() {
    friendlyLodgeName = $($(".page-titles")[0]).html();
}

function SetKrugerTitleHeaderTingName() {
    $($(".page-titles")[0]).html("Kruger Park Tings");
}

function SetLodgeTittleHeaderTingName() {
    $($(".page-titles")[0]).html(friendlyLodgeName);
}

function moveArrow(percentage) {
    switch(percentage)
    {
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

$(document).ready(function () {
    rememberLodgeName();
    displayTings();
    initialize();
    init_carousel();
    setTingCounter(LODGEJson.length);
    populateTingsHtml(LODGEJson);

    function displayTings() {
        displayLodge(LODGEJson[counter]);
        myVar = setInterval(function () { displayNewLodge() }, 12000);
    }

    function displayNewLodge() {
        if (counter != (LODGEJson.length - 1)) {
            counter += 1;
            if (counter == LODGEJson.length - 3) {
                moveArrow("30%");
            } else if (counter == LODGEJson.length - 2) {
                moveArrow("36%");
            } else if (counter == LODGEJson.length - 1) {
                moveArrow("10%");
            }
            displayLodge(LODGEJson[counter]);
        } else {
            myStopFunction();
            moveArrow("reset");
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
            $($(".col-md-12")[1]).css("visibility", status);
            $(".arrowrow").css("visibility", status);
        } else {
            $($(".col-md-12")[1]).css("visibility", status);
            $(".arrowrow").css("visibility", status);
        }
    }

    function myStopFunction() {
        counter = 0;
        clearInterval(myVar);
        clearInterval(mapsTimeoutVariable);
        setUpDisplayAllMarkersInOneMap();
        UpdateKrugerFlag();
        showHideTingsCarousel("hidden");

        t = setTimeout(function () {
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
        }, 15000);
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

    function RefreshTings() {
        console.log("Getting normal tings");
        var postUrl = "/AjaxOperation.aspx/GetLodgeDetails";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'lodgeName' : '" + lodgeName + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d.length > 0) {
                    LODGEJson = data.d;
                    setTingCounter(LODGEJson.length);
                    populateTingsHtml(LODGEJson);
                    displayTings();
                    initialize();
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }


    function GetKrugerTings() {
        console.log("Getting Kruger Tings");
        var postUrl = "/AjaxOperation.aspx/GetKrugerTings";
        $.ajax({
            type: "POST",
            url: postUrl,
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d.length > 0) {
                    LODGEJson = data.d;
                    setTingCounter(LODGEJson.length);
                    populateTingsHtml(LODGEJson);
                    displayTings();
                    initialize();
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function displayLodge(lodgeDetails) {
        showTingInformation();
        LODGE_lat = lodgeDetails.latitude;
        LODGE_long = lodgeDetails.longitude;

        $("#lodgeImage").attr("src", tingImageFolderUrl + lodgeDetails.id);
        // http://tingsservice.socialengine.co.za/uploads/1577F3D3-B3AB-4FA7-A46A-22D20E65EE03.jpg
        $("#lodgeTitle").html(lodgeDetails.title);
        $("#desc").html(lodgeDetails.description);
        $("#location").html(lodgeDetails.location);
        $("#tingedBy").html("Tinged by: " + lodgeDetails.username);
        $("#time").html(lodgeDetails.time);
        //$("#visibility_traffic").html("Visibility: " + lodgeDetails.visibility + " | Traffic: " + lodgeDetails.traffic);
        $("#visibility_traffic").html("Visibility: " + ReturnVisibilityStar(parseInt(lodgeDetails.visibility)) + " | Traffic: " + ReturnTraffic(parseInt(lodgeDetails.traffic)));
    }

    function ReturnVisibilityStar(starsCount) {
        htmlStars = "";
        for (var i = 0; i < starsCount; i++) {
            htmlStars += '<img src="/images/ic_star.svg" id="lodgeImage" width="100%" style="height: 16px; display: inline; width: 19px;">';
        }

        for (var i = starsCount; i < 5; i++) {
            htmlStars += '<img src="/images/ic-starline.svg" id="lodgeImage" width="100%" style="height: 16px; display: inline; width: 19px;">';
        }

        return htmlStars;
    }

    function ReturnTraffic(starsCount) {

        switch (starsCount) {
            case 1:
                return '<img src="/images/ic-greencar.svg" id="lodgeImage" width="100%" style="height: 16px; display: inline; width: 19px;">';
                break;
            case 2:
                return '<img src="/images/ic-orangecar.svg" id="lodgeImage" width="100%" style="height: 16px; display: inline; width: 19px;">';
            case 3:
                return '<img src="/images/ic-redcar.svg" id="lodgeImage" width="100%" style="height: 16px; display: inline; width: 19px;">';
        }

        return "";
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
        $("#lodgeTitle").show();
        $(".NoBottomMargin").show();
    }


});