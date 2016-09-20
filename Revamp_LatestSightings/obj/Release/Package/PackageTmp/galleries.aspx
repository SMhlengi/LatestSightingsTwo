<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="galleries.aspx.cs" Inherits="Revamp_LatestSightings.galleries" %>

<asp:Content ID="galleries" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="<%= ResolveUrl("~/css/jquery-ui.css?v=4") %>" rel="stylesheet" />

                <%foreach(var latestGalleryImage in imageGallery){ %>
                <!-- Modal Pop-Up BEGIN -->
                <div id="popup_container" class="latestGalleryImage<%=latestGalleryImage.Id %>">
                	<div id="over_lay"></div>
                	<div class="popup_ex">
                  		
                        <div id="close_button"><a href="javascript:void(0);"><i class="fa fa-times-circle"></i></a></div>
                        
                        <!-- Container -->
                        <div class="lightboxcontainer">
                        	
                            <!-- Photo -->
                            <div class="col-md-8 col-sm-12">
                            
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
								    <img alt="" src="images/slideshow-1140x390.gif" class="imageDialog galleryImage">
							    </div>
                            
                            </div>
                            
                            <!-- Photo Details & Social Sharing -->
                            <div class="col-md-4 col-sm-12" style="float: left;">                            
                                
                            	<div class="left">
                                    <div class="row">
                                        <%--<div class="col-md-4"><div class="fb-like" data-href="http://latestsightings.socialengine.co.za/gallery" data-layout="standard" data-action="recommend" data-show-faces="false" data-share="false"></div></div>--%>
                                        <div class="col-md-4"><a href="https://twitter.com/share" class="twitter-share-button" data-text="Lastest Kruger" data-via="LatestKruger">Tweet</a></div>
                                    </div>
                            	</div>
                                
                                <h4 class="imageTitle"><%=latestGalleryImage.Title %> </h4>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
                                <p class="LocationAndSubmitter">
                                <p style="display:inline;">Location: </p><%=latestGalleryImage.Location %> <br>
                                <p style="display:inline;">Image by: </p><%=latestGalleryImage.Firstname %>&nbsp;<%=latestGalleryImage.Lastname %>
                                </p>
                                
<%--                                <div class="left">
                                	<a href="#" title="Share to Facebook"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                                    <a href="#" title="Share to Google"><i style="font-size:36px; padding-right:10px;" class="fa fa-google"></i></a>
                                    <a href="#" title="Share to Twitter"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                                </div>--%>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
                                <!-- Facebook Comments BEGIN -->
                                <h4 class="page-titles">Comments</h4>
                                    <div class="fb-comments" data-href="http://latestsightings.socialengine.co.za/gallery/<%=latestGalleryImage.Id %>" data-numposts="5" data-colorscheme="dark" data-width="380"></div>
                                <!-- Facebook Comments END -->
                                
                          </div>
                        
                        </div> 
                  		<!-- Container -->
                  		
                	</div>
              	</div>
                <!-- Modal Pop-Up END3 -->
                <%} %>
                 
					<div class="row">
                    	<!-- LEFT Content BEGIN -->
						<div class="leftcol">
                        
                        <h1 class="main-title" style="margin-top:0px !important;">Video and Photo Galleries</h1>
                            
                            <!-- Filter Options BEGIN -->
                            <div class="box">
                            
                            	<h7 style="font-size:16px; font-weight:600;">Filter Options</h7>
                                <div class="spacer small"></div>
                                
                                <div class="left">
                                    <select class="form-control media-selection">
                                      <option selected="selected">Search Options</option>
                                      <option value="photos">Photos</option>
                                      <option value="videos">Videos</option>
                                    </select>
                                </div>
                                
                                <div class="spacer small"></div>
                                
                                <div id="gallerySearch">
                              		<div class="form-group">
                                		<label for="exampleInputEmail1">Filter by Parks <i>(defaults to all parks)</i></label>
                                		<input type="text" class="form-control" id="area" placeholder="Type in park name">
                              		</div>
                              		<div class="form-group">
                                    	<label for="exampleInputEmail1">Filter by Animal <i>(defaults to all animals)</i></label>
                                        <input type="text" class="form-control" id="animal" placeholder="Choose Animal">
                                    </div>
                                    <div class="form-group">
                                    	<label for="exampleInputEmail1">Filter by Activities <i>such as, "Sleeping", "Eating", "Mating"</i></label>
                                        <input type="text" class="form-control" id="activity" placeholder="Choose Activity">
                                    </div>
                              		<!--<button type="submit" class="btn btn-default">Filter</button>-->
                                    <button type="button" class="btn btn-default FilterSearch">Filter</button>
                                    <!--<button type="submit" class="btn btn-default">Reset</button>-->
                                    <button type="button" class="btn btn-default ResetSearchFilters">Reset</button>
                                    <button type="button" class="btn btn-default Uploadyourown">Upload your own</button>
                            	</div>

                                <!-- video search -->
                                <div id="videoSearch">
                              		<div class="form-group">
                                		<label for="exampleInputEmail1">Filter by Title </label>
                                		<input type="text" class="form-control" id="videoTitle" placeholder="Title">
                              		</div>
                              		<div class="form-group">
                                    	<label for="exampleInputEmail1">Filter by Keywords</label>
                                        <input type="text" class="form-control" id="keywords" placeholder="Keywords">
                                    </div>
                              		<!--<button type="submit" class="btn btn-default">Filter</button>-->
                                    <button type="button" class="btn btn-default FilterSearch">Filter</button>
                                    <!--<button type="submit" class="btn btn-default">Reset</button>-->
                                    <button type="button" class="btn btn-default ResetSearchFilters">Reset</button>
                                    <button type="button" class="btn btn-default Uploadyourown">Upload your own</button>
                                </div>
                                <!-- end of video search -->
                                                            
                            </div>
                            <!-- Filter Options END -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <%if (imageGallery != null && imageGallery.Count > 0) { %>
                            <!-- Latest Photos BEGIN -->
                            <h4 class="page-titles galleryLatestPhotos">Latest Photos</h4>
                            <div class="blog-grid">
                                
                                <!-- Gallery -->
                                <div class="team-members imageGalleryContainer">
                                    <div class="row">
                                    
                                        <%foreach (var imageItem in imageGallery)
                                          {
                                              imageCounter += 1;%>
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage <%if(imageCounter == 5){ %> clearLeft<%} %>">
                                            <input type="hidden" id="hiddenImageId" value="<%=imageItem.Id %>" />
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="/UploadedImages/original/<%= imageItem.Url %>" class="galleryImage">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#"><%= imageItem.Title %></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>                                      
<%--                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage2">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="images/about-650x650.gif">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#">Giraffes at the water</a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage3">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="images/about-650x650.gif">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#">Giraffes at the water</a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage4">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="images/about-650x650.gif">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#">Giraffes at the water</a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage5">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="images/about-650x650.gif">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#">Giraffes at the water</a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage6">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="images/about-650x650.gif">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#">Giraffes at the water</a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage7">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="images/about-650x650.gif">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#">Giraffes at the water</a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 filterImage8">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                                    <img alt="" src="images/about-650x650.gif">
                                                    
                                                </div>
                                                <div class="team-title">
                                                    <h5><a href="#">Giraffes at the water</a></h5>
                                                </div>
                                            </div>
                                        </div>--%>
                                        
                                    </div>
								</div>
                                <!-- Gallery -->
                                
                            </div>
                            <!-- Latest Photos END -->
                            <%} %>


                        <!-- gallery search results -->
                        <!-- Gallery -->
                        <div class="team-members gallerySearchResults">
                            <div class="row">
                                    
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults1">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults2">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults3">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults4">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults5">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults6">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults7">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults8">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults9">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults10">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults11">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults12">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults13">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults14">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults15">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults16">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                    
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults17">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults18">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults19">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults20">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults21">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults22">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults23">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 gallerySearchResults24">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                            </div>
						</div>
                        <!-- Gallery -->
                        <!-- end of search results -->

                        <!----------------------------------------------------------------------------->
                        <!-- VIDEO search results -->
                        <div class="team-members VideoGallerySearchResults">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults1">
                                        <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                            <div class="team-info">
                                                <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                <img class="youtube" src="" rel="" />
                                                    
                                            </div>
                                            <div class="team-title">
                                                <h5><a href="#">Giraffes at the water</a></h5>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults2">
                                        <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                            <div class="team-info">
                                                <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                <img class="youtube" src="" rel="" />
                                                    
                                            </div>
                                            <div class="team-title">
                                                <h5><a href="#">Giraffes at the water</a></h5>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults3">
                                        <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                            <div class="team-info">
                                                <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                <img class="youtube" src="" rel="" />
                                                    
                                            </div>
                                            <div class="team-title">
                                                <h5><a href="#">Giraffes at the water</a></h5>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults4">
                                        <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                            <div class="team-info">
                                                <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                <img class="youtube" src="" rel="" />
                                                    
                                            </div>
                                            <div class="team-title">
                                                <h5><a href="#">Giraffes at the water</a></h5>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                    
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults5">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults6">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults7">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults8">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults9">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults10">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults11">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img alt="" src="images/about-650x650.gif">
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults12">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                </div>  

                                <div class="row">
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults13">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults14">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults15">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults16">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                </div>              
                                
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults17">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                           <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults18">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults19">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults20">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults21">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                           <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults22">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults23">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-camera"></i></div>
                                           <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                        
                                    <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 VideoGallerySearchResults24">
                                    <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                        <div class="team-info">
                                            <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                            <img class="youtube" src="" rel="" />
                                                    
                                        </div>
                                        <div class="team-title">
                                            <h5><a href="#">Giraffes at the water</a></h5>
                                        </div>
                                    </div>
                                </div>
                                </div>  

						</div>
                        <!-- VIDEO end of search results -->
                        <!----------------------------------------------------------------------------->
                            
                            <div class="clearfix"></div>
                            <div class="spacer"></div>
                            <!-- Latest Videos BEGIN -->
                            <h4 class="page-titles galleryLatestVideos">Latest Videos</h4>
                            <div class="blog-grid">
                                
                                <!-- Gallery -->
                                <div class="team-members videosGalleryContainer">
                                    <div class="row">
                                    
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(0).Url %>" rel="<%= videoGallery.ElementAt(0).YouTubeId %>" />
                                                    
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(0).Title %>">
                                                    <% if (videoGallery.ElementAt(0).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(0).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(0).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(1).Url %>" rel="<%= videoGallery.ElementAt(1).YouTubeId %>" />
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(1).Title %>">
                                                    <% if (videoGallery.ElementAt(1).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(1).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(1).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(2).Url %>" rel="<%= videoGallery.ElementAt(2).YouTubeId %>"/>
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(2).Title %>">
                                                    <% if (videoGallery.ElementAt(2).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(2).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(2).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                       <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(3).Url %>" rel="<%= videoGallery.ElementAt(3).YouTubeId %>"/>
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(3).Title %>">
                                                    <% if (videoGallery.ElementAt(3).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(3).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(3).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(4).Url %>" rel="<%= videoGallery.ElementAt(4).YouTubeId %>"/>
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(4).Title %>">
                                                    <% if (videoGallery.ElementAt(4).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(4).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(4).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(5).Url %>" rel="<%= videoGallery.ElementAt(5).YouTubeId %>"/>
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(5).Title %>">
                                                    <% if (videoGallery.ElementAt(5).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(5).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(5).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(6).Url%>" rel="<%= videoGallery.ElementAt(6).YouTubeId %>"/>
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(6).Title %>">
                                                    <% if (videoGallery.ElementAt(6).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(6).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(6).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                            <div class="team-member triggerAnimation animated" data-animate="fadeInUp">
                                                <div class="team-info">
                                                	<div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                    <img class="youtube" src="<%= videoGallery.ElementAt(7).Url%>" rel="<%= videoGallery.ElementAt(7).YouTubeId %>"/>
                                                    
                                                </div>
                                                <div class="team-title" title="<%= videoGallery.ElementAt(7).Title %>">
                                                    <% if (videoGallery.ElementAt(7).Title.Length > 35 ){ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(7).Title.Substring(0,32) %></a></h5>
                                                    <%}else{ %>
                                                        <h5><a href="#"><%= videoGallery.ElementAt(7).Title %></a></h5>
                                                    <%} %>                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
								</div>
                                <!-- Gallery -->
                                
                            </div>
                            <!-- Latest Videos END -->
                            
                            <div class="clearfix"></div>
                            <div class="spacer"></div>  
                            
                        <!-- LEFT Content END -->
						</div>
                        
                        <!-- RIGHT Content BEGIN -->
						<div class="rightcol">
							<div id="sidebar-area">
                            
                            <!-- Top Stories BEGIN -->
                             <asp:PlaceHolder ID="TopStories" runat="server"></asp:PlaceHolder>
                            <!-- Top Stories END -->
                            
                            <div class="clearfix"></div>
                            <asp:PlaceHolder ID="topTenContributors" runat="server"></asp:PlaceHolder>
                            <div class="clearfix"></div>
                            <div class="spacer small"></div>
                            <asp:PlaceHolder ID="topearningvideos" runat="server"></asp:PlaceHolder>
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <!-- 300x250 AD -->
                            <div class="ad300">
                            <asp:PlaceHolder ID="ad300by50" runat="server"></asp:PlaceHolder>
							</div>
                            <!-- 300x250 AD -->
                                                        
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>

                            <% if (latestBlogs != null && latestBlogs.Count > 0){ %>
                            <!-- Latest Blogs BEGIN -->
                            <h4 class="page-titles">Latest Blogs</h4>
                            
							<div class="widget widget_recentposts">
                                <%foreach (var lastestArticle in latestBlogs){ %>
								    <div class="media recent-posts">
									    <a href="#" class="pull-left"><img alt="" class="media-object sixtyBySixty" src="<%=ConfigurationManager.AppSettings["articleImagePath"]%>/<%= lastestArticle["picture"].ToString() %>"></a>
									    <div class="media-body">
										    <h4 class="media-heading"><a href="#"><%= lastestArticle["header"].ToString() %></a></h4>
									    </div>
								    </div>
                                <%} %>
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                 
                                <div class="button" style="text-align:center;">Read more</div>
                                <div class="button" style="text-align:center;">Subscribe to Newsletter</div>
							</div>
                            <!-- Latest Blogs END -->
                            <%} %>
                            
                            <div class="clearfix"></div>
                        	<div class="spacer small"></div>
                        
                            <!-- 300x250 AD -->
                            <div class="ad300">
                            	<asp:PlaceHolder ID="downloadapp" runat="server"></asp:PlaceHolder>
							</div>
                            <!-- 300x250 AD -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer small"></div>
												
							</div>
						</div>
					</div>
    <script src="<%= ResolveUrl("~/js/galleryviewmodal.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/jquery-uiv4.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/gallery.js?v=33") %>"></script>
    <script src="<%= ResolveUrl("~/js/bootstrap.youtubepopup.min.js?v=10") %>"></script>

</asp:Content>