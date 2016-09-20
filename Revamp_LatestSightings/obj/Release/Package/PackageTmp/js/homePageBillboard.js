var BILLBOARDS = [];

function constructBillboard(json) {
    BILLBOARDS = json;
}


function setBBTitles() {
    var rightBBItemsCount = $("#thumbnails span").length;
    for (var i = 0; i < rightBBItemsCount; i++) {
        $($("#thumbnails span")[i]).html(BILLBOARDS[i].Title);
        $($("#slider .item h3")[i]).html(BILLBOARDS[i].Title);
        $($("#slider .item p")[i]).html(BILLBOARDS[i].ArticleBody);
        if (BILLBOARDS[i].Url2 != "" && BILLBOARDS[i].Url2 != null) {
            $($("#slider .item a")[i]).attr("href", "/blog/" + BILLBOARDS[i].Url2.replace(/ /g, "_"));
        }else{
            $($("#slider .item a")[i]).attr("href", "/blog.aspx?id=" + BILLBOARDS[i].Id + "&cat=" + BILLBOARDS[i].CateogryId);
        }
    }
}

function setBBImage(control, image) {
    $(control).attr("src", "");
    $(control).attr("src", image);
}

function setBBRightImageClasses(control) {
    $(control).attr("class", "img-responsive sixtyBySixty");
    $(control).css("width", "80px");
}


function buildingBB() {
    var bb = '<div class="col-md-9">' + 
							'<div id="slider" class="slides Xowl-carousel">' +
								
                                '<div id="item0" class="item">' +
									'<div class="overlay">' +
										'<a href="blog-single.html">' +
											'<h3>Latin America growing middle classes are restless</h3>' +
											'<p>"Juan Middle Class" may be a cartoon, but the problems he faces -- expensive schools, crummy healthcare, ballooning grocery bills -- are all too real for millions of newly middle-class Latin Americans. [...]</p>' +
										'</a>' +
									'</div>' +
										'<img alt="" src="images/postslider-879x487.gif" />' +
								'</div>' +
                                
								'<div id="item1" class="item">' +
									'<div class="overlay">' +
										'<a href="blog-sidebar.html">' +
											'<h3>Expert Tips for Winter Hair Care by Bharti Taneja</h3>' +
											'<p>A wedding in winters is always more cherished as it gives an opportunity to a would-be- bride to adorn herself in her own way. She does not have to worry about the heat and sweat, be it in the choice of clothes, footwear, makeup, or [...]</p>' +
										'</a>' +
									'</div>' +
									'<img alt="" src="images/postslider-879x487.gif" />' +
								'</div>' +
                                
								'<div id="item2" class="item">' +
									'<div class="overlay">' +
										'<a href="blog-sidebar.html">' +
											'<h3>Serena leads ailing women to Singapore for WTA Finals</h3>' +
											'<p>By Patrick Johnston SINGAPORE (Reuters) - The top eight women in world tennis have limped to the season-ending WTA Finals in Singapore this week, with creaking knees and form fears casting a shadow over the WTA latest [...]</p>' +
										'</a>' +
									'</div>' +
									'<img alt="" src="images/postslider-879x487.gif" />' +
								'</div>' +
                                
								'<div id="item3" class="item">' +
									'<div class="overlay">' +
										'<a href="blog-single.html">' +
											'<h3>Egg freezing: controversial new benefit in the US workplace</h3>' +
											'<p>Free meals, four months of maternity leave and now egg-freezing: Facebook s latest gift to its employees has rekindled debate on the role of women in the [...]</p>' +
										'</a>' +
									'</div>' +
									'<img alt="" src="images/postslider-879x487.gif" />' +
								'</div>' +
                                
							'</div>' +
						'</div>' +
                        
						'<div class="col-md-3">' +
							'<div id="thumbnails" class="thumbs Xowl-carousel">' +
								'<div class="item active"><img alt="" src="images/350.gif" /><span>Latin Americas growing middle classes are restless</span></div>' +
								'<div class="item"><img alt="" src="images/350.gif" /><span>Expert Tips for Winter Hair Care by Bharti Taneja</span></div>' +
								'<div class="item"><img alt="" src="images/350.gif" /><span>Serena leads ailing women to Singapore for WTA Finals</span></div>' +
								'<div class="item"><img alt="" src="images/350.gif" /><span>Egg freezing: controversial new benefit in the US workplace</span></div>' +
							'</div>' +
						'</div>' +
                        						
						'<div class="clearfix"></div>';

    $(".post-slider").html(bb);
    setBBTitles();
    setTimeout(function () {
        for (var i = 0; i < $("#thumbnails img").length; i++)
        {
            setBBImage("#item" + i +" img", BILLBOARDS[i].Url);
            setBBImage($($("#thumbnails img")[i]), BILLBOARDS[i].Url);
            setBBRightImageClasses($($("#thumbnails img")[i]));
        }
    }, 2000);

}

$(document).ready(function () {
    console.log("---- homePageBillboard ---");
    console.log(BILLBOARDS);
    buildingBB();
});