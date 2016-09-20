<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Revamp_LatestSightings.dashboard" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="dashboard" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="<%= ResolveUrl("~/css/jquery.dataTables.min.css") %>" rel="stylesheet" />
<link href="<%= ResolveUrl("~/css/style.datatables.css") %>" rel="stylesheet" />
<link href="<%= ResolveUrl("~/css/responsivedataTables.responsive.css?v-2") %>" rel="stylesheet" />
    <script>
        function ShowSpinner() {
            $(".registerSpinner").show();
        }

    </script>
<%--    <form id="mainform" runat="server">--%>
                <div class="mainpanel">
                    <div class="pageheader">
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="fa fa-home"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href=""><i class=""></i></a></li>
                                </ul>
                                 <h4>Dashboard 
<%--                                    <% if (CanUserViewFinancials == true){ %>
                                    <span class="label label-warning viewfinancials" style="font-size: 12px; cursor:pointer">
                                        View Financials
                                    </span>
                                    <%} %>--%>
                                </h4> 
                            </div>
                        </div><!-- media -->
                    </div><!-- pageheader -->
                    
                    <div class="contentpanel">
                        <!-- beging tabs -->
                        <div class="row">
                            <div class="col-md-12">
                                <!--<h5 class="lg-title mb10">Basic Tabs</h5>-->
                                <!--<p class="mb20">Add quick, dynamic tab functionality to transition through panes of local content.</p>-->
                                
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">
                                        <li id="Profilelist" class=""><a href="#profile" id="profileTab" data-toggle="tab"><strong>Profile</strong></a></li>
                                        <li id="Addvideo" class=""><a href="#video" id="addvideoTab" data-toggle="tab"><strong>Add Media</strong></a></li>
                                        <li id="financialsView" class=""><a href="#viewFinancials" id="viewFinancialsTab" data-toggle="tab"><strong>View Financials</strong></a></li>
                                        <li id="Videolist" class=""><a href="#videolist" id="videoListTab" data-toggle="tab"><strong>Video List</strong></a></li>
                                </ul>
        
                                <!-- Tab panes -->
                                <div class="tab-content mb30 showBackground">
                                    <div class="tab-pane disabled" id="profile">
                                         <div class="panel-heading">My Profile</div><!-- panel-heading -->                                        
                                        <asp:PlaceHolder ID="content" runat="server" />  
                                    </div><!-- tab-pane -->
                                  
                                    <div class="tab-pane disabled" id="video">
                                       <!-- TERMS OF CONDITIONS WORK -->
                                        <!--<h4 class="addVideoLabel">To add a video, click the "Add Video" button</h4>-->
                                            <%--                                          <div class="uploadvideo termsAndConditions">
                                                <div class="row tncRow">
                                                    <div class="col-md-12">
                                                        <div class="alert alert-danger">
                                                            <strong>Please agree to Terms and Conditions before uploading video</strong> 
                                                        </div>
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

                                                <div class="row tncText">
                                                    <div class="col-md-7">                                                        
                                                          <div class="checkbox">
                                                              <p class="text-primary floatLeft">
                                                                <label>
                                                                  <input type="checkbox" id="chk_terms"><strong>I Accept Terms and Conditions </strong>
                                                                </label>
                                                              </p>     
                                                              <p> &nbsp;&nbsp;|&nbsp;&nbsp; <a class="tnc" href="/terms" target="_blank"><strong>View Terms and Conditions</strong></a></p>                                                          
                                                          </div>
                                                    </div>
                                                    <div class="col-md-4 viewterms">
                                                        <!--<asp:Button CssClass="btn btn-info" ID="downloadTandC" runat="server" Text="Download Terms and Conditions" OnClick="downloadTandC_Click" />
                                                        <p class="text-info" data-toggle="modal" data-target="#myModal">[ <strong>View Terms</strong> ]</p>-->                                                        
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3"><a href="javascript:void(0);" class="btn btn-success btn-block tncNext">Next</a></div>
                                                </div>
                                            </div>--%>
                                           <!-- END OF TERMS AND CONDITIONS WORK -->
                                        <asp:PlaceHolder ID="termsNConditionPlaceholder" runat="server"></asp:PlaceHolder>
                                        <asp:PlaceHolder ID="addVideoContent" runat="server" />
                                    </div><!-- tab-pane -->


                                   <div class="tab-pane disabled" id="viewFinancials">
<%--                                       <iframe src="UserFinancials.aspx?userid=<%=userId %>" height="1200" width="800"></iframe>--%>
                                        <asp:PlaceHolder ID="plc_addImage" runat="server"></asp:PlaceHolder>
                                    </div>
                                  
                                    <div class="tab-pane disabled" id="videolist">
                                        <h4 class="nomargin">Video List</h4>
                                        <!--<p>About content goes here</p> -->
                                        <asp:PlaceHolder ID="videoListcontent" runat="server" />
                                    </div><!-- tab-pane -->
                                  
                                </div><!-- tab-content -->
                                
                            </div>
                        </div>
                        <!-- end tabs -->  
                    </div><!-- contentpanel -->
                    <!-- terms and condition modals -->
                    <div class="modal fade" id='myModal' tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                          <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                            <h4 class="modal-title" id="myModalLabel">Terms and conditions template for website usage </h4>
                          </div>
                          <div class="modal-body">
                              <asp:PlaceHolder ID="termsandCs" runat="server" />
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- end of terms and conditions modal -->
                    
                </div>
<%--    </form>--%>
    <script>
        if (VideoUpload == true || location.href.toLowerCase().indexOf("addmedia") > 0) {
            $("#Addvideo").addClass("active");
            $("#video").addClass("active");
            if (CaptureVideoDetails == true) {
                $(".uploadvideo").hide();
                resetGlobalVariables();
            }

        } else if (location.href.toLowerCase().indexOf("financials") > 0) {
            $("#financialsView").addClass("active");
            $("#viewFinancials").addClass("active");
            if (CaptureVideoDetails == true) {
                $(".uploadvideo").hide();
                resetGlobalVariables();
            }

        } else {
            $("#Profilelist").addClass("active");
            $("#profile").addClass("active");
        }


        var profileComplete = "<%= profileComplete %>";
        if (profileComplete == "False") {
            $("#addvideoTab").attr("href", "javascript:void(0);");
            $("#addvideoTab").parent().attr("class", "disabled");
            $("#videoListTab").attr("href", "javascript:void(0);");
            $("#videoListTab").parent().attr("class", "disabled");
        }

        var viewFinance = "<%=CanUserViewFinancials %>";
        if (viewFinance == "True") {
            $(".viewFinancials").show();
            $(".viewFinancials").attr("href","/financials");
        }

        $(".Login").hide();
        $(".Logout").show();
        $(".uploadVideo").show(); 
        $(".uploadVideo").attr("href", "addmedia");
        $(".myAccount").show();        
        $(".myAccount").attr("href", "myaccount");
        $(".uploadGalleryImage").show();
        $(".uploadGalleryImage").attr("href", "addImage");
    </script>


</asp:Content>