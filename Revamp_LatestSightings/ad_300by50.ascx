<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ad_300by50.ascx.cs" Inherits="Revamp_LatestSightings.ad_300by50" %>
<link href='<%=ResolveUrl("~/css/300by50Add.css") %>' />

<div class="adloadingImage"><img src="<%=ResolveUrl("~/images/76.GIF") %>"></div>   

<!-- New site - 300x250 -->
<ins class="adsbygoogle"
style="display:inline-block;width:300px;height:250px"
data-ad-client="ca-pub-2507393417436053"
data-ad-slot="4709296205"></ins>

<script>
    $(document).ready(function () {
        setTimeout(function () {
            var str = "<script>(adsbygoogle = window.adsbygoogle || []).push({});";
            str += "<";
            str += "/script>";

            $(".adsbygoogle").after(str);
        }, 2000
        );


        setTimeout(function ()
        { $(".adloadingImage").hide(); },
        4500);
    });
</script>