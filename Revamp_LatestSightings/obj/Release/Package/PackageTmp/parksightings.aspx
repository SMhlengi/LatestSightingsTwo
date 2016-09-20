<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="parksightings.aspx.cs" Inherits="Revamp_LatestSightings.parksightings" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyB3O6AqwnZ3uHY0h6ulDrxlAWXXrs99VqI"></script>
    <script src="<%= ResolveUrl("~/js/parkSightings.js?v=3") %>"></script>

					<div class="row">
                    	<!-- LEFT Content BEGIN -->
						<div class="leftcol">
                        
                        <h1 class="main-title" style="margin-top:0px !important;">Latest Sightings</h1>
                            
                            <!-- Filter Options BEGIN -->
                            <div class="box">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="left">
                                            <div class="dropdown parks">
                                                <button class="btn btn-default dropdown-toggle" type="button" id="Button1" data-toggle="dropdown" aria-expanded="true">
                                                    Filter By Park
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">Parks</a></li>
                                                </ul>
                                            </div>                                    
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <!-- Filter Options END -->
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                            
                            <!-- Slideshow BEGIN -->
                            <div class="slider-container portfolio-featured-gallery" style="margin:0 !important">
								<div class="image-slider">
                                    <div class="image-gallery-item item">
                                            <img alt="" src="">
                                    </div>

								</div>
							</div>
                            
                            <div class="blog-list-post triggerAnimation animated" data-animate="fadeIn">
                            <div class="blog-list-content">
                            
                            <div class="clearfix"></div>

                            <div class="row">
                                <div class="col-md-9">
                                    <%--<a href="" class="btn btn-primary btn-block owl-prev">Previous</a>--%>
                                </div>
                                <div class="col-md-3">
                                    <a href="javascript:void(0);" class="btn btn-primary btn-block owl-next">Next</a>                                    
                                </div>

                            </div>
                            <div class="clearfix"></div>
                            
                            <h3 style="text-align:center;" class="sightingTingTitle"> 2 Giraffes drinking at the waterhole.. Like father like son</h3>
                            
                            <div class="left">
                            	<div class="left">
                                    <div class="row">
                                        <%--<div class="col-md-2"><a href="https://twitter.com/share" class="twitter-share-button" data-text="Lastest Kruger" data-via="LatestKruger">Tweet</a></div>
                                        <div class="col-md-8"><div class="fb-like" data-href="http://latestsightings.com/sighting/<%= tingId%>" data-layout="button" data-action="recommend" data-show-faces="false" data-share="false"></div></div>--%>
                                        
                                    </div>
                            	</div>
                                <div class="right">
                                	<a href="javascript:void(0);" title="Share to Facebook" class="aboutUsFacebookShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                                    <a href="javascript:void(0);" title="Share to Twitter" class="aboutUsTwitterShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                                </div>
                            </div>
                            
                            <p class="tingDescription">                                
                            </p>

                            </div>
                            </div>

                            <!-- Responsive -->
                                <ins class="adsbygoogle"
                                     style="display:block"
                                     data-ad-client="ca-pub-2507393417436053"
                                     data-ad-slot="3242991009"
                                     data-ad-format="auto"></ins>
                                <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                                </script>
                            <!-- Responsive -->
                            <div class="spacer"></div>

                            <div class="row">
                                <div id="map-canvas" style="width: 100%; height: 330px"></div>
                            </div>
                            
                          <!-- Slideshow END -->
                            
                            <div class="clearfix"></div>
                            <div class="spacer sml"></div>
                            
                            <!-- Facebook Comments BEGIN -->
                            <h4 class="page-titles">Join the Conversation</h4>
                            <div class="fb-comments" data-href="https://latestsightings.com/park/sightings/<%= parkid.ToString()%>" data-numposts="5" data-colorscheme="dark" data-width="750"></div>
                            <!-- Facebook Comments END -->
                            
                            <div class="clearfix"></div>
                            <div class="spacer"></div> 
                            
                            <div class="clearfix"></div>
                        	<div class="spacer"></div>
                        
                            <!-- Space for web ads BEGIN
                            <div class="comment-box">
                            	<p style="text-align:center">Space for web ads</p>
							</div>
                            Space for web ads END --> 
                            
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
					</div>
            <script src="<%=ResolveUrl("~/js/sighting.js") %>"></script>
</asp:Content>
