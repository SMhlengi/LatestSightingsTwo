<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addVideo.ascx.cs" Inherits="Revamp_LatestSightings.addVideo" %>
<%@ Register TagPrefix="CuteWebUI" Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" %>

<%--<div class="ajaxUploaderClass">
<% if (addVideoDetails == false){ %>
    <CuteWebUI:Uploader id="Uploader1" runat="server" InsertText="Add File (Max 2 Gigs)"
            OnFileUploaded="Uploader1_FileUploaded" MultipleFilesUpload="false" ValidateOption-AllowedFileExtensions="mp4, m4v, webm, flv, ogv, ogg, avi, wmv, mpg, mpeg, mpe, svi, mov"
            />
<%} %>
</div>--%>

<% if (addVideoDetails == false){ %>
<div class="row rfuploaderPadding">
    <div class="rfuploader">
        <asp:PlaceHolder ID="fileup_resumable" runat="server"></asp:PlaceHolder>
    </div>
</div>
<!-- MOVING VIDEO DETAILS TO BE HERE -->

<%--<span data-bind="visible: incompleteTasks().length == 0"> - it's beer time!</span>--%>
<div class="row captureVideoDetailsContainer">
<div class="row">
    <div class="col-md-4">
    </div>
    <div class="col-md-8">
        <div class="input-wrapper has-pretty-child">
                      <div class="clearfix prettyradio labelright margin-right blue">
                            <input type="radio" class="prettyCheckable" value="1" id="" name="Test3" data-label="Yes" checked="" data-customclass="margin-right" style="display: none;">
                            <a href="javascript:void(0);" class="checked "  id="videoUploadRadio"></a>
                            <label class="videoUploadRadioLabel" for="Test3_0">Video Upload</label>
                      </div>
                      <div class="clearfix prettyradio labelright  blue">
                            <input type="radio" class="prettyCheckable" value="2" id="" name="Test3" data-label="No" style="display: none;">
                            <a href="javascript:void(0);" class=" " id="imageUploadRadio"></a>    
                            <label class="imageUploadRadioLabel" for="Test3_1">Image Upload</label></div>
        </div>
    </div>
</div>

    <div class="col-md-1"></div>
    <div class="col-md-10">
        <!-- upload Video panel -->
        <div class="panel transparentBackground uploadVideoPanel">
            <div class="panel-heading">
                <div class="panel-btns" style="display: none;">
                    <a href="" class="panel-minimize tooltips" data-toggle="tooltip" title="" data-original-title="Minimize Panel"><i class="fa fa-minus"></i></a>
                    <a href="" class="panel-close tooltips" data-toggle="tooltip" title="" data-original-title="Close Panel"><i class="fa fa-times"></i></a>
                </div><!-- panel-btns -->
                    <%--<h4 class="panel-title">Hi <strong><%= name %></strong></h4>--%>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="videoDetailsFormHeading">Please provide us with the below information of the content you would like to upload</div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div><!-- panel-heading -->
            <div class="panel-body videoDetailsForm">
                <div class="row">
                    <div class="form-group col-md-12">
                        <input type="text" id="videoTitle" name="videoTitle" placeholder="Title" class="form-control" >
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <input type="text" id="alias" name="alias" placeholder="Alias" class="form-control"">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" id="keywords" name="keywords" placeholder="Keywords" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <textarea class="form-control" id="notes" rows="8" placeholder="Notes"></textarea>
                     </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <div class="form-group videoTitle">
                            <p class="">Video Title is required</p>
                        </div>
                        <div class="form-group alias">
                            <p class="">Alias is required</p>
                        </div>
                        <div class="form-group keywords">
                            <p class="">Keywords is required</p>
                        </div>
                        <div class="form-group notes">
                            <p class="">Notes number is required</p>
                        </div>
                    </div>
                </div>           
            </div><!-- panel-body -->
            <div>
                <div class="pull-left">
                    <a href="javascript:void(0)" class="btn btn-success updateVideoDetails" role="button">Save</a>
                </div>
                <div class="pull-left marginLeftTen registerSpinner" style="margin-top:-13px">
                    <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                </div>
                <div class="alert alert-success pull-left marginLeftTen videoDetailsSaved">
                    <strong>Video details have been Successfully Saved</strong><br />An administrator has been informed and will review your video and be in contact with you shortly
                </div>
                <div class="alert alert-danger pull-left marginLeftTen videoDetailsSavedError">
                    <strong>Error in Saving Video Details</strong><br />Please try again as we are experiencing technical issues.
                </div>
            </div><!-- panel-footer -->
        </div>
        <!-- end of upload Video panel -->
    <!-- add image -->
        <div class="panel transparentBackground uploadImagePanel">
            <div class="panel-heading">
                <div class="panel-btns" style="display: none;">
                    <a href="" class="panel-minimize tooltips" data-toggle="tooltip" title="" data-original-title="Minimize Panel"><i class="fa fa-minus"></i></a>
                    <a href="" class="panel-close tooltips" data-toggle="tooltip" title="" data-original-title="Close Panel"><i class="fa fa-times"></i></a>
                </div><!-- panel-btns -->
                    <%--<h4 class="panel-title">Hi <strong><%= name %></strong></h4>--%>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="videoDetailsFormHeading">Please provide us with the below information of the content you would like to image</div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div><!-- panel-heading -->
            <div class="panel-body">
                <!-- new textbox for image title -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <input type="text" id="title" name="imageTitle" placeholder="Title" class="form-control" >
                    </div>
                </div>
                <!-- end of new textbox for image title -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <input type="text" id="animal" name="videoTitle" placeholder="Animal" class="form-control" >
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <input type="text" id="activity" name="alias" placeholder="Activity" class="form-control"">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" id="area" name="keywords" placeholder="Area" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <input type="text" id="tags" name="tags" placeholder="Tags" class="form-control"">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <textarea class="form-control" id="comments" rows="8" placeholder="General Comment"></textarea>
                     </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <div class="form-group title">
                            <p class="">Title is required</p>
                        </div>
                        <div class="form-group animal">
                            <p class="">Animal Type is required</p>
                        </div>
                        <div class="form-group activity">
                            <p class="">Activity is required</p>
                        </div>
                        <div class="form-group area">
                            <p class="">Area is required</p>
                        </div>
                        <div class="form-group tags">
                            <p class="">Tags number is required</p>
                        </div>
                        <div class="form-group comments">
                            <p class="">Comments number is required</p>
                        </div>
                    </div>
                </div>           
            </div><!-- panel-body -->
            <div>
                <div class="pull-left updateImageSaveButtonDiv">
                    <a href="javascript:void(0)" class="btn btn-success updateImageDetails" role="button">Save</a>                    
                </div>
                <div class="pull-left marginLeftTen registerSpinner">
                    <img src="<%=ResolveUrl("~/images/loading.gif")%>" class="saveImageDetailsSpinner"/>
                </div>
                <div class="alert alert-success pull-left marginLeftTen imageDetailsSaved">
                    <strong>Image details have been Successfully Saved</strong>
                </div>
                <div class="alert alert-danger pull-left marginLeftTen imageDetailsError">
                    <strong>Error in Saving Image Details</strong><br />Please try again as we are experiencing technical issues.
                </div>
            </div><!-- panel-footer -->
        </div>
    <!-- end of add image -->
        </div>
    <div class="col-md-1"></div>             
    </div>

<!-- END OF MOVING VIDEO DETAILS TO BE HERE -->

<!-- DROPING .NET UPLOADER
<div class="row">
    <div class="dotNetUploader">
       <div class="col-md-9">
            <p class="text-primary havingTroubleUploading"><%--<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span><strong> Having trouble uploading? </strong>--%> <a href="javascript:void(0);" class="btn btn-default launchDotNetUploader" role="button"  style="background-color: #5bc0de;color: black; text-decoration: none;">Add File (Max 2 Gigs )</a></p><br />
            <div class="panel panel-default dontnetuploaderpanel">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:FileUpload id="justIncaseSecondaryFileupload" runat="server" />
                        </div>
                        <div class="col-md-1">
                            <asp:Button runat="server" class="btn btn-primary btn-sm dotnetuploaderbutton" id="justIncaseSecondaryFileuploadButton" text="Upload" OnClick="justIncaseSecondaryFileuploadButton_Click" OnClientClick="ShowSpinner()" />
                        </div>
                        <div class="col-md-3">
                            <div class="pull-left marginLeftTen registerSpinner">
                                <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>-->

<%} %>

<%if (addVideoDetails == true){ %>
<div class="row">
    <div class="col-md-12">
        <div class="panel transparentBackground">
            <div class="panel-heading">
                <div class="panel-btns" style="display: none;">
                    <a href="" class="panel-minimize tooltips" data-toggle="tooltip" title="" data-original-title="Minimize Panel"><i class="fa fa-minus"></i></a>
                    <a href="" class="panel-close tooltips" data-toggle="tooltip" title="" data-original-title="Close Panel"><i class="fa fa-times"></i></a>
                </div><!-- panel-btns -->
                <h4 class="panel-title">Hi <strong><%= name %></strong></h4>
                    <!--<p class="text-success seperation">Please provide us with the below information of the uploaded video</p>-->
                    <div class="alert alert-success" role="alert"> Please provide us with the below information of the uploaded video. </div>
            </div><!-- panel-heading -->
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-8">
                        <input type="text" id="videoTitle" name="videoTitle" placeholder="Title" class="form-control" >
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <input type="text" id="alias" name="alias" placeholder="Alias" class="form-control"">
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="keywords" name="keywords" placeholder="Keywords" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-8">
                        <textarea class="form-control" id="notes" rows="8" placeholder="Notes"></textarea>
                     </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <div class="form-group videoTitle">
                            <p class="text-danger">Video Title is required</p>
                        </div>
                        <div class="form-group alias">
                            <p class="text-danger">Alias is required</p>
                        </div>
                        <div class="form-group keywords">
                            <p class="text-danger">Keywords is required</p>
                        </div>
                        <div class="form-group notes">
                            <p class="text-danger">Notes is required</p>
                        </div>
                    </div>
                </div>           
            </div><!-- panel-body -->
            <div>
                <div class="pull-left">
                    <a href="javascript:void(0)" class="btn btn-success updateVideoDetails" role="button">Save</a>
                    <!--<button class="btn btn-success updateVideoDetails">Save</button>-->
                </div>
                <div class="pull-left marginLeftTen registerSpinner">
                    <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                </div>
                <div class="alert alert-success pull-left marginLeftTen videoDetailsSaved">
                    <strong>Video details have been Successfully Saved</strong><br />An administrator has been informed and will review your video and be in contact with you shortly
                </div>
                <div class="alert alert-danger pull-left marginLeftTen videoDetailsSavedError">
                    <strong>Error in Saving Video Details</strong><br />Please try again as we are experiencing technical issues.
                </div>
            </div><!-- panel-footer -->
           </div>
        </div><!-- panel -->
                                
    </div>
<%} %>

<script src="<%= ResolveUrl("~/js/validateVideoDetails.js?v=17") %>"></script>