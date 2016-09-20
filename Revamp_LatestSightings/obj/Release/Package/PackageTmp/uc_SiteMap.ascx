<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SiteMap.ascx.cs" Inherits="Revamp_LatestSightings.uc_SiteMap" %>

		<!-- Sitemap Section -->
		<footer class="sitemap">
                    
			<div class="container">
            
            <div class="sitemap-item">
                <ul class="footer-links">
					<li><strong>Useful Links:</strong></li>
                  	<li><a href="/bloglist">Ting Talk</a></li>
					<li><a href="#">Live Webcam</a></li>
                    <li><a href="/holidays">Book a Holiday</a></li>
					<li><a href="/holidays">Latest Deals</a></li>
                    <li><a href="/partnership">Submit a video and earn</a></li>
				</ul>
              </div>
              
              <div class="sitemap-item" style="margin-left:0 !important;">
                  <div class="subscribe">
                        Subscribe to our newsletter
                        <form>
                          <div class="form-group">
                            <label for="exampleInputEmail1"></label>
                            <input type="email" style="margin-top:-11px;" class="form-control backgroundColorWhite" id="emailfooter" placeholder="Enter email">
                          </div>
                            <div class="input-group form-group emailfooter">
                                <p class="text-danger">Email is required</p>
                            </div>
                          <button type="button" class="btn footerSubscribeToNewsLetter">Subscribe</button>&nbsp;&nbsp;<label></label>
                        </form>
                    </div>
                </div>
                
                <div class="sitemap-item">
                    <ul class="footer-social">
                         <li><a target="_blank" href="https://www.facebook.com/latestsightingskruger" title="Follow on Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/LatestKruger" title="Follow on Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a target="_blank" href=" https://www.youtube.com/user/Animatedcams" title="Follow Youtube"><i class="fa fa-youtube"></i></a></li>
                        <!--<li><a href="#" title="Follow Pinterest"><i class="fa fa-pinterest"></i></a></li>-->
                    </ul>
                
                    <div class="appstore">
                        <a target="_blank" href="https://itunes.apple.com/za/app/latest-kruger-sightings/id504154045?mt=8"><img src='<% = ConfigurationManager.AppSettings["siteUrl"] %>/images/Download_on_the_App_Store_Badge_US-UK_135x40.png'></a>
                        <a target="_blank" href="https://play.google.com/store/apps/details?id=com.latestsightings.app&hl=en"><img class="googleplayimage" src='<% = ConfigurationManager.AppSettings["siteUrl"] %>/images/en_generic_rgb_wo_60.png' ></a>
                    </div>
                    
                    <div class="clearfix"></div>
                    <div class="spacer"></div>
                    
                </div>
                
            </div>
		</footer>
		<!-- End Sitemap -->