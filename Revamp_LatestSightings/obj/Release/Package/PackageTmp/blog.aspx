<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="Revamp_LatestSightings.blog" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="blog" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


			
<!-- Page Content Area -->
                
        <!-- Blog Category BEGIN -->
        <asp:PlaceHolder ID="cagegories" runat="server"></asp:PlaceHolder>
        <!-- Blog Category END -->
                    
	<div class="row">
        <!-- LEFT Content BEGIN -->
		<div class="leftcol">
                        	
            <!-- Blog BEGIN -->
            <h1 class="main-title" style="margin-top:0px !important;"><%= article["header"] %></h1>
            <div class="row">
                <div class="col-md-1">
<a href="https://twitter.com/share" class="twitter-share-button" data-url="https://latestsightings.com/blog/<%=BlogUrlTitle %>" data-dnt="false" data-text="<% =blog_friendlyTitle.Trim() %> @LatestKruger">Tweet</a>
                                <script>    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
                </div>
                <div class="col-md-8">
                    <div class="fb-share-button" data-href="https://www.latestsightings.com/blog/<%=BlogUrlTitle %>" data-layout="button_count" data-mobile-iframe="true"></div>
                </div>
<%--                <div class="col-md-3">
                    <a class='wa_btn wa_btn_s' expr:data-href='data:post.url' expr:data-text='data:post.title' href='whatsapp://send' style='display:none'>Share</a>
                </div>--%>
            </div>
            <br />
            <div class="blog-list-post triggerAnimation animated" data-animate="fadeIn">
                <div class="blog-list-featured-image">
                    <a href="javascript:void(0);"><img alt="" src="<%= ConfigurationManager.AppSettings["articleImagePath"] %>/<%= article["picture"] %>"></a>
                </div>
                     
                <div class="blog-details">
							<span class="blog-date"><%= article["dateCreated"] %></span>
						</div>
                                            
                <div class="blog-list-content">
                                
                    <div style="color:white">
                        <%= article["body"].Replace("color: #111111;", "").Replace("color: #333333;", "").Replace("color: #444444;", "") %>
                    </div>

					<div class="clearfix"></div>
                    <div class="spacer sml"></div>

					<div class="left">
                        <!--<img src="images/FBandTwitter.jpg" width="202" height="20"> -->
                        <div class="right">
                            <a href="javascript:void(0);" title="Share to Facebook" class="blogFacebookShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                            <!--<a href="#" title="Share to Google"><i style="font-size:36px; padding-right:10px;" class="fa fa-google"></i></a>-->
                            <a href="javascript:void(0);" title="Share to Twitter" class="blogTwitterShare"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                        </div>
                    </div>
                                    
                    <div class="clearfix"></div>
                    <div class="spacer sml"></div>
                                    
                </div>
                                
                                
                                
                                
                            
            </div>
                            
            <!-- Blog END -->
                            
                            
                            
            <!-- Latest Blogs BEGIN -->
            <asp:PlaceHolder ID="otherRelatedArticles" runat="server"></asp:PlaceHolder>
            <!-- Latest Blogs END -->
                            
            <div class="clearfix"></div>
            <div class="spacer sml"></div>
                            
            <!-- Facebook Comments BEGIN -->
            <h4 class="page-titles">Join the Conversation</h4>
            <div class="fb-comments" data-href="http://latestsightings.com/blog/<%=BlogUrlTitle %>" data-numposts="5" data-colorscheme="dark" data-width="750"></div>
            <!-- Facebook Comments END -->
                            
        <!-- LEFT Content END -->
		</div>
                        
        <!-- RIGHT Content BEGIN -->
		<div class="rightcol">
			<div id="sidebar-area">
                                                        
            <!-- Top Stories BEGIN -->
            <asp:PlaceHolder ID="lastBlogs" runat="server"></asp:PlaceHolder>
            <!-- Top Stories END -->
                            
            <div class="clearfix"></div>
            <div class="spacer"></div>
                            
            <!-- 300x250 AD -->
            <div class="ad300">
                <asp:PlaceHolder ID="ad300by50" runat="server"></asp:PlaceHolder>
			</div>
            <!-- 300x250 AD -->
                            
            <div class="clearfix"></div>
            <div class="spacer"></div>
                            
            <!-- Top 10 BEGIN -->
            <asp:PlaceHolder ID="monthlyTopContributors" runat="server"></asp:PlaceHolder>
            <!-- Top 10 END -->
            <div class="clearfix"></div>
            <div class="spacer small"></div>
            <asp:PlaceHolder ID="topearningvideos" runat="server"></asp:PlaceHolder>
                            
												
			</div>
		</div>
	</div>
<!-- End Content Area -->

    <script src="<%= ResolveUrl("~/js/galleryviewmodal.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/homePage.js?v=5") %>"></script>
    <script src="<%= ResolveUrl("~/js/bootstrap.youtubepopup.min.js?v=10") %>"></script>


</asp:Content>