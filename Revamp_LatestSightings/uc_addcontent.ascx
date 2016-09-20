<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_addcontent.ascx.cs" Inherits="Revamp_LatestSightings.uc_addcontent" %>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' rel='stylesheet' type='text/css'>
    <link href=<%=ResolveUrl("~/css/multistep-indicator.css?v=2") %> rel='stylesheet' type='text/css'>

        <div class="row">
            <div class="panel">
                <div class="panel-heading"></div>
                
                <!-- Step 1 -->
                <div class="panel-body">
                    <div class="row">
                            <h4>Complete the following Steps</h4>

                            <nav>
                                <ol class="cd-multi-steps text-bottom count">
                                    <li class="current"><a href="javascript:void(0);">t's &amp; c's</a></li>        
                                    <li><em>Info</em></li>                            
                                    <li><em>Upload</em></li>
                                </ol>
                            </nav>
                                       <!-- TERMS OF CONDITIONS WORK -->
                                        <!--<h4 class="addVideoLabel">To add a video, click the "Add Video" button</h4>-->
                                          <div class="uploadvideo termsAndConditions">
                                              <div class="row">
                                                  <div class="col-md-8">
                                                       <p><h4 class="tncheading">Summary of full </h4><h4 class="tncheading"><a class="tnc" href="/terms" target="_blank"><strong>&nbsp;&nbsp;<u>Terms and Conditions</u></strong></a></h4></p>         
                                                  </div>
                                              </div>
                                                <div class="row tncRow" style="margin-bottom:1px;">
                                                    <div class="col-md-9">
                                                        <ul>
                                                            <li>
                                                                You (the contributor) confirm that you have the necessary rights to the media being uploaded, and to use it in  the Latest Sightings’ Film and Earn Programme.
                                                            </li>
                                                            <li>
                                                                You will continue to own the copyright. 
                                                            </li>
                                                            <li>
                                                                You are giving Latest Sightings the exclusive right to monetize and sublicense the media in whole or in part.
                                                            </li>
                                                            <li>
                                                                You will earn 40% of direct revenue ex VAT earned from the media.  We pay you your share within 30 days after we have received payment.
                                                            </li>
                                                            <li>
                                                                We pay out once your total is more than R1000.
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>

<%--                                                <div class="row tncRow" style="margin-bottom:1px;">
                                                    <div class="col-md-9">
                                                        <p class="text-primary emailFile"><strong style="color:white;">Please Note: </strong> If your file is larger than 2Gb, please <a href="javascript:void(0)" class="launchNativeEmailClient">contact us</a> [ videos@latestsightings.com ]</p>
                                                    </div>
                                                </div>--%>

                                                <div class="row tncText">
                                                    <div class="col-md-12">                                                        
                                                          <div class="checkbox">
                                                              <p class="text-primary floatLeft">
                                                                <label>
                                                                  <input type="checkbox" id="chk_terms"><strong>I have read and accept the full Terms and Conditions </strong>
                                                                </label>
                                                              </p>     
                                                              <p> &nbsp;&nbsp;|&nbsp;&nbsp; <a class="tnc" href="/terms" target="_blank"><strong>View Terms and Conditions</strong></a></p>                                                          
                                                          </div>
                                                    </div>
                                                    <div class="col-md-4 viewterms">                                                      
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3"><a href="javascript:void(0);" class="btn btn-success btn-block tncNext">Next</a></div>
                                                </div>
                                                <br />
                                              <asp:PlaceHolder ID="videopackages" runat="server"></asp:PlaceHolder>
                                            </div>
                                           <!-- END OF TERMS AND CONDITIONS WORK -->
                    </div>
                </div>

                <!-- Step 2 -->
                <!-- <div class="panel-body">
                    <div class="row">
                        <h4>Step 2 Upload content</h4>
                        
                    </div>
                </div> -->
            </div>
        </div>