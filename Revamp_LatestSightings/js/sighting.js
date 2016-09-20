function GetParks() {
    var postUrl = "/AjaxOperation.aspx/GetParks";
    $.ajax({
        type: "POST",
        url: postUrl,
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    }).done(
        function (data, textStatus, jqXHR) {
            console.log("----PARKS----");
            console.log(data.d);
            populateParks(data.d);
        }
    ).fail(
        function (data, textStatus, jqXHR) {
        }
    );
}

function populateParks(gameparks) {
    var park = '<li role="presentation"><a role="menuitem" tabindex="#index#" href="/park/sightings/#parkid#">#name#</a></li>';
    var parkList = "";
    for (var i = 0; i < gameparks.length; i++) {
        parkList += park.replace("#index#", i).replace("#name#", gameparks[i].name).replace("#parkid#", gameparks[i].id);
    }
    $(".parks ul").html(parkList);
}


$(document).ready(function () {
    GetParks();
});