<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lodges.aspx.cs" Inherits="Revamp_LatestSightings.lodges" %>

<%@ Register Src="~/uc_StyleSheets.ascx" TagName="sheets" TagPrefix="style" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <!-- Loading Styles -->   
    <style:sheets runat="server" id="allstyleSheets"></style:sheets>
    <script src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyB3O6AqwnZ3uHY0h6ulDrxlAWXXrs99VqI"></script>
    <link rel="icon" type="image/png" href="<%= ResolveUrl("~/images/favicon.ico") %>">
    <script src="<%= ResolveUrl("~/js/jquery-1.11.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/LodgeWeb.js?v=6") %>"></script>

</head>
<body>
        <form id="form1" runat="server">
		<!-- Main Container Section -->
        <div class="lodge-container">	
		<div class="container" style="width:90% !important">
			<div id="page-content">

				<!-- Page Content Area -->
				<div id="content-inner">
                	<div class="row">
                        <div class="col-md-12">
                            
                            <!-- Column 1 -->
                            <div class="col-md-4">
                                <% if (topFiveTingers != null && topFiveTingers.Count > 0){ %>
                            	<!-- Top 10 BEGIN -->
                                <h4 class="page-titles">Top 5 
                                    <% if (!String.IsNullOrEmpty(lodgeName)){%> 
                                        <%= lodgeName %>
                                    <%} %>
                                    Tingers</h4>
                                
                                <div class="table-responsive">
                                  <table class="table table-striped" id="top5tingers">
                                    
                                    <tr>
                                      <td>Username</td>
                                      <td>Today's Tingers</td>
                                    </tr>

                                    <% foreach(var tinger in topFiveTingers){%>
                                        <tr>
                                          <td><%= tinger["username"] %></td>
                                          <td><%= tinger["tingsTotal"] %></td>
                                        </tr>
                                      <%} %>
                                    
                                  </table>
                                  
                                </div>
                                <!-- Top 10 END -->
                                <%} %>
                                
                                <div class="clearfix spacer"></div>
                                                                
                                <!-- Prizes BEGIN -->
                                <h4 class="page-titles">Prizes for Top Tingers</h4>
                                <p style="color:#ff9900;">
                                    <%if (!String.IsNullOrEmpty(prizes)){ %>
                                        <%= HttpUtility.HtmlDecode(prizes) %>
                                    <%} %>
                                </p>
                                <!-- Prizes END -->
                                
                            </div>
                            <!-- Column 1 -->
                            
                            <!-- Column 2 -->
                          <div class="col-md-4">
                           	  	<h4 class="page-titles"> 
                                    <% if (!String.IsNullOrEmpty(lodgeName)){%> 
                                        <%= lodgeName %>
                                    <%} %>
                                         Lodge Tings</h4>
                                
                              	<img src="<%= ResolveUrl("~/images/lodges3.jpg") %>"  id="lodgeImage" width="100%">

								<div class="clearfix spacer small"></div>
                                
                                <h3><a href="javascript:void(0);" id="lodgeTitle"></a></h3>
                                <p class="NoBottomMargin" id="desc"></p>
                                <p class="NoBottomMargin" id="location"></p>
                                <p class="NoBottomMargin" id="tingedBy"></p>
                                <p class="NoBottomMargin" id="time"></p>
                                <p class="NoBottomMargin" id="visibility_traffic"></p><br /><br />
                                
                          </div>
                            <!-- Column 2 -->
                            
                            <!-- Column 3 -->
                            <div class="col-md-4">
                           	  	<h4 class="page-titles">Hot Spots</h4>
                            	<div id="map-canvas" style="width: 100%; height: 330px"></div>
                                
                                <div class="clearfix spacer small"></div>

<%--                                <p style="color:#ff9900;">
                                Keys go here
                                </p>--%>
                            </div>
                            <!-- Column 3 -->
                                                        
                        </div>
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
				<!-- End Content Area -->
                
			</div>
		</div>
        </div>
		<!-- End Container -->
        <!-- FOOTER -->
        <div class="row" style="
                         position: absolute;
                         bottom: 0;
                         height: 98px;
                         width: 100%;
                         margin-left: 0px;">
            <div class="col-md-12" style="background-color:#783f04; padding:20px 20px 0px 20px ; float:left; height:auto; width:100%;">
                        
                <div class="col-md-8" style="margin-bottom:20px !important; float:left;">
                    <img alt="" src="<%= ResolveUrl("~/images/logo-horizontal-new.png") %>" style="float:left; padding-right:30px;">
                    <% if (!String.IsNullOrEmpty(lodoid)){ %>
                        <img src="<%= ConfigurationManager.AppSettings["lodgeImageFolderUrl"] %><%= lodoid%>" style="float:left; padding-right:30px;">
                    <%} %>
                    <h3 style="float:left; color:#ff9900;">Sightings Board</h3> 
                </div>
                            
                <div class="col-md-4" style="margin-bottom:20px;">
                    <div class="appstore">
                        <p>Download the Latest Sightings App to your phone. Available for iOS and Android.</p>
                        <a href="#"><img src="<%= ResolveUrl("~/images/Download_on_the_App_Store_Badge_US-UK_135x40.png") %>"></a>
                        <a href="#"><img src="<%= ResolveUrl("~/images/en_generic_rgb_wo_60.png") %>" style="height: 46px"></a>
                    </div>
                </div>
                        
            </div>
        </div>
        <!-- FOOTER -->
    <!-- Javascripts -->
        </form>
</body>
</html>
