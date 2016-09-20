<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_homeLatestBlogs.ascx.cs" Inherits="Revamp_LatestSightings.uc_homeLatestBlogs" %>

<!-- Latest Blogs BEGIN -->
<link rel="stylesheet" href="<%= ResolveUrl("~/css/LatestBlogs.css") %>">

<h4 class="page-titles">Latest Blogs</h4>
<div class="loadingImage"><img src="<%=ResolveUrl("~/images/333.GIF") %>"></div>                     
<div class="widget widget_recentposts" id="homepageLatestBlogs">

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