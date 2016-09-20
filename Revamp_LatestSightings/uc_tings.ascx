<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_tings.ascx.cs" Inherits="Revamp_LatestSightings.uc_tings" %>

<style>
    .loadingImage img {
        width: 100px;
        height: 33px;
    }


    .loadingImage {
        margin: 0 auto;
        width: 37%;
        padding-top: 25px;
    }

    #owl-slider{
        visibility:hidden;
    }

    .owl-controls{
        display:none;
    }

</style>

<!-- Latest Sightings Widget BEGIN -->
					<div class="portfolio-related-posts triggerAnimation animated" data-animate="fadeInUp">
<%--						<h4 class="page-titles">Latest Sightings</h4>--%>

                        <div class="loadingImage"><img src="<%=ResolveUrl("~/images/333.GIF") %>"></div>
                            
                        <div id="owl-slider">
                               
                            <%if (tings != null && tings.Count() > 0){ %> 
                                <%foreach(var ting in tings){ %>
							        <div class="related-portfolio-item item">
                                        <a href="#">
									        <div class="ls-member">
										        <div class="ls-info"><img alt="" src="http://tingsservice.socialengine.co.za/tings/image/<%=ting["id"] %>"></div>
										        <div class="ls-title">
											        <h4><%=ting["title"] %></h4>
											        <p>Today @ <%=ting["time"] %> <br>Kruger Park <br> South Africa</p>
										        </div>
									        </div>
                                        </a>	
							        </div>
                                <%} %>
                            <%} %>
						</div>
					</div>

<script>
    $(document).ready(function () {
        //setTimeout(function () {
        //    $(".loadingImage").hide();
        //    $("#owl-slider").css("visibility", "visible");
        //}, 2500);

    });
</script>
