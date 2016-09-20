<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="partnership.aspx.cs" Inherits="Revamp_LatestSightings.partnership" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="partnership" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<style>
    .left{
        width:auto;
    }
    .becomeAContributor{
        display:none;
    }
</style>
                    
					<div class="row">
                    	<!-- LEFT Content BEGIN -->
						<div class="">
                        
                            <h1 class="main-title" style="margin-top:0px !important;">Film and Earn with Latest Sightings</h1>                            
                            <!-- Partnerships BEGIN -->
                            
                            	<!-- Big Image BEGIN -->
                                <div class="blog-list-post triggerAnimation animated fadeIn" data-animate="fadeIn">
                                    
                                        <div class="blog-details">

                                            <%--<span class="blog-date">July 10 2016</span>--%>
                                            <br /><br />
                                        </div>

                                        <div class="blog-list-content">
                                        
                                        <div class="col-sm-12 col-md-6">
                                            <h2 style="text-transform:uppercase; margin-top:0px; margin-bottom:10px;">Earn monthly cash by uploading your wildlife photos & videos</h2>

                                            <div class="" style="padding-left:20px;">
                                            <ul>
                                                <li>Our Youtube channel gets over 15 million views per month</li>
                                                <li>We are experts at making animal videos and photos go viral</li>
                                                <li>We share 40% of the revenue earned with you every month</li>
                                                <li>Some members have already earned over $15 000 (R200 000)</li>
                                            </ul>
                            
                                            </div>
                                        </div>

                                            <div class="col-sm-12 col-md-6 right">
                                                <img alt="" src='<%=ResolveUrl("~/images/partnership1.png")%>' style="max-width:65%;">
                                                <h4 style="text-align: center;line-height: 1.5;">We accept any wildlife from anywhere in the world</h4>
                                                <a href="/login"><div class="col-sm-3 right button">Join Now</div></a>
                                            </div>  
 
					                    <div class="clearfix"></div>
                                        <div class="divline"></div>
                                        <div class="spacer sml"></div>

                                        <div class="row">           
                                        <div class="col-sm-12 col-md-6 right">
                                            <h2 style="text-transform:uppercase; margin-top:0px; margin-bottom:10px;">HOW DO YOU EARN?</h2>

                                            <div class="" style="padding-left:20px;">
                                            <ol>
                                                <li>Upload your video</li>
                                                <li>Your video needs to be approved</li>
                                                <li>Once approved, we promote it on Youtube and many other media channels</li>
                                                <li>You start earning an extra monthly income</li>
                                            </ol>
                            
                                            </div>

                                            <a href="/login"><div class="col-sm-3 right button">Join Now</div></a>

                                        </div>



                                        <div class="col-sm-12 col-md-6 left">
                                            <img alt="" src="<%=ResolveUrl("~/images/partnership2.png") %>" style="max-width:65%;">
                                        </div>



                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="spacer sml"></div>
                                                <p>We select the very best wildlife content from the many incredible wildlife spots around the world.
                                                <br> We promote your viral worthy content into our established network of media partners. 
                                                <br>All income received gets shared with you. Some our top contributors have earned up to $15 000. <br>On average a viral video earns $XXXS over a lifetime. We of course don't know upfront what a video will earn.</p>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="spacer sml"></div>


                                        <div class="row">           
                        <div class="col-sm-12 col-md-8 left">
                            <h2 style="margin-top:0px; margin-bottom:10px;">What goes viral and makes money?</h2>

                            <div class="" style="padding-left:20px;">
                            <ol>
                                <li>Videos and photos that tell a story</li>
                                <li>Cute, funny, heart warming videos and pics</li>
                                <li>Straight out rare sightings and experiences</li>
                                <li>Action packed hunts and fights</li>
                            </ol>
                            
                            </div>

                            <h4 style="line-height: 1.5;">
                                Does quality matter? No! It's all about being authentic.
                                <br>Some of our best content is filmed with cell phones.
                            </h4>

                            <div class="clearfix"></div>
                            <div class="spacer sml"></div>
                            <img alt="" src="<%=ResolveUrl("~/images/partnership3.png") %>" style="max-width:65%;">
                            <div class="spacer sml"></div>

                        </div>

                        <div class="col-sm-12 col-md-4 right">
<%--                        <h2 style="margin-top:0px; margin-bottom:10px;">Leaderboard</h2>--%>
                            <!-- Top 10 BEGIN -->
                            <asp:PlaceHolder ID="topearningvideos" runat="server"></asp:PlaceHolder>
                            <!-- Top 10 END -->
                        </div>



                    </div>

                                        <div class="clearfix"></div>
                                        <div class="divline"></div>
                                        <div class="spacer sml"></div>
                                                                                                                  
                                        </div>

                                            <!-- Latest Blogs BEGIN -->
            
                                    <h4 class="page-titles">Check out these viral videos</h4>
                                    <div class="blog-grid" style="width: 96%; margin:0 auto;">
                                        <div class="right col-sm-12 col-md-6">
                                            <h4 style="line-height: 2; text-align: right;" class="col-sm-8">Have any similar?</h4>
                                            <a href="/addmedia"><div class="col-sm-3 right button">Submit Now</div></a>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="spacer sml"></div>
                                
                                
                                    <!-- Gallery -->
                                    <div class="team-members">
                                        <div class="row">
                                            <%if (featuredVideos != null && featuredVideos.Count() > 0){ %>
                                                <%foreach(var video in featuredVideos){ %>
                                                    <div class="img-link col-md-3 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1">
                                                        <div class="team-member triggerAnimation animated videos" data-animate="fadeInUp">
                                                            <div class="team-info">
                                                                <div class="related-gallery-icon"><i class="fa fa-play"></i></div>
                                                                <img class="youtube" src="<%=video.Url2 %>" rel="<%=video.YouTubeId %>">
                                                    
                                                            </div>
                                                            <div class="team-title">
                                                                <h5><a href="javascript:void(0);"><%=video.Title %></a></h5>
                                                            </div>
                                                        </div>
                                                    </div>

                                                <%} %>
                                            <%} %>
                                        </div>
                                    </div>
                                     <!-- Gallery -->
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="spacer sml"></div>
                            
                                </div>
						</div>
             
<%--						<div class="rightcol">
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
						</div>--%>
					</div>
				<!-- End Content Area -->

    <script>
        $(document).ready(function () {
            // code for play video image when clicked
            $(function () {
                $(".youtube").YouTubeModal({ autoplay: 0, width: 640, height: 480 });
            });

            $(".img-link").click(function () {
                $(this).find("img").click();
            });
        });
    </script>
    <script src="<%= ResolveUrl("~/js/bootstrap.youtubepopup.min.js?v=10") %>"></script>
</asp:Content>