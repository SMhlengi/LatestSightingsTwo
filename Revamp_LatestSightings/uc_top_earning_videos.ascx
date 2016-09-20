<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_top_earning_videos.ascx.cs" Inherits="Revamp_LatestSightings.uc_top_earning_videos" %>
<link rel="stylesheet" href="<%= ResolveUrl("~/css/topEarningVideos.css") %>" />

    <div class="clearfix"></div>
    <div class="spacer small"></div>
<h4 class="page-titles">Recent Top Earning Videos</h4>

    <%foreach (var stat in video_stats)
      { %>
		<div class="media recent-posts">
			<a href="javascript:void(0);" class="pull-left"><img class="youtube" src="<%= stat.youtubeVideo.ImageDefault %>" rel="<% = stat.VideoId %>"></a>
			<div class="media-body">
				<h5 class="media-heading" style="font-weight:normal"><a class="youtube" rel="<% = stat.VideoId %>" href="javascript:void(0);" ><%= stat.VideoTitle %></a></h5>
                <p class="top-earning-user">Filmmaker earned R<% = Convert.ToDecimal(stat.Stat1).ToString("#.##") %></p>
			</div>
		</div>
    <%} %>
    <div class="clearfix"></div>
    <div class="spacer small"></div>

        <a href="/partnership" >
        <div class="button becomeAContributor" style="text-align:center;">Submit a video and earn</div>
        </a>