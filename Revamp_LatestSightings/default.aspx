<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Revamp_LatestSightings._default" %>

<asp:Content ID="homepage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="<%= ResolveUrl("~/js/owl.carousel.min.js") %>"></script>
                    
					
                    <!-- Billboard BEGIN -->
                    <asp:PlaceHolder ID="BB_placeholder" runat="server"></asp:PlaceHolder>
                    <!-- Billboard END -->

                    <!--HOMEPAGE TINGS-->
                    <asp:PlaceHolder ID="tings_homepage" runat="server"></asp:PlaceHolder>
                    <!--END OF HOMEPAGE TINGS -->
                    
                    <!-- Latest Sightings BEGIN -->
					<div class="portfolio-related-posts triggerAnimation animated displayNone" data-animate="fadeInUp">
						<h4 class="page-titles">Latest Sightings</h4>
                            
                        <!--<div class="row" style="text-align:center; font-size:12px; font-family:Arial, Helvetica, sans-serif; padding-bottom:20px;">
                            	<div class="fa fa-hand-o-left" style="padding-right:15px; font-size:16px;"></div>
                                Swipe from left to right to view the Latest Sightings
                                <div class="fa fa-hand-o-right" style="padding-left:15px; font-size:16px;"></div>
                            </div>-->
							
                        <div id="owl-slider">
                                
							<div class="related-portfolio-item item">
                                    <a href="#"><img alt="" src="images/relatedposts-720x720.gif"></a>
                                    <div class="portfolio-info-overlay"></div>
                                    <div class="portfolio-info-hover">
                                        <div class="related-portfolio-icon"><i class="fa fa-eye"></i></div>
                                        <h3>2 Lions Sleeping</h3>
                                        <div class="related-portfolio-categories">34 km north of gate 7, under the tree of love</div>
                                        <a href="#" class="read-more"><i class="fa fa-arrow-right"></i></a>
                                    </div>
								</div>
                                    
							<div class="related-portfolio-item item">
                                    <a href="#"><img alt="" src="images/relatedposts-720x720.gif"></a>
                                    <div class="portfolio-info-overlay"></div>
                                    <div class="portfolio-info-hover">
                                        <div class="related-portfolio-icon"><i class="fa fa-eye"></i></div>
                                        <h3>Giraffes Drinking</h3>
                                        <div class="related-portfolio-categories">34 km north of gate 7, under the tree of love</div>
                                        <a href="#" class="read-more"><i class="fa fa-arrow-right"></i></a>
                                    </div>
								</div>
                                    
							<div class="related-portfolio-item item">
                                    <a href="#"><img alt="" src="images/relatedposts-720x720.gif"></a>
                                    <div class="portfolio-info-overlay"></div>
                                    <div class="portfolio-info-hover">
                                        <div class="related-portfolio-icon"><i class="fa fa-eye"></i></div>
                                        <h3>Buffaloes</h3>
                                        <div class="related-portfolio-categories">34 km north of gate 7, under the tree of love</div>
                                        <a href="#" class="read-more"><i class="fa fa-arrow-right"></i></a>
                                    </div>
								</div>
                                    
							<div class="related-portfolio-item item">
                                    <a href="#"><img alt="" src="images/relatedposts-720x720.gif"></a>
                                    <div class="portfolio-info-overlay"></div>
                                    <div class="portfolio-info-hover">
                                        <div class="related-portfolio-icon"><i class="fa fa-eye"></i></div>
                                        <h3>Leopard Cub Spotted</h3>
                                        <div class="related-portfolio-categories">34 km north of gate 7, under the tree of love</div>
                                        <a href="#" class="read-more"><i class="fa fa-arrow-right"></i></a>
                                    </div>
								</div>
                                    
							<div class="related-portfolio-item item">
                                    <a href="#"><img alt="" src="images/relatedposts-720x720.gif"></a>
                                    <div class="portfolio-info-overlay"></div>
                                    <div class="portfolio-info-hover">
                                        <div class="related-portfolio-icon"><i class="fa fa-eye"></i></div>
                                        <h3>2 Lions Sleeping</h3>
                                        <div class="related-portfolio-categories">34 km north of gate 7, under the tree of love</div>
                                        <a href="#" class="read-more"><i class="fa fa-arrow-right"></i></a>
                                    </div>
								</div>
                                    
							<div class="related-portfolio-item item">
                                    <a href="#"><img alt="" src="images/relatedposts-720x720.gif"></a>
                                    <div class="portfolio-info-overlay"></div>
                                    <div class="portfolio-info-hover">
                                        <div class="related-portfolio-icon"><i class="fa fa-eye"></i></div>
                                        <h3>Giraffes Drinking</h3>
                                        <div class="related-portfolio-categories">34 km north of gate 7, under the tree of love</div>
                                        <a href="#" class="read-more"><i class="fa fa-arrow-right"></i></a>
                                    </div>
								</div>
                                
						</div>
					</div>
                    <!-- Latest Sightings END -->
                    
					<div class="row">
                    	<!-- LEFT Content BEGIN -->
						<div class="leftcol">
                           <% if (featuredVideos != null && featuredVideos.Count > 0){ %>
                                <!-- Spotlight Video BEGIN -->
<%--                                <h4 class="page-titles">Spotlight Video</h4>
                                
                                <div class="blog-list-post triggerAnimation animated" data-animate="fadeIn">
                                    <div class="blog-list-featured-image">
                                        <a href="javascript:void(0);"><img class="spotLightImage youtube img-responsive" src="<%=featuredVideos[0].Url2 %>" rel="<%=featuredVideos[0].YouTubeId %>"></a>
                                        <!--<div class="playicon"><i class="fa fa-play"></i></div>-->
                                    </div>
                                            
                                    <div class="blog-list-content">
                                        <h2 class="blog-list-title"><a href="javascript:void(0);" class="cursorPointer"><%= featuredVideos[0].Title %></a></h2>
                                        <p><%=featuredVideos[0].Description %></p>
                                        <div class="viewsForVideoOne"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>--%>
                                <!-- Spotlight Video END -->
                                <!-- NEW SPOTLIGHT HTML -->
                                <!-- Spotlight Video BEGIN -->                            
                                <h4 class="page-titles">Spotlight Video</h4>                                                                                            
                                <div class="blog-list-post triggerAnimation animated" data-animate="fadeIn"> 
                                    <div class="blog-list-featured-image">                                 	
                                        <div class="playicon img-featured-video-link"><i class="fa fa-play"></i></div>                                     
                                         <a href="javascript:void(0);"><img class="spotLightImage youtube img-responsive" src="<%=featuredVideos[0].Url2 %>" rel="<%=featuredVideos[0].YouTubeId %>"></a>                                                                 
                                    </div>                                                                              
                                    <div class="blog-list-content">                                     
                                        <h2 class="blog-list-title">
                                            <a href="javascript:void(0);" class="cursorPointer"><%= featuredVideos[0].Title %></a>
                                        </h2>                                    
                                        <p><%=featuredVideos[0].Description %></p>                                     
                                        <div class="viewsForVideoOne"></div>                               
                                        <div class="clearfix"></div>                                                                  		
                                        <div class="spacer sml"></div>  						
                                        <div class="left">                                                                                 
                                            <div class="right">                                             
                                                <a href="javascript:void(0);" title="Share to Facebook" class="featured-video-shareOnFacebook"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>                                             
                                                <a href="javascript:void(0);" title="Share to Twitter" class="featured-video-shareOnTwitter"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>                                         
                                            </div>                                     
                                        </div>                                                                          
                                        <div class="clearfix"></div>                                 
                                    </div>                            
                                </div>                            
                                <!-- Spotlight Video END -->
                                <!-- END OF NEW SPOTLIGHT HTML -->
                           <%} %>
                        
                        	<div class="spacer"></div>
                            
                            <%if (featuredVideos != null && featuredVideos.Count > 0){ %>
                                <!-- Hot right Now BEGIN -->
                                <h4 class="page-titles">Hot Right Now</h4>
                                    <div class="blog-grid">
                                        <div class="row">
                                            <% if (featuredVideos.Count > 1){ %>
                                            <div class="col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                                        <div class="blog-grid-item triggerAnimation animated" data-animate="fadeInUp">
                                                            <a class="img-link" href="javascript:void(0);"><img class="youtube" src="<%=featuredVideos[1].Url2 %>" rel="<%=featuredVideos[1].YouTubeId %>"><div class="gridplayicon"><i class="fa fa-play"></i></div></a>
                                                            <div class="blog-grid-controls">
                                                                <a href="javascript:void(0);" title="Share to Facebook" class="shareOnFacebook"><i class="fa fa-facebook-square"></i></a>
                                                                <%--<a href="#" title="Share to Google"><i class="fa fa-google"></i></a>--%>
                                                                <a href="javascript:void(0);" title="Share to Twitter"  class="shareOnTwitter"><i class="fa fa-twitter"></i></a>
                                                            </div>
                                                            <div class="blog-grid-content">
                                                                <h3><a href="javascript:void(0);" class="cursorPointer"><%=featuredVideos[1].Title %></a></h3>
                                                                <p class="viewsForVideoTwo"></p>
                                                            </div>
                                                        </div>
                                            </div>
                                            <%} %>
                                            <% if (featuredVideos.Count > 2){ %>
                                                <div class="col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                                            <div class="blog-grid-item triggerAnimation animated" data-animate="fadeInUp">
                                                                <a class="img-link" href="javascript:void(0);"><img class="youtube" src="<%=featuredVideos[2].Url2 %>" rel="<%=featuredVideos[2].YouTubeId %>"><div class="gridplayicon"><i class="fa fa-play"></i></div></a>
                                                                <div class="blog-grid-controls">
                                                                    <a href="javascript:void(0);" title="Share to Facebook" class="shareOnFacebook"><i class="fa fa-facebook-square"></i></a>
                                                                    <%--<a href="#" title="Share to Google"><i class="fa fa-google"></i></a>--%>
                                                                    <a href="javascript:void(0);" title="Share to Twitter"  class="shareOnTwitter"><i class="fa fa-twitter"></i></a>
                                                                </div>
                                                                <div class="blog-grid-content">
                                                                    <h3><a href="javascript:void(0);" class="cursorPointer"><%=featuredVideos[2].Title %></a></h3>
                                                                    <p class="viewsForVideoThree"></p>
                                                                </div>
                                                            </div>
                                                </div>
                                            <%} %>
                                        </div>
                                        
                                        <div class="row">
                                            <% if (featuredVideos.Count > 3){ %>
                                                <div class="col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                                        <div class="blog-grid-item triggerAnimation animated" data-animate="fadeInUp">
                                                                <a class="img-link" href="javascript:void(0);"><img class="youtube" src="<%=featuredVideos[3].Url2 %>" rel="<%=featuredVideos[3].YouTubeId %>"><div class="gridplayicon"><i class="fa fa-play"></i></div></a>
                                                                <div class="blog-grid-controls">
                                                                    <a href="javascript:void(0);" title="Share to Facebook" class="shareOnFacebook"><i class="fa fa-facebook-square"></i></a>
                                                                    <%--<a href="#" title="Share to Google"><i class="fa fa-google"></i></a>--%>
                                                                    <a href="javascript:void(0);" title="Share to Twitter"  class="shareOnTwitter"><i class="fa fa-twitter"></i></a>
                                                                </div>
                                                                <div class="blog-grid-content">
                                                                    <h3><a href="javascript:void(0);" class="cursorPointer"><%=featuredVideos[3].Title %></a></h3>
                                                                    <p class="viewsForVideoFour"></p>
                                                                </div>
                                                            </div>
                                                    </div>
                                            <%} %>
                                             <% if (featuredVideos.Count > 4){ %>
                                                <div class="col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                                    <div class="blog-grid-item triggerAnimation animated" data-animate="fadeInUp">
                                                            <a class="img-link" href="javascript:void(0);"><img class="youtube" src="<%=featuredVideos[4].Url2 %>" rel="<%=featuredVideos[4].YouTubeId %>"><div class="gridplayicon"><i class="fa fa-play"></i></div></a>
                                                            <div class="blog-grid-controls">
                                                                <a href="javascript:void(0);" title="Share to Facebook" class="shareOnFacebook"><i class="fa fa-facebook-square"></i></a>
                                                                <%--<a href="#" title="Share to Google"><i class="fa fa-google"></i></a>--%>
                                                                <a href="javascript:void(0);" title="Share to Twitter"  class="shareOnTwitter"><i class="fa fa-twitter"></i></a>
                                                            </div>
                                                            <div class="blog-grid-content">
                                                                <h3><a href="javascript:void(0);" class="cursorPointer"><%=featuredVideos[4].Title %></a></h3>
                                                                <p class="viewsForVideoFive"></p>
                                                            </div>
                                                        </div>
                                                </div>
                                            <%} %>
                                        </div>
                                        
                                    </div>
                                <!-- Hot right Now END -->
                            <%} %>
                        
                        	<div class="clearfix"></div>
                        	<div class="spacer"></div>
                        
<%--                            <!-- Space for web ads BEGIN -->
                            <!-- New site - 777x90 -->
                            <ins class="adsbygoogle"
                            style="display:inline-block;width:777px;height:90px"
                            data-ad-client="ca-pub-2507393417436053"
                            data-ad-slot="3232563002"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                            <!-- Space for web ads END --> --%>
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <!-- Latest Galleries BEGIN -->
                            <asp:PlaceHolder ID="latestGalleries" runat="server"></asp:PlaceHolder>
                            <!-- Latest Galleries END -->  
                            
                       
                        <!-- LEFT Content END -->
						</div>
                        
                        <!-- RIGHT Content BEGIN -->
						<div class="rightcol">
							<div id="sidebar-area">
                            
                            <!-- Top 10 BEGIN -->
                                <asp:PlaceHolder ID="monthlyTopContributors" runat="server"></asp:PlaceHolder>
                            <!-- Top 10 END -->
                            <div class="clearfix"></div>
                            <div class="spacer small"></div>
                            <asp:PlaceHolder ID="topearningvideos" runat="server"></asp:PlaceHolder>



                             <div class="spacer"></div>
							<%--<div class="fb-page" data-href="https://www.facebook.com/latestsightingskruger" data-width="300" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/latestsightingskruger"><a href="https://www.facebook.com/latestsightingskruger">Latest Sightings - Kruger</a></blockquote></div></div>--%>
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <!-- 300x250 AD -->
                            <asp:PlaceHolder ID="ad300by50" runat="server"></asp:PlaceHolder>
                            <!-- 300x250 AD -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer small"></div>
                        
                            <!-- 300x250 AD -->
                            <div class="ad300">
                            	<asp:PlaceHolder ID="downloadapp" runat="server"></asp:PlaceHolder>
							</div>
                            <!-- 300x250 AD -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>

                            <!-- Latest Blogs BEGIN -->
                                <asp:PlaceHolder ID="plc_latestBlogs" runat="server" />                            
                            <!-- Latest Blogs END -->
                            
								
								
								
												
							</div>
						</div>

					</div>
				<!-- End Content Area -->
    <script>
        $(document).ready(function () {
            // code for play video image when clicked
            $(".img-link").click(function () {
                $(this).find("img").click();
            });

            $(".img-featured-video-link").click(function () {
                $(".img-featured-video-link").next().find("img").click();
            });
            // end of that code


            var youtubeIdArrayCounter = 0;
            if (youtubeArray) {
                GetFeaturedVideosViews(youtubeArray[youtubeIdArrayCounter]);
            }

            function GetFeaturedVideosViews(videoId) {
                var postUrl = "https://www.googleapis.com/youtube/v3/videos?id=" + videoId + "&key=AIzaSyB3O6AqwnZ3uHY0h6ulDrxlAWXXrs99VqI&part=snippet,contentDetails,statistics,status";
                $.ajax({
                    type: "GET",
                    url: postUrl,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done(
                    function (data, textStatus, jqXHR) {
                        switch(youtubeIdArrayCounter) {
                            case 0:
                                $(".viewsForVideoOne").html(numeral(data.items[0].statistics.viewCount).format('0,0') + " views");
                                youtubeIdArrayCounter += 1;
                                GetFeaturedVideosViews(youtubeArray[youtubeIdArrayCounter]);
                                break;
                            case 1:
                                $(".viewsForVideoTwo").html(numeral(data.items[0].statistics.viewCount).format('0,0') + " views");
                                youtubeIdArrayCounter += 1;
                                GetFeaturedVideosViews(youtubeArray[youtubeIdArrayCounter]);
                                break;
                            case 2:
                                $(".viewsForVideoThree").html(numeral(data.items[0].statistics.viewCount).format('0,0') + " views");
                                youtubeIdArrayCounter += 1;
                                GetFeaturedVideosViews(youtubeArray[youtubeIdArrayCounter]);
                                break;
                            case 3:
                                $(".viewsForVideoFour").html(numeral(data.items[0].statistics.viewCount).format('0,0') + " views");
                                youtubeIdArrayCounter += 1;
                                GetFeaturedVideosViews(youtubeArray[youtubeIdArrayCounter]);
                                break;
                            case 4:
                                $(".viewsForVideoFive").html(numeral(data.items[0].statistics.viewCount).format('0,0') + " views");
                                break;
                            default:
                            //default code block
                        }
                    }
                ).fail(
                    function (data, textStatus, jqXHR) {
                    }
                );
            }
        });
    </script>

    <script src="<%= ResolveUrl("~/js/galleryviewmodal.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/homePage.js?v=6") %>"></script>
    <script src="<%= ResolveUrl("~/js/bootstrap.youtubepopup.min.js?v=10") %>"></script>
    <script src="<%= ResolveUrl("~/js/numeral.min.js") %>"></script>
    <script>
        $(document).ready(function () {
            //loading twitter js after 5 seconds to give billboard time to load
            setTimeout(function () {
                var twitterJs = "<script src='js/widgets.js'>";
                twitterJs += "<";
                twitterJs += "/script>"
                $("form").after(twitterJs);
            }, 5000);
        });
    </script>
</asp:Content>