<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="imageModal.aspx.cs" Inherits="Revamp_LatestSightings.imageModal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:PlaceHolder ID="stylesheets" runat="server"></asp:PlaceHolder>
</head>
<body>
    <link href="<%= ResolveUrl("~/css/jquery-ui.css?v=4") %>" rel="stylesheet" />
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
    <asp:PlaceHolder ID="javascriptFiles" runat="server"></asp:PlaceHolder>
    <script src="<%= ResolveUrl("~/js/galleryviewmodal.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/jquery-uiv4.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/gallery.js?v=13") %>"></script>
    <script src="<%= ResolveUrl("~/js/bootstrap.youtubepopup.min.js?v=10") %>"></script>
</body>
</html>
