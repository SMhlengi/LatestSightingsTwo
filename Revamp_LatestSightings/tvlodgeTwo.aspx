<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tvlodgeTwo.aspx.cs" Inherits="Revamp_LatestSightings.tvlodgeTwo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LS Sightings Board</title>
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/board.css")%>">
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/font-awesome.min.css") %>">
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/jquery.bxslider.css") %>">

    <script src="<%= ResolveUrl("~/js/jquery-2.1.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/tvLodgeTwo.js?v=9") %>"></script>

</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="lodgeName" value="<%= lodgeName %>" />
    <div id="aspectRatio" class="bd-wrapper">
        <!-- Header -->
        <div class="bd-hdr">
            <div class="logo-left">
                <img src="/images/LS_logo.png">
            </div>
            <div class="bd-title">
                <h1>What's happening today around
                    <% if (!String.IsNullOrEmpty(lodgeName)){%> 
                        <%= lodgeName %>
                    <%} %>                    
                    Lodge
                </h1>
            </div>
            <div class="logo-right">
                <% if (!String.IsNullOrEmpty(lodoid)){ %>
                    <img src="<%= ConfigurationManager.AppSettings["lodgeImageFolderUrl"] %><%= lodoid%>">
                <%} %>
            </div>
        </div>
        <!-- Main Content -->
        <div class="bd-inner">
            <div class="leftcol">
                <!-- Video -->
                <div class="video">
                    <img src="/images/vid_place.jpg">
                </div>
                <!-- Carousel -->
                <ul class="bxslider">
                </ul>
            </div>
            <div class="rightcol">
                <!-- Map -->
                <div class="map">
                    <div class="card">
                        <img src="/images/cardpic_place.jpg">
                        <div class="info-wrap">
                            <div class="profile">
                                <img src="/images/profilepic.jpg">
                                <div class="profile-txt">
                                    <p>JonnyB</p>
                                    <h3>Baby elephant and its mother</h3>
                                </div>
                            </div>
                            <div class="location">
                                <p>H1-4</p>
                            </div>
                            <div class="detail">
                                <div class="visibility">
                                    <div class="stars">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5>Visibility</h5>
                                </div>
                                <div class="traffic">
                                    <div>
                                        <i class="fa fa-circle"></i>
                                        <i class="fa fa-circle-thin"></i>
                                        <i class="fa fa-circle-thin"></i>
                                    </div>
                                    <h5>Traffic</h5>
                                </div>
                            </div>
                            <div class="des">
                                <p>A wary mother leading its baby across the road and on the lookout for predators. </p>
                            </div>
                        </div>
                    </div>
                    <!-- Map placeholder -->
                    <img src="/images/map_place.jpg" style="width:100%;">
                </div>
            </div>
        </div>
        <!-- Footer -->
        <div class="bd-footer">
            <div class="footer-txt-wrap">
                <div class="footer-txt">Download Latest Sightings now and share <strong>YOUR</strong> sightings. Remember to stream to
                    <% if (!String.IsNullOrEmpty(lodgeName)){%> 
                        <%= lodgeName %>
                    <%} %>
                    Lodge.</div>
            </div>
            <div class="stores">
                <img src="/images/qr_code.jpg">
            </div>
        </div>
    </div>


<script src="<%= ResolveUrl("~/js/jquery.bxslider.min.js") %>"></script>
</form>
</body>
</html>
