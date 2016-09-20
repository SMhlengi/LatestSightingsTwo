<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="searchResults.aspx.cs" Inherits="Revamp_LatestSightings.searchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="<%= ResolveUrl("~/css/searchResults.css?v=2") %>" rel="stylesheet" />

<ul class="nav nav-tabs nav-justified">
    <li role="presentation" class="active articles"><a href="#">Articles</a></li>
    <li role="presentation" class="vids"><a href="#">Videos</a></li>
    <li role="presentation" class="images"><a href="#">Images</a></li>
</ul>

<div class="articleResultsOptionTwo">
    <%if (c_articles != null && c_articles.Count > 0) { %>
         <%foreach (var item in c_articles){ %>
            <%if (item["body"] != ""){ %>

                <div class="bs-callout bs-callout-danger" id="callout-tables-striped-ie8">
                    <h4> <%=item["header"] %></h4>
                    <%--<p> <%=item["body"] %></p>--%>
                    <br />
                    <p> <code><a class="articleReadMore" href="/blog.aspx?id=<%=item["id"] %>&cat=<%=item["catid"] %>"> Read more ...</a></code></p>
                  </div>
            <%} %>
        <%} %>
     <%} %>
</div>

<div class="videoResults">
    <asp:PlaceHolder ID="youTubeVids" runat="server"></asp:PlaceHolder>
</div>

<div class="imagesResults">
    <asp:PlaceHolder ID="imageSearchResultsPlc" runat="server"></asp:PlaceHolder>
</div>


<script>

    $(document).ready(function () {
        $(".vids").click(function () {
            $(".articles").removeClass("active");
            $(".images").removeClass("active");
            $(".vids").addClass("active");
            $(".articleResultsOptionTwo").hide();
            $(".imagesResults").hide();
            $(".videoResults").show();
        });

        $(".images").click(function () {
            $(".articles").removeClass("active");
            $(".vids").removeClass("active");
            $(".images").addClass("active");
            $(".articleResultsOptionTwo").hide();
            $(".videoResults").hide();
            $(".imagesResults").show();
        });

        $(".articles").click(function () {
            $(".images").removeClass("active");
            $(".vids").removeClass("active");
            $(".articles").addClass("active");            
            $(".videoResults").hide();
            $(".imagesResults").hide();
            $(".articleResultsOptionTwo").show();
        });
    });

</script>













</asp:Content>
