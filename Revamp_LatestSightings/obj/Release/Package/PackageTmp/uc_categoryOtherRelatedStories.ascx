<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_categoryOtherRelatedStories.ascx.cs" Inherits="Revamp_LatestSightings.uc_categoryOtherRelatedStories" %>


    <% if(cateogryArticles != null && cateogryArticles.Count > 0){ %>
    <h4 class="page-titles">Other Related Stories</h4>
                        
<div class="widget widget_recentposts">
    <% foreach(var relatedArticle in cateogryArticles){ %>    
	
		<div class="media recent-posts">
            <%if (!String.IsNullOrEmpty(relatedArticle["picture"])){ %>
                <a href="#" class="pull-left"><img alt="" class="media-object sixtyBySixty" src="<%=ConfigurationManager.AppSettings["articleImagePath"] %>/<%=relatedArticle["picture"] %>"></a>
            <%} %>			
			<div class="media-body">
                <%if (categoryId == Convert.ToInt32(ConfigurationManager.AppSettings["contentCategoryId"])){ %>
                    <h4 class="media-heading"><a href="/<%=relatedArticle["url"]%>"><%=relatedArticle["header"] %></a></h4>
                <%}else{ %>
				<h4 class="media-heading"><a href="/blog.aspx?id=<%=relatedArticle["id"] %>&cat=<%=relatedArticle["categoryId"]  %>"><%=relatedArticle["header"] %></a></h4>
                <%} %>
			</div>
		</div>                                
	
    <%} %>
</div>
<%} %>