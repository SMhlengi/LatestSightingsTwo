<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_latestGalleris.ascx.cs" Inherits="Revamp_LatestSightings.uc_latestGalleris" %>


                            <!-- Latest Galleries BEGIN -->
                            <h4 class="page-titles">Latest Galleries</h4>
                            <div class="blog-grid">
								<ul class="filter triggerAnimation animated" data-animate="fadeInUp">
                                    <li><a id="showall" href="javascript:void(0);" class="active" data-filter="*"><i class="fa fa-th"></i>Show All</a></li>
                                    <li><a id="justpics" href="javascript:void(0);" data-filter=".pics" ><i class="fa fa-camera"></i>Pics</a></li>
                                    <li><a id="justvideos" href="javascript:void(0);" data-filter=".videos" ><i class="fa fa-play"></i>Videos</a></li>
                                </ul>
                                
                                <!-- Gallery SHOW ALL -->
                                <div class="team-members latestGalleriesPicsAndVideos">
                                    <div class="row">
                                        <% if (videosAndPhotos.Count > 0){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated videos" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" rel="<%= videosAndPhotos[0].YouTubeId %>" src="<%= videosAndPhotos[0].Url2 %>">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[0].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[0].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                        <% if (videosAndPhotos.Count > 1){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage">
                                            <input type="hidden" id="hiddenImageId" value="<%=videosAndPhotos[1].Id %>" />
                                            <div class="team-member triggerAnimation animated pics" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="/UploadedImages/original/<%= videosAndPhotos[1].Url %>" class="galleryImage">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[1].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[1].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                        <% if (videosAndPhotos.Count > 2){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated videos" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" rel="<%= videosAndPhotos[2].YouTubeId %>" src="<%= videosAndPhotos[2].Url2 %>">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[2].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[2].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                        <% if (videosAndPhotos.Count > 3){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage">
                                            <input type="hidden" id="hiddenImageId" value="<%=videosAndPhotos[3].Id %>" />
                                            <div class="team-member triggerAnimation animated pics" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="/UploadedImages/original/<%= videosAndPhotos[3].Url %>" class="galleryImage">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[3].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[3].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                        <% if (videosAndPhotos.Count > 4){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 clearLeft">
                                            <div class="team-member triggerAnimation animated videos" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" rel="<%= videosAndPhotos[4].YouTubeId %>" src="<%= videosAndPhotos[4].Url2 %>">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[4].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[4].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                        <% if (videosAndPhotos.Count > 5){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage">
                                            <input type="hidden" id="hiddenImageId" value="<%=videosAndPhotos[5].Id %>" />
                                            <div class="team-member triggerAnimation animated pics" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="/UploadedImages/original/<%= videosAndPhotos[5].Url %>" class="galleryImage">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[5].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[5].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                        <% if (videosAndPhotos.Count > 6){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated videos" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" rel="<%= videosAndPhotos[6].YouTubeId %>" src="<%= videosAndPhotos[6].Url2 %>">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[6].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[6].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                        <% if (videosAndPhotos.Count > 7){ %>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage">
                                            <input type="hidden" id="hiddenImageId" value="<%=videosAndPhotos[7].Id %>" />
                                            <div class="team-member triggerAnimation animated pics" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="/UploadedImages/original/<%= videosAndPhotos[7].Url %>" class="galleryImage">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videosAndPhotos[7].Title %>">
                                                        <h5><a href="#"><%= videosAndPhotos[7].Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        
                                    </div>
								</div>
                                <!-- Gallery -->

                                <% if (latestPhotos != null && latestPhotos.Count > 0)
                                   {
                                       int latestPhotosCounter = 0; %>
                                <!-- Just PICS -->                               
                                <div class="team-members latestGalleriesJustPics">                                    
                                    <div class="row">        
                                        <%foreach (var photo in latestPhotos)
                                          {
                                              latestPhotosCounter += 1; %>                                
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage <%if(latestPhotosCounter == 5){ %> clearLeft<%} %>">
                                            <input type="hidden" id="hiddenImageId" value="<%=photo.Id %>" />
                                            <div class="team-member triggerAnimation animated pics" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="/UploadedImages/original/<%= photo.Url %>" class="galleryImage">
                                                    
                                                </div>
                                                <div class="team-title" title="<%= photo.Title %>">
                                                        <h5><a href="#"><%= photo.Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                      <%} %>
                                    </div>
								</div>
                                <!-- END OF JUST PICS -->
                                <%} %>

                                <!-- Gallery JUST VIDEOS -->
                                <% if (latestVideos != null && latestVideos.Count > 0)
                                   {
                                       int latestVideosCounter = 0; %>
                                <!-- Just PICS -->                               
                                <div class="team-members latestGalleriesJustVideos">                                    
                                    <div class="row">        
                                        <%foreach (var video in latestVideos)
                                          {
                                              latestVideosCounter += 1; %>                                
                                            <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 <%if (latestVideosCounter ==5){ %>clearLeft<%} %>">
                                                <div class="team-member triggerAnimation animated videos" data-animate="fadeInUp">
                                                    <div class="team-info">
                                                	    <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                        <img class="youtube" rel="<%=video.YouTubeId %>" src="<%= video.Url2 %>">
                                                    
                                                    </div>
                                                    <div class="team-title" title="<%= video.Title %>">
                                                         <h5><a href="#"><%= video.Title %></a></h5>
                                                    </div>
                                                </div>
                                            </div>
                                      <%} %>
                                    </div>
								</div>
                                <!-- END OF JUST PICS -->
                                <%} %>
                                <!-- END OF JUST VIDEOS -->
                                
                            </div>
                            <!-- Latest Galleries END -->  

    <%foreach(var image in latestPhotos){ %>
    <!-- Modal Pop-Up BEGIN -->
    <div id="popup_container" class="latestGalleryImage<%=image.Id %>">
        <div id="over_lay"></div>
        <div class="popup_ex">
                  		
            <div id="close_button"><a href="javascript:void(0);"><i class="fa fa-times-circle "></i></a></div>
                        
            <!-- Container -->
            <div class="lightboxcontainer">
                        	
                <!-- Photo -->
                <div class="col-md-8 col-sm-7">
                            
    <%--                            	<div class="slider-container portfolio-featured-gallery" style="margin:0 !important">
				    <div class="image-slider">
					    <div class="image-gallery-item item">
						    <img alt="" src="images/slideshow-1140x390.gif">
					    </div>
					    <div class="image-gallery-item item">
						    <img alt="" src="images/slideshow-1140x390.gif">
					    </div>
					    <div class="image-gallery-item item">
						    <img alt="" src="images/slideshow-1140x390.gif">
					    </div>
					    <div class="image-gallery-item item">
						    <img alt="" src="images/slideshow-1140x390.gif">
					    </div>
				    </div>
				    </div>--%>
				    <div class="portfolio-featured-image triggerAnimation animated" style="margin:0 !important">
					    <img alt="" src="images/slideshow-1140x390.gif" class="imageDialog galleryImage" style="margin:0px;">
				    </div>
                            
                </div>
                            
                            <!-- Photo Details & Social Sharing -->
                            <div class="col-md-4 col-sm-12" style="float: left;">
                            
                            	<div class="spacer small"></div>
                                
                            	<div class="left">
                                    <div class="row">
                                        <%--<div class="col-md-4"><div class="fb-like" data-href="http://latestsightings.socialengine.co.za/gallery" data-layout="standard" data-action="recommend" data-show-faces="false" data-share="false"></div></div>--%>
                                        <div class="col-md-4"><a href="https://twitter.com/share" class="twitter-share-button" data-text="Lastest Kruger" data-via="LatestKruger">Tweet</a></div>
                                    </div>
                            	</div>
                                
                                <h4 class="imageTitle"><%=image.Title %> </h4>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
                                <p class="LocationAndSubmitter">
                                <p style="display:inline;">Location: </p><%=image.Location %> <br>
                                <p style="display:inline;">Image by: </p><%=image.Firstname %>&nbsp;<%=image.Lastname %>
                                </p>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
<%--                                <div class="left">
                                	<a href="#" title="Share to Facebook"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                                    <a href="#" title="Share to Google"><i style="font-size:36px; padding-right:10px;" class="fa fa-google"></i></a>
                                    <a href="#" title="Share to Twitter"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                                </div>--%>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
                                <!-- Facebook Comments BEGIN -->
                                <%--<h4 class="page-titles">Comments</h4>
                                    <div class="fb-comments" data-href="http://latestsightings.socialengine.co.za/gallery/<%=image.Id %>" data-numposts="2" data-colorscheme="dark" data-width="340"></div>--%>
                                <!-- Facebook Comments END -->
                                
                          </div>
                        
            </div> 
            <!-- Container -->
                  		
        </div>
    </div>
    <!-- Modal Pop-Up END3 -->
    <%} %>