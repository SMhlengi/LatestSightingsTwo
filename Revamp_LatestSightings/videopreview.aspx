<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="videopreview.aspx.cs" Inherits="Revamp_LatestSightings.videopreview" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="videoPreview" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<link rel="stylesheet" href="<%=ResolveUrl("~/css/videopreview.css") %>" />

    <link href="<%= ResolveUrl("~/css/jplayer.blue.monday.css") %>" rel="stylesheet" />
    <script src="<%= ResolveUrl("~/js/jquery.jplayer.min.js") %>"></script>
      <script type="text/javascript">
          $(document).ready(function () {
              $("#jquery_jplayer_1").jPlayer({
                  ready: function () {
                      $(this).jPlayer("setMedia", {
                          title: "<%=title %>",
                          m4v: "https://rfuapi.socialengine.co.za/Uploads/" + "<%=filename %>",
                          poster: "http://lscms2.socialengine.co.za/images/Latest-Sightings-Elephant-poster.jpg"
                      });
                  },
                  swfPath: "/js",
                  supplied: "m4v"
              });
          });
      </script>


         <div class="row">
<%--             <div class="col-xs-1 col-sm-1 co-md-1 col-lg-1">
             </div>--%>
            <div class="col-md-11 filedetailstab">
                <h5 class="lg-title">Information</h5>
                <p class="mb20">Some context about this Video and the User can be found below.</p>

                <!-- BASIC WIZARD -->
                    <ul class="nav nav-tabs nav-justified">
                        <li class="active"><a href="#tab1" data-toggle="tab"><strong>Video</strong> </a></li>
                        <li class=""><a href="#tab2" data-toggle="tab"><strong>Video Info</strong> </a></li>
                        <li class=""><a href="#tab3" data-toggle="tab"><strong>Contributor Info</strong> </a></li>
                    </ul>
                
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                          <div class="contentpanel">
                          <div id="jp_container_1" class="jp-video ">
                            <div class="jp-type-single">
                              <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                              <div class="jp-gui">
                                <div class="jp-video-play">
                                  <a href="javascript:;" class="jp-video-play-icon" tabindex="1">play</a>
                                </div>
                                <div class="jp-interface">
                                  <div class="jp-progress">
                                    <div class="jp-seek-bar">
                                      <div class="jp-play-bar"></div>
                                    </div>
                                  </div>
                                  <div class="jp-current-time"></div>
                                  <div class="jp-duration"></div>
                                  <div class="jp-controls-holder">
                                    <ul class="jp-controls">
                                      <li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
                                      <li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
                                      <li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
                                      <li><a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a></li>
                                      <li><a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li>
                                      <li><a href="javascript:;" class="jp-volume-max" tabindex="1" title="max volume">max volume</a></li>
                                    </ul>
                                    <div class="jp-volume-bar">
                                      <div class="jp-volume-bar-value"></div>
                                    </div>
                                    <ul class="jp-toggles">
                                      <li><a href="javascript:;" class="jp-full-screen" tabindex="1" title="full screen">full screen</a></li>
                                      <li><a href="javascript:;" class="jp-restore-screen" tabindex="1" title="restore screen">restore screen</a></li>
                                      <li><a href="javascript:;" class="jp-repeat" tabindex="1" title="repeat">repeat</a></li>
                                      <li><a href="javascript:;" class="jp-repeat-off" tabindex="1" title="repeat off">repeat off</a></li>
                                    </ul>
                                  </div>
                                  <div class="jp-details">
                                    <ul>
                                      <li><span class="jp-title"></span></li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                              <div class="jp-no-solution">
                                <span>Update Required</span>
                                To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                              </div>
                            </div>
                          </div>

                          </div>
                        </div><!-- tab-pane -->

                        <div class="tab-pane" id="tab2">
                           <div class="form-group">
                                <label class="col-sm-3">Title</label>
                                <div class="col-sm-8">
                                    <label class="col-sm-4"><strong><%= videoRecord.Title %></strong></label>
                                </div>
                            </div><!-- form-group -->
                                            
                            <div class="form-group">
                                <label class="col-sm-3">Notes</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" rows="5" disabled><%=videoRecord.Notes %></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3">Status</label>
                                        <div class="col-sm-8">                                    
                                            <label class="radio-inline">
                                            <input type="radio" name="videoStatus" id="pending" value="pending" checked="checked" /> <strong>Pending</strong>
                                            </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="videoStatus" id="accepted" value="accepted" /><strong>Accepted</strong>
                                            </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="videoStatus" id="declined" value="declined" /><strong>Declined</strong>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <!-- decline video control -->
                                    <div class="form-group declineVideoTab">
                                        <label class="col-sm-3">Decline Statuses</label>
                                            <div class="col-sm-8">
                                                <div class="form-group">
                                                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                                            <div class="panel panel-danger transparentBackground">
                                                            <div class="panel-heading" role="tab" id="headingOne">
                                                                <h4 class="panel-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                                    Please choose the reason/s for declining this video 
                                                                </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseOne" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                <!-- get all the rounds -->
                                                                <div class="row">
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                        <div class="table-responsive">
                                                                            <table class="table table-striped table-condensed declineTable">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>Decline Reason</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody class="declineTableBody">
                                                                                    <%
                                                                                        if (declineStatuses != null && declineStatuses.Count > 0) 
                                                                                        {
                                                                                            foreach (var item in declineStatuses) 
                                                                                            {%>
                                                                                                    <tr>
                                                                                                        <td width="40%"><%=item.reason%></td>
                                                                                                        <td width="15%">
                                                                                                            <div class="checkbox">
                                                                                                                <label>
                                                                                                                <input type="checkbox" name="round" value='<%=item.reason.ToString()%>' class="availablerounds">
                                                                                                                </label>
                                                                                                            </div>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                <%}
                                                                                        }
                                                                                        %>
                                                                                </tbody>

                                                                                </table>
                                                                            </div>
                                                                            </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            </div>
                                                            <div class="panel panel-danger transparentBackgroundWithBorder">
                                                                <div class="panel-heading" role="tab" id="headingTwo">
                                                                  <h4 class="panel-title">
                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                                      Suggestions / Advice to give to <strong> <strong><%=contributor["firstname"] %></strong> <%=contributor["lastname"] %></strong> on the video
                                                                    </a>
                                                                  </h4>
                                                                </div>
                                                                <div id="collapseTwo" class="panel-collapse collapse declineSuggestions" role="tabpanel" aria-labelledby="headingTwo">
                                                                  <div class="panel-body">
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" rows="9" placeholder="Suggestions / Advice" id="adviceSuggestions"></textarea>
                                                                    </div>
                            
                                                                  </div>
                                                                </div>
                                                              </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <div class="addnewreason">
                                                            <span class="addnewtext"> [ add new ] </span>
                                                            <span class="cancelAddnewText"> [ cancel ] </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-7 addnewreasonTextbox">
                                                        <div class="addnewreason">
                                                            <input type="text" class="form-control" placeholder="Add New Reason" id="newReason" />
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-1 saveNewReason">
                                                        <div class="addnewreason">
                                                            <a href="javascript:void(0)" class="btn btn-danger btn-md saveNewStatus" role="button">Save</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-1 marginLeftTwenty registerSpinner">
                                                        <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                                                    </div>
                                                </div>
                                        
                                            </div>
                                    </div>
                                    <!-- end of decline status -->
                                </div>
                            </div>


                            <div class="row" style="margin-top:30px; margin-bottom:30px;">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3">&nbsp;</label>
                                        <div class="col-sm-8">
                                            <a href="javascript:void(0)" class="btn btn-primary btn-md updateVideoStatus" role="button">Update Status</a>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="row" style="margin-top:30px; margin-bottom:30px;">
                                <div class="col-sm-12">
                            <div class="form-group updatingVideoStatusMessaging">
                                <label class="col-sm-3"></label>
                                <div class="col-sm-8">
                                    <div class="alert alert-info">                                    
                                    <strong>Updating Status</strong> .....
                                    </div>
                                </div>
                            </div><!-- form-group -->
                            <div class="form-group emailSentForAcceptedVideo">
                                <label class="col-sm-3"></label>
                                <div class="col-sm-8">
                                    <div class="alert alert-info">                                    
                                    <strong>Video Status Successfully Updated</strong><br />
                                        An email has been sent to the user informing them that their video has been accepted.
                                    </div>
                                </div>
                            </div><!-- form-group -->
                            <div class="form-group messageForDeclindedVideo">
                                <label class="col-sm-3"></label>
                                <div class="col-sm-8">
                                    <div class="alert alert-info">                                    
                                    <strong>Video Status Successfully Updated</strong><br />
                                        An email has been sent to the user informing them that their video has been declined.                                        
                                    </div>
                                </div>
                            </div><!-- form-group -->
                            <div class="form-group updateVideoStatusError">
                                <label class="col-sm-3"></label>
                                <div class="col-sm-8">
                                    <div class="alert alert-danger">                                    
                                    <strong>Error in updating video Status</strong><br />
                                        An Error has occured in updating video status.  <br />
                                        Please try again at a later stage.
                                    </div>
                                </div>
                            </div>

                                </div>
                            </div>
                                            

                        </div><!-- tab-pane -->

                        <div class="tab-pane" id="tab3">
                            <div class="form-group">
                                <label class="col-sm-3">First Name</label>
                                <div class="col-sm-8">
                                    <label class="col-sm-4"><strong><%=contributor["firstname"] %></strong></label>
                                </div>
                            </div><!-- form-group -->
                                            
                            <div class="form-group">
                                <label class="col-sm-3">Lastname</label>
                                <div class="col-sm-8">
                                    <label class="col-sm-4"><strong><%=contributor["lastname"] %></strong></label>
                                </div>
                            </div><!-- form-group -->
                                            
                            <div class="form-group">
                                <label class="col-sm-3">Email</label>
                                <div class="col-sm-8">
                                    <label class="col-sm-4"><strong><%=contributor["email"] %></strong></label>
                                </div>
                            </div><!-- form-group -->
                            <div class="form-group">
                                <label class="col-sm-3">Cell Number</label>
                                <div class="col-sm-8">
                                    <label class="col-sm-4"><strong><%=contributor["cellnumber"] %></strong></label>
                                </div>
                            </div><!-- form-group -->
                        </div><!-- tab-pane -->
                                        

                    </div><!-- tab-content -->
                                    
                <!-- #basicWizard -->
              
            </div>
        <%if (downloadVideoPanel == true)
          { %>
                <div class="col-md-10 downloadVideoSection">
                    <div class="row tncRow">
                        <div class="col-md-12">
                            <div class="alert alert-danger">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <strong>Some video formats are not supported by your browser.<br />
                                    Please make use of the download function below to play the raw (original) file on your native desktop video player.
                                </strong> 
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <%--<form id="VideoDownload" runat="server">--%>
                                <asp:Button CssClass="btn btn-info" ID="downloadVideo2" OnClick="downloadVideo_Click" runat="server" Text="Download Video" />
                                <asp:HiddenField ID="Hiddenfilename" runat="server" />
                            <%--</form>--%>
                        </div>
                    </div>
                </div>
            <%} %>
        </div>



<script>
    $(document).ready(function () {
        $(".updateVideoStatus").click(function () {
            console.log("i was clicked");
            var postUrl = "/AjaxOperation.aspx/updateVideoStatus";
            var vidid = "<%=videoRecord.Id %>";
            var userEmail = "<%=contributor["email"] %>";
            var videostatus = "Pending";
            var userFullName = "<%=contributor["firstname"] %> " + "<%=contributor["lastname"] %>";
            var firstname = "<%=contributor["firstname"] %>"
            var vidFileName = "<%= videoRecord.Title %>";
            var declinedOptionsSelected = "";
            var adviceSuggestions = "";

            if ($("#accepted").prop('checked')) {
                videostatus = "Accepted";
            }
            if ($("#declined").prop('checked')) {
                videostatus = "Declined";

                $('input[type=checkbox]').each(function () {
                    declinedOptionsSelected += "" + (this.checked ? this.value + ":" : "") + "";
                });

                adviceSuggestions = $("#adviceSuggestions").val();
                adviceSuggestions = adviceSuggestions.replace(/,/g, '');
                adviceSuggestions = adviceSuggestions.replace(/'/g, '');
            }

            if (videostatus != "Pending") {
                $(".updatingVideoStatusMessaging").show();
                $.ajax({
                    type: "POST",
                    url: postUrl,
                    data: "{'vidid' : '" + vidid + "', 'status' : '" + videostatus + "', 'useremail' : '" + userEmail + "', 'userFullName' : '" + userFullName + "', 'filename' : '" + vidFileName + "', 'declindedOptions' : '" + declinedOptionsSelected + "', 'adviceSuggestions' : '" + adviceSuggestions + "', 'firstname' : '" + firstname + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done(
                    function (data, textStatus, jqXHR) {
                        if (data.d == true) {
                            $(".updatingVideoStatusMessaging").hide();
                            if ($("#accepted").prop('checked')) {
                                $(".emailSentForAcceptedVideo").show();
                            } else if ($("#declined").prop('checked')) {
                                $(".messageForDeclindedVideo").show();
                            }
                        } else {
                            $(".updatingVideoStatusMessaging").hide();
                            $(".updateVideoStatusError").show();
                        }
                    }
                ).fail(
                    function (data, textStatus, jqXHR) {
                    }
                );
            }
        });

        $("#declined").click(function () {
            $(".footer").hide();
            $(".declineVideoTab").show("slow");
        });

        $("#accepted").click(function () {
            $(".declineVideoTab").hide("slow");
        });

        $("#pending").click(function () {
            $(".declineVideoTab").hide("slow");
        });

        $(".addnewtext").click(function () {
            $(".addnewtext").hide();
            $(".cancelAddnewText").show("slow");
            $(".addnewreasonTextbox").show("slow");
            $(".saveNewReason").show("slow");
        });

        $(".cancelAddnewText").click(function () {
            $(".cancelAddnewText").hide();
            $(".addnewtext").show("slow");
            $(".addnewreasonTextbox").hide();
            $(".saveNewReason").hide();
        });

        $(".saveNewStatus").click(function () {
            if ($("#newReason").val() != "") {
                $(".registerSpinner").show();
                SaveNewReason();
                ClearTextBox("#newReason");
            }
        });

        function SaveNewReason() {
            var reason = $("#newReason").val();
            var postUrl = "/AjaxOperation.aspx/saveNewReason";
            $.ajax({
                type: "POST",
                url: postUrl,
                data: "{'reason' : '" + reason + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(
                function (data, textStatus, jqXHR) {
                    if (data.d == true) {
                        $(".registerSpinner").hide();
                        UpdateReasonSelection(reason);
                    } else {
                        console.log("error with adding new reason");
                    }
                }
            ).fail(
                function (data, textStatus, jqXHR) {
                }
            );
        }

        function UpdateReasonSelection(reason) {
            var checkBoxes = $(".declineTableBody").html();
            checkBoxes += "<tr>" +
                    "<td width='40%'>" + reason + "</td>" +
                    "<td width='15%'>" +
                        "<div class='checkbox'>" +
                            "<label>" +
                            "<input type='checkbox' name='round' value='" + reason + "' class='availablerounds'>" +
                            "</label>" +
                        "</div>" +
                    "</td>" +
                "</tr>";
            $(".declineTableBody").html(checkBoxes);
        }

        function ClearTextBox(control) {
            $(control).val("");
        }

    });
</script>

</asp:Content>