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

$(document).ready(function () {
    var indexOfLastTing = 4;
    var currentActiveItem;
    var lastActiveItemBeforeSliderDestroy;
    reload = false;

    var slider = $('.bxslider').bxSlider({
        mode: 'vertical',
        speed: 600,
        slideMargin: 0,
        minSlides: 3,
        maxSlides: 3,
        auto: true,
        moveSlides: 1,
        pager: false,
        controls: false,
        adaptiveHeight: false,
        onSlideAfter: function ($slideElement, oldIndex, newIndex) {
            // new code
            ($($slideElement.prevObject)[0])
            $($slideElement[0]).addClass("active");
            $($slideElement[0]).prev().removeClass("active");
            lastActiveItemBeforeSliderDestroy = $slideElement[0];
            // end of new code

            console.log($slideElement.prevObject.length);
            if (newIndex == ($slideElement.prevObject.length - 1)) {
                slider.destroySlider();
                //$('.bxslider').html("");
                AppendItemsOnToSlider();
                console.log("reloading slider");
                reload = true;
                slider.reloadSlider();

            }
        },
        // new code
        onSliderLoad: function () {
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
            console.log("SLIDER READY !!!!!!!!!!");
        }
        // end of new code
    });

    function AppendItemsOnToSlider() {
        console.log("appending Items To slider");
        $('.bxslider').append('<li> ' +
                              '<div class="pic"> ' +
                                  '<img src="images/thumb3.jpg"/> ' +
                              '</div> ' +
                              '<div class="info"> ' +
                                  '<h3>Family of zebras</h3> ' +
                                  '<h5 class="datetime">Today @ 15:44 am</h5> ' +
                              '</div> ' +
                          '</li> ' +
                          '<li> ' +
                              '<div class="pic"> ' +
                                  '<img src="images/thumb4.jpg"/> ' +
                              '</div> ' +
                              '<div class="info"> ' +
                                  '<h3>Rare rhino</h3> ' +
                                  '<h5 class="datetime">Today @ 16:39 am</h5> ' +
                              '</div> ' +
                          '</li> ' +
                      '</ul>');
    }
});
