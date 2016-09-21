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
<%--    <script src="<%= ResolveUrl("~/js/tvLodgeTwo.js?v=1") %>"></script>--%>

</head>
<body>
    <form id="form1" runat="server">
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
                <img src="/images/ngwenya_logo.png">
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
                    <li class="active">
                        <div class="pic">
                            <img src="/images/thumb1.jpg"/>
                        </div>
                        <div class="info">
                            <h3>Baby elephant and it's mother</h3>
                            <h5 class="datetime">Today @ 10:09 am</h5>
                        </div>
                    </li>
                    <li>
                        <div class="pic">
                            <img src="/images/nothumb.jpg"/>
                        </div>
                        <div class="info">
                            <h3>Giraffe grazing</h3>
                            <h5 class="datetime">Today @ 11:38 pm</h5>
                        </div>
                    </li>
                    <li>
                        <div class="pic">
                            <img src="/images/thumb2.jpg"/>
                        </div>
                        <div class="info">
                            <h3>6 Lions on a kill</h3>
                            <h5 class="datetime">Today @ 14:21 am</h5>
                        </div>
                    </li>
                    <li>
                        <div class="pic">
                            <img src="/images/thumb3.jpg"/>
                        </div>
                        <div class="info">
                            <h3>Family of zebras</h3>
                            <h5 class="datetime">Today @ 15:44 am</h5>
                        </div>
                    </li>
                    <li>
                        <div class="pic">
                            <img src="/images/thumb4.jpg"/>
                        </div>
                        <div class="info">
                            <h3>Rare rhino</h3>
                            <h5 class="datetime">Today @ 16:39 am</h5>
                        </div>
                    </li>
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
                <div class="footer-txt">Download Latest Sightings now and share <strong>YOUR</strong> sightings. Remember to stream to Ngwenya Lodge.</div>
            </div>
            <div class="stores">
                <img src="/images/qr_code.jpg">
            </div>
        </div>
    </div>


<script src="<%= ResolveUrl("~/js/board.js?v=9") %>"></script>
<script src="<%= ResolveUrl("~/js/jquery.bxslider.min.js") %>"></script>
</form>
</body>
</html>
