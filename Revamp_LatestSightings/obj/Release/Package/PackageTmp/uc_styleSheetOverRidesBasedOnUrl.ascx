<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_styleSheetOverRidesBasedOnUrl.ascx.cs" Inherits="Revamp_LatestSightings.uc_styleSheetOverRidesBasedOnUrl" %>

<%if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("about-us"))
  { %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/aboutUsOverRide.css") %>' />
<%}else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("/bloglist")){ %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/bloglist.css") %>' />
<%}else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("categorybloglist")){  %>
     <link rel="stylesheet" href='<%= ResolveUrl("~/css/categoryBlogList.css") %>' />
<%}else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("contact-us")){ %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/contactusOverRide.css") %>' />
<%} else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("dashboard.aspx")){ %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/dashboardOveride.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("forgottenpassword.aspx")){ %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/forgottenPasswordOverRide.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("login")){ %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/loginOverRide.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("parksightings"))  { %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/parkSightingsOverRide.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("register"))  { %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/registerOverRide.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("resetpassword"))  { %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/resetpasswordOverRide.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("sightings"))  { %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/sightingsOverRide.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("terms"))  { %>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/termsOverRide.css") %>' />
<%}  else if (HttpContext.Current.Request.Url.AbsolutePath.ToLower().Contains("ting.aspx"))  { %>
    <link href="<%=ResolveUrl("~/css/ting.css") %>" rel="stylesheet" />
<%} %>