<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_LatestBlogs.ascx.cs" Inherits="Revamp_LatestSightings.uc_LatestBlogs" %>
<% if (latestBlogs != null && latestBlogs.Count > 0){ %>
<!-- Latest Blogs BEGIN -->
<h4 class="page-titles">Latest Blogs</h4>
                            
<div class="widget widget_recentposts">
    <%foreach (var lastestArticle in latestBlogs){ %>
		<div class="media recent-posts">
			<a href="/blog/<%=lastestArticle["urlName"].Replace(" ","_") %>" class="pull-left"><img alt="" class="media-object sixtyBySixty" src="<%=ConfigurationManager.AppSettings["articleImagePath"]%>/<%= lastestArticle["picture"].ToString() %>"></a>
			<div class="media-body">
				<h4 class="media-heading"><a href="/blog/<%=lastestArticle["urlName"].Replace(" ","_") %>"><%= lastestArticle["header"].ToString() %></a></h4>
			</div>
		</div>
    <%} %>
    <div class="clearfix"></div>
    <div class="spacer small"></div>
                                 
    <div class="button readmoreblogs" style="text-align:center;">Read more</div>
    <div class="button newsletter" style="text-align:center;">Subscribe to Newsletter</div>

    <div class="panel panelWithWhiteBackgroundBorder">
        <div class="panel-body">
            <div class="row newsletterForm">
            <div class="input-group form-group mb15">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input type="email" class="form-control" placeholder="Email Address" id="email">
            </div>
            <div class="input-group form-group email">
                <p class="text-danger">Email is required</p>
            </div>
        </div>
        <div class="row newsletterFormSingup">
            <div class="pull-right">
                <button type="button" class="btn btn-success subScribeToNewsletter">Subscribe <i class="fa fa-angle-right ml5"></i></button>
            </div>
        </div>
            <div class="row newslettersubscribing">
                <div class="col-sm-12">
                    <strong id="userFullname">Subscribing</strong><br />Please wait .....
                </div>
            </div>
            <div class="row successfullySubscribeToNewsletter">
                <div class="col-sm-12">
                    <br />
                    <strong id="Strong1">Successfully Subscribed !!!</strong>
                </div>
            </div>
		</div>
	</div>
</div>
<!-- Latest Blogs END -->
<%} %>