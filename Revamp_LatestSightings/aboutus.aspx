<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="Revamp_LatestSightings.aboutus" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>


<asp:Content ID="aboutuspage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">                    
					<div class="row">
                    	<!-- LEFT Content BEGIN -->
						<div class="leftcol">
                        
                            <h1 class="main-title" style="margin-top:0px !important;">About Us</h1>
                            
                            <!-- Buttons BEGIN -->
                            <ul class="nav nav-pills">
                                <li role="presentation" class="active aboutUsTab"><a href="javascript:void(0);">About Latest Sightings</a></li>
                                <li role="presentation" class="aboutNadavTab"><a href="javascript:void(0);">About Nadav Ossendryver</a></li>
                            </ul>
                            <!-- Buttons END -->
                        
                            <div class="clearfix"></div>
                            <div class="spacer sml"></div>
                            
                            <!-- About LS BEGIN -->
                            <div class="blog-list-post triggerAnimation animated aboutUs" data-animate="fadeIn">
                                <div class="blog-list-featured-image">
                                    <a href="#"><img alt="" src="images/aboutuspic.jpg"></a>
                                    <!--<div class="playicon"><i class="fa fa-play"></i></div>-->
                                </div>
                                            
                                <div class="blog-list-content">
                                    <h2 class="blog-list-title">About Latest Sightings</h2>
                                    <p>Latest Sightings was established in 2012 by schoolboy Nadav Ossendryver. As an obsessive Kruger Park visitor Nadav’s favourite pastime was asking his parents to flag down passing motorists and asking them what they had seen. Eventually they tired of this hobby and began to say no. Nadav looked to technology to solve his problem. He established Latest Sightings and from there it quite literally exploded!<br><br>

The community is extremely loyal and without question “obsessed” about wildlife and the amazing Kruger Park! Many followers chat with friends daily on the WhatsApp groups, whether they’re in the Park or in the office. They share incredible video content through the Latest Sightings YouTube channel and it has quickly become one of the top ten most viewed channels in South Africa.<br><br>

When Nadav is in the Kruger Park, a new holiday favourite is getting the community together on the deck after a day’s viewing, to meet, chat and share tales. A great way to end off.<br><br>

Latest Sightings is a great way to meet like minded people and to explore your passion for wildlife.<br>
Like our Facebook page or download the app to become part of the fastest growing wildlife group in SA.
</p>
                    <div class="left">
                        <!--<img src="images/FBandTwitter.jpg" width="202" height="20"> -->
                        <div class="right">
                            <a href="javascript:void(0);" title="Share to Facebook" class="aboutUsFacebookShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                            <!--<a href="#" title="Share to Google"><i style="font-size:36px; padding-right:10px;" class="fa fa-google"></i></a>-->
                            <a href="javascript:void(0);" title="Share to Twitter" class="aboutUsTwitterShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                        </div>
                    </div>
                                </div>
                            </div>
                            <!-- About LS END -->


                            <!-- About Nadav Ossendryver begins -->
                            <div class="blog-list-post triggerAnimation animated AboutNadavOssendryver" data-animate="fadeIn">
                                <div class="blog-list-featured-image">
                                <a href="#"><img alt="" src="http://latestsightings.socialengine.co.za/images/NadavOssendryver.jpg"></a>
                                <!--<div class="playicon"><i class="fa fa-play"></i></div>-->
                                </div>
                                            
                                <div class="blog-list-content">
                                <h2 class="blog-list-title">Nadav Ossendryver – Founder of Latest Sightings</h2>
                                <p>
                                    Nadav Ossendryver is one of those teenagers you just hope your child is going to be like. Part techno-boffin, part drummer, big part tennis player, A-grade Matric scholar!<br /><br />

                                    He was just 15 years old when he established Latest Sightings and never imagined that it would be a fulltime business before he even finished school. He also couldn’t have
                                    imagined that it would lead him to meeting US President Barack Obama or Kingsley Holgate, or gracing the boardrooms of Microsoft, Google and Nokia or joining WildEarthTV as
                                    a camera operator for National Geographic’s “Big Cat Week. He also was the Keynote speaker for the opening of Facebook in Africa.<br /><br />

                                   Despite his profile he remains a conservationist and the bush is definitely his place to be. He is far more at home in a tent and next to the camp fire than at his desk
                                   studying for his next maths distinction! He gets his biggest kicks from spotting wild dogs or meeting community members to chat about what they have seen!<br /><br />
                                </p>
                                <div class="left">
                                <!--<img src="images/FBandTwitter.jpg" width="202" height="20"> -->
                                <div class="right">
                                <a href="javascript:void(0);" title="Share to Facebook" class="aboutUsFacebookShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                                <!--<a href="#" title="Share to Google"><i style="font-size:36px; padding-right:10px;" class="fa fa-google"></i></a>-->
                                <a href="javascript:void(0);" title="Share to Twitter" class="aboutUsTwitterShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                                </div>
                                </div>
                                </div>
                            </div>
                            <!-- About Nadav Ossendryver -->
                            
                            <div class="clearfix"></div>
                            <div class="spacer sml"></div>
                            
                            <!-- Facebook Comments BEGIN -->
                            <h4 class="page-titles">Join the Conversation</h4>
                            <div class="fb-comments" data-href="http://latestsightings.socialengine.co.za/about-us" data-numposts="5" data-colorscheme="dark" data-width="750"></div>
                            <!-- Facebook Comments END -->
                            
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
                                                        
                            <!-- Top Stories BEGIN -->
                             <asp:PlaceHolder ID="TopStories" runat="server"></asp:PlaceHolder>
                            <!-- Top Stories END -->
                            
                            <div class="clearfix"></div>
                            
                            <!-- Top 10 BEGIN -->
                            <asp:PlaceHolder ID="topTenContributors" runat="server"></asp:PlaceHolder>
                            <!-- Top 10 END -->
                            <div class="clearfix"></div>
                            <div class="spacer small"></div>
                            <asp:PlaceHolder ID="topearningvideos" runat="server"></asp:PlaceHolder>
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <!-- 300x250 AD -->
                            <asp:PlaceHolder ID="ad300by50" runat="server"></asp:PlaceHolder>
                            <!-- 300x250 AD -->
                                                        
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>

                            <!-- Latest Blogs BEGIN -->
                                <asp:PlaceHolder ID="plc_latestBlogs" runat="server" />                            
                            <!-- Latest Blogs END -->
                            
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


                        <!-- Modal Pop-Up BEGIN -->
                        <div id="popup_container">
                	        <div id="over_lay"></div>
                	        <div class="popup_ex">
                  		
                                <div id="close_button"><a href="#"><i class="fa fa-times-circle "></i></a></div>
                        
                                <!-- Container -->
                                <div class="lightboxcontainer">
                        	
                                    <!-- Photo -->
                                    <div class="col-md-9 col-sm-12">
                            
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
					</div>

    <script src="<%= ResolveUrl("~/js/galleryviewmodal.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/homePage.js?v=5") %>"></script>
    <script src="<%= ResolveUrl("~/js/bootstrap.youtubepopup.min.js?v=10") %>"></script>

</asp:Content>