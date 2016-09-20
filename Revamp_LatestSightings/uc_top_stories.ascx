<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_top_stories.ascx.cs" Inherits="Revamp_LatestSightings.uc_top_stories" %>

<% if (topFeaturedArticles != null && topFeaturedArticles.Count > 0){ %> 
    <!-- Top Stories BEGIN -->
    <h4 class="page-titles">Top Stories</h4>
                            
	<div class="widget widget_recentposts">
                               
            <% foreach(var article in topFeaturedArticles){ %>
                    <div class="media recent-posts">
					<a href="/blog/<%=article.Url2.Replace(" ", "_") %>" class="pull-left"><img alt="" class="media-object sixtyBySixty" src="<%= ConfigurationManager.AppSettings["articleImagePath"] %>/<%=article.Url %>"></a>
					<div class="media-body">
						<h4 class="media-heading"><a href="/blog/<%=article.Url2.Replace(" ", "_") %>"><%=article.Title %></a></h4>
					</div>
				</div>
            <%} %>
                                
                                
	</div>
    <!-- Top Stories END -->
<%} %>