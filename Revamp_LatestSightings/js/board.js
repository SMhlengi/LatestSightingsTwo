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

$(document).ready(function(){
  $('.bxslider').bxSlider({
      mode: 'vertical',
      speed: 600,
      slideMargin: 0,
      auto: true,
      minSlides: 4,
      maxSlides: 4,
      moveSlides: 1,
      pager: false,
      controls: false,
      adaptiveHeight: false
    });
});
