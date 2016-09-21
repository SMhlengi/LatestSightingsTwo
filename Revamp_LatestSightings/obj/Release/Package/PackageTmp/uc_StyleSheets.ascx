<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_StyleSheets.ascx.cs" Inherits="Revamp_LatestSightings.uc_StyleSheets" %>


<link href="<%= ResolveUrl("~/css/GoogleApisFonts.css") %>" rel="stylesheet" type="text/css">
<link href="<%= ResolveUrl("~/css/bootstrap.min.css") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/font-awesome.min.css") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/owl.carousel.css?v=2") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/owl.theme.css") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/animate.min.css") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/hover-min.css") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/magnific-popup.css") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/component.css") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/styleThree.css?v=79") %>" rel="stylesheet">
<link href="<%= ResolveUrl("~/css/responsive.css?v=5") %>" rel="stylesheet">  
<% if(HttpContext.Current.Request.Url.AbsolutePath != "/terms"){ %> 
<link href="<%= ResolveUrl("~/css/gallerymodal.css?v=6") %>" rel="stylesheet">
<%} %>
<%--<link href="<%= ResolveUrl("~/css/jquery.dataTables.min.css") %>" rel="stylesheet" />
<link href="<%= ResolveUrl("~/css/style.datatables.css") %>" rel="stylesheet" />
<link href="<%= ResolveUrl("~/css/responsivedataTables.responsive.css") %>" rel="stylesheet" />--%>
<link href="<%= ResolveUrl("~/css/swiper.css") %>" rel="stylesheet" />
<link href="<%= ResolveUrl("~/css/docs.min.css") %>" rel="stylesheet" />
<link href="<%= ResolveUrl("~/css/prettyCheckable.css") %>" rel="stylesheet" />