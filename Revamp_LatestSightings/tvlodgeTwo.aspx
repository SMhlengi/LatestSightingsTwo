<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tvlodgeTwo.aspx.cs" Inherits="Revamp_LatestSightings.tvlodgeTwo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LS Sightings Board</title>
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/board.css?v=4")%>">
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/font-awesome.min.css") %>">
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/jquery.bxslider.css") %>">
    <script src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyB3O6AqwnZ3uHY0h6ulDrxlAWXXrs99VqI"></script>
    <script src="<%= ResolveUrl("~/js/jquery-2.1.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/js/tvLodgeTwo.js?v=41") %>"></script>

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
                    <iframe width="420" height="220" src="https://www.youtube.com/embed/videoseries?list=PL_K2CjlrV2nD_V9wDQPSGAkIo5o5wzhYV&autoplay=1" frameborder="0" allowfullscreen></iframe>
                </div>
                <!-- Carousel -->
                <ul class="bxslider">
                </ul>
            </div>
            <div class="rightcol">
                <!-- Map -->
                <div class="map">
                    <!-- Map placeholder -->
                    <div id="map-canvas" style="width: 100%; height: 690px"></div>
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
