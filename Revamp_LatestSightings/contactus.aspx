<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="Revamp_LatestSightings.contactus" %>

<asp:Content ID="contactus" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

					<div class="row">
						<div class="col-md-12">
							<h1 class="main-title triggerAnimation animated" data-animate="fadeIn">contact us</h1>
							<div class="excerpt col-md-8 col-md-offset-2 triggerAnimation animated" data-animate="fadeInUp">
								Latest Sightings strives to build an active community of people passionate about wildlife. We would love to hear from you regarding your experiences, comments and suggestions for improvement.
							</div>
							
							<div class="contact-map clearfix triggerAnimation animated" data-animate="fadeIn">
								<%--<div id="map_canvas"></div>			--%>
							</div>
							<div class="row">
								<div class="col-md-4 col-md-offset-1 triggerAnimation animated" data-animate="fadeInUp">
<%--									<h4 class="underlined">Contact Info</h4>
									<ul class="iconned-list">
										<li class="latestSightingsAddress"><i class="fa fa-map-marker"></i><strong>Address:</strong> the address</li>
										<li class="latestSightingsPhone"><i class="fa fa-phone"></i><strong>Phone:</strong> the contact number</li>
										<li class="latestSightingsEmail"><i class="fa fa-envelope"></i><strong>Email:</strong> <a href="mailto:contact@latestsightings.com">contact@latestsightings.com</a></li>
									</ul>--%>
                                    
                                    <div class="spacer"></div>
                                    
                                    <h4 class="underlined">Connect with us</h4>
                                    <div class="clearfix"></div>
                                    <a href="https://www.facebook.com/latestsightingskruger" title="Share to Facebook"><i style="font-size:36px; padding-right:10px;" class="fa fa-facebook-square"></i></a>
                                    <%--<a href="#" title="Share to Google"><i style="font-size:36px; padding-right:10px;" class="fa fa-google"></i></a>--%>
                                    <a href="https://twitter.com/LatestKruger" title="Share to Twitter"><i style="font-size:36px; padding-right:10px;" class="fa fa-twitter"></i></a>
                                    <a href=" https://www.youtube.com/user/Animatedcams" title="Share to Twitter"><i style="font-size:36px; padding-right:10px;" class="fa fa-youtube"></i></a>
                                    <%--<a href="#" title="Share to Twitter"><i style="font-size:36px; padding-right:10px;" class="fa fa-pinterest"></i></a>--%>
                                    
                                    
								</div>
                                
								<div class="col-md-6 triggerAnimation animated" data-animate="fadeInUp">
									<div class="wpcf7">
                                        <div class="row">
                                            <div class="form-group">
                                                <input type="text" id="firstname" name="firstname" placeholder="Name" class="form-control" >
                                            </div>
                                            <div class="form-group">
                                                <input type="email" id="email" name="email" placeholder="Email" class="form-control" >
                                            <div class="form-group">
                                                <textarea class="form-control" id="address" rows="5" placeholder="Message"></textarea>
                                             </div>
                                            <div class="pull-left">
                                                <a href="javascript:void(0)" class="btn btn-success submitContactUs" role="button">Send Message</a>
                                                <!--<button class="btn btn-success updateProfile">Save</button> -->
                                            </div>
                                            <div class="pull-left marginLeftTen registerSpinner">
                                                <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                                            </div>
                                        </div>
                                        </div>
                                        <div class="row">
                                            <div class="alert alert-success pull-left marginLeftTen profileUpdated" style="margin-top: 30px; margin-left: 4px;">
                                                <strong>Email successfully sent</strong><br />
                                            </div>
                                            <div class="alert alert-danger pull-left marginLeftTen profileUpdatedError" style="margin-top: 30px; margin-left: 4px;">
                                                <strong>Error in sending email</strong><br />Please try again later as we are experiencing technical issues.
                                            </div>
                                        </div>
                                        <div class="row" style="margin-top:30px;">
                                            <div class="form-group">
                                                <div class="form-group userfirstname">
                                                    <p class="text-danger">Your Name is required</p>
                                                </div>
                                                <div class="form-group useremail">
                                                    <p class="text-danger">Email is required</p>
                                                </div>
                                                <div class="form-group useraddress">
                                                    <p class="text-danger">Your Message is required</p>
                                                </div>
                                            </div>
                                        </div> 
									</div>
								</div>
							</div>
						</div>
					</div>

        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script src="<%= ResolveUrl("~/js/completeProfile.js?v=16") %>"></script>
</asp:Content>