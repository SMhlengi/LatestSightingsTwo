<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="galleryview.aspx.cs" Inherits="Revamp_LatestSightings.galleryview" %>

<asp:Content ID="galleryview" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

		<!-- Main Container Section -->			
		<div class="container">
			<div id="page-content">
			
				<!-- Page Content Area -->
				<div id="content-inner">
                
                <!-- Modal Pop-Up BEGIN -->
                <div id="popup_container">
                	<div id="over_lay"></div>
                	<div class="popup_ex">
                  		
                        <div id="close_button"><a href="#"><i class="fa fa-times-circle "></i></a></div>
                        
                        <!-- Container -->
                        <div class="lightboxcontainer">
                        	
                            <!-- Photo -->
                            <div class="col-md-9 col-sm-12">
                            
                            	<div class="slider-container portfolio-featured-gallery" style="margin:0 !important">
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
								</div>
                            
                            </div>
                            
                            <!-- Photo Details & Social Sharing -->
                            <div class="col-md-4 col-sm-12">
                            
                            	<div class="spacer small"></div>
                                
                            	<div class="left"><img src="images/FBandTwitter.jpg" width="202" height="20"></div>
                                
                                <div class="clearfix"></div>
                                <div class="spacer"></div>
                                
                                <h4> Battle of the Kruger </h4>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
                                <p>
                                Location: Kruger National Park <br>
                                Submitted by: LionWhisperer
                                </p>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
                                <div class="left">
                                	<a href="#" title="Share to Facebook"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                                    <a href="#" title="Share to Google"><i style="font-size:36px; padding-right:10px;" class="fa fa-google"></i></a>
                                    <a href="#" title="Share to Twitter"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                                </div>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                
                                <!-- Facebook Comments BEGIN -->
                                <h4 class="page-titles">Comments</h4>
                                <div class="blog-grid">
                                    <img src="images/FBComments_sml.jpg" width="587" height="682"> 
                                </div>
                                <!-- Facebook Comments END -->
                                
                          </div>
                        
                        </div> 
                  		<!-- Container -->
                  		
                	</div>
              	</div>
                <!-- Modal Pop-Up END3 -->
                    
					<div class="row">
                    	<!-- LEFT Content BEGIN -->
						<div class="leftcol">
                        
                        <h1 class="main-title" style="margin-top:0px !important;">Video and Photo Galleries</h1>
                            
                            <!-- Filter Options BEGIN -->
                            <div class="box">
                            
                            	<h7 style="font-size:16px; font-weight:600;">Filter Options</h7>
                                <div class="spacer small"></div>
                                
                                <div class="left">
                            	<div class="dropdown">
                          			<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                        All Media
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Photos</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Videos</a></li>
                                    </ul>
                                </div>
                                </div>
                                
                                <div class="spacer small"></div>
                                
                                <form>
                              		<div class="form-group">
                                		<label for="exampleInputEmail1">Filter by Parks <i>(defaults to all parks)</i></label>
                                		<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Type in park name">
                              		</div>
                              		<div class="form-group">
                                    	<label for="exampleInputEmail1">Filter by Animal <i>(defaults to all animals)</i></label>
                                        <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Choose Animal">
                                    </div>
                                    <div class="form-group">
                                    	<label for="exampleInputEmail1">Filter by Activities <i>such as, "Sleeping", "Eating", "Mating"</i></label>
                                        <input type="email" class="form-control" id="Email1" placeholder="Choose Activity">
                                    </div>
                              		<button type="submit" class="btn btn-default">Filter</button>
                                    <button type="submit" class="btn btn-default">Reset</button>
                            	</form>
                                                            
                            </div>
                            <!-- Filter Options END -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <!-- Latest Photos BEGIN -->
                            <h4 class="page-titles">Latest Photos</h4>
                            <div class="blog-grid">
                                
                                <!-- Gallery -->
                                <div class="team-members">
                                    <div class="row">
                                    
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                
                            </div>
                            <!-- Latest Photos END -->
                            
                            <div class="clearfix"></div>
                            <div class="spacer"></div>
                            
                            <!-- Latest Videos BEGIN -->
                            <h4 class="page-titles">Latest Videos</h4>
                            <div class="blog-grid">
                                
                                <!-- Gallery -->
                                <div class="team-members">
                                    <div class="row">
                                    
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                       <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                                        
                                        <div class="col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
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
                            <h4 class="page-titles">Top Stories</h4>
                            
							<div class="widget widget_recentposts">
								<div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">The wild and all it has to offer</a></h4>
									</div>
								</div>
                                
								<div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">When Should I Warm Up Dinner?</a></h4>
									</div>
								</div>
                                
								<div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">This is a Beautiful Post in Blog</a></h4>
									</div>
								</div>
                                
                                <div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">When Should I Warm Up Dinner?</a></h4>
									</div>
								</div>
                                
							</div>
                            <!-- Top Stories END -->
                            
                            <div class="clearfix"></div>
                            
                            <!-- Top 10 BEGIN -->
                            <h4 class="page-titles">January Top 10</h4>
                          	
                            <ul class="nav nav-pills">
                              <li role="presentation" class="active"><a href="#">Contributors</a></li>
                              <li role="presentation"><a href="#">Tingers</a></li>
                            </ul>
                            
                            <div class="table-responsive">
                              <table class="table table-striped">
                              	
							    <tr>
							      <td>Username</td>
							      <td>Total Views</td>
						        </tr>
							    <tr>
							      <td>de Koker - de Rocker</td>
							      <td>315 442</td>
						        </tr>
							    <tr>
							      <td>Ian Twee Drie</td>
							      <td>306 234</td>
						        </tr>
							    <tr>
							      <td>Allan Smith</td>
							      <td>301 100</td>
						        </tr>
							    <tr>
							      <td>Jock</td>
							      <td>290 506</td>
						        </tr>
							    <tr>
							      <td>Lion Whisperer</td>
							      <td>287 356</td>
						        </tr>
							    <tr>
							      <td>EveOfDaLion</td>
							      <td>276 987</td>
						        </tr>
							    <tr>
							      <td>DanceWithHyenas</td>
							      <td>273 003</td>
						        </tr>
							    <tr>
							      <td>iBite</td>
							      <td>256 145</td>
						        </tr>
							    <tr>
							      <td>Piesana</td>
							      <td>232 467</td>
						        </tr>
							    <tr>
							      <td>VidsThatPay</td>
							      <td>182 783</td>
						        </tr>
							    <tr>
							      <td>TMuller</td>
							      <td>156 287</td>
						        </tr>
						        
                              </table>
                              
                              <a href="#" >
                              	<div class="button" style="text-align:center;">Become a Contributor</div>
                              </a>
                              	
                            </div>
                            <!-- Top 10 END -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <!-- 300x250 AD -->
                            <div class="ad300">
                            	<img src="images/ads-300x250.gif" width="300" height="250">
							</div>
                            <!-- 300x250 AD -->
                                                        
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>

                            <!-- Latest Blogs BEGIN -->
                            <h4 class="page-titles">Latest Blogs</h4>
                            
							<div class="widget widget_recentposts">
								<div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">The wild and all it has to offer</a></h4>
									</div>
								</div>
                                
								<div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">When Should I Warm Up Dinner?</a></h4>
										<!--<aside>Aug 10, 2013</aside>-->
									</div>
								</div>
                                
								<div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">This is a Beautiful Post in Blog</a></h4>
										<!--<aside>Aug 10, 2013</aside>-->
									</div>
								</div>
                                
                                <div class="media recent-posts">
									<a href="#" class="pull-left"><img alt="" class="media-object" src="images/recent-60x60.gif"></a>
									<div class="media-body">
										<h4 class="media-heading"><a href="#">When Should I Warm Up Dinner?</a></h4>
										<!--<aside>Aug 10, 2013</aside>-->
									</div>
								</div>
                                
                                <div class="clearfix"></div>
                                <div class="spacer small"></div>
                                 
                                <div class="button" style="text-align:center;">Read more</div>
                                <div class="button" style="text-align:center;">Subscribe to Newsletter</div>
							</div>
                            <!-- Latest Blogs END -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer small"></div>
                        
                            <!-- 300x250 AD -->
                            <div class="ad300">
                            	<img src="images/app.gif" width="300" height="250">
							</div>
                            <!-- 300x250 AD -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer small"></div>
												
							</div>
						</div>
					</div>
				</div>
				<!-- End Content Area -->
				
			</div>
		</div>
		<!-- End Container -->

        <script src="<%= ResolveUrl("~/js/galleryviewmodal.js") %>"></script>

</asp:Content>