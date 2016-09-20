<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_AddImage.ascx.cs" Inherits="Revamp_LatestSightings.uc_AddImage" %>
<br />
<div class="uploadImage">
    <div class="row tncRow" style="margin-bottom:1px;">
        <div class="col-md-9">
            <p class="text-primary emailFile"><strong style="color:white;">Please Note: </strong> The file must be a maximum of  <strong style="color:white;"> 10 mags</strong> </p>
        </div>
        <br />
    </div>    

    <div class="row">
        <div class="dotNetUploader">
           <div class="col-md-9">            
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4">
                                <asp:FileUpload ID="ImageFileUpload" runat="server" />
                            </div>
                            <div class="col-md-1">
                                <asp:Button ID="UploadImage" runat="server" Text="Upload" OnClick="UploadImage_Click" class="btn btn-primary btn-sm" OnClientClick="ShowSpinner()" />   
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
    </div>
</div>

<%if (addImageDetails == true)
  { %>
<div class="row">
    <div class="col-md-12">
        <div class="panel transparentBackground">
            <div class="panel-heading">
                <div class="panel-btns" style="display: none;">
                    <a href="" class="panel-minimize tooltips" data-toggle="tooltip" title="" data-original-title="Minimize Panel"><i class="fa fa-minus"></i></a>
                    <a href="" class="panel-close tooltips" data-toggle="tooltip" title="" data-original-title="Close Panel"><i class="fa fa-times"></i></a>
                </div><!-- panel-btns -->
                <h4 class="panel-title"></h4>
                    <p class="text-success seperation">Please provide us with the below information of the uploaded image</p>
            </div><!-- panel-heading -->
            <div class="panel-body">
                <!-- new textbox for image title -->
                <div class="row">
                    <div class="form-group col-md-8">
                        <input type="text" id="title" name="imageTitle" placeholder="Title" class="form-control" >
                    </div>
                </div>
                <!-- end of new textbox for image title -->
                <div class="row">
                    <div class="form-group col-md-8">
                        <input type="text" id="animal" name="videoTitle" placeholder="Animal" class="form-control" >
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <input type="text" id="activity" name="alias" placeholder="Activity" class="form-control"">
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="area" name="keywords" placeholder="Area" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <input type="text" id="tags" name="tags" placeholder="Tags" class="form-control"">
                    </div>
<%--                    <div class="form-group col-md-4">
                        <input type="text" id="extraField" name="extraField" placeholder="Extra Field" class="form-control">
                    </div>--%>
                </div>
                <div class="row">
                    <div class="form-group col-md-8">
                        <textarea class="form-control" id="comments" rows="8" placeholder="General Comment"></textarea>
                     </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <div class="form-group title">
                            <p class="text-danger">Title is required</p>
                        </div>
                        <div class="form-group animal">
                            <p class="text-danger">Animal Type is required</p>
                        </div>
                        <div class="form-group activity">
                            <p class="text-danger">Activity is required</p>
                        </div>
                        <div class="form-group area">
                            <p class="text-danger">Area is required</p>
                        </div>
                        <div class="form-group tags">
                            <p class="text-danger">Tags number is required</p>
                        </div>
                        <div class="form-group comments">
                            <p class="text-danger">Comments number is required</p>
                        </div>
                    </div>
                </div>           
            </div><!-- panel-body -->
            <div>
                <div class="pull-left">
                    <a href="javascript:void(0)" class="btn btn-success updateImageDetails" role="button">Save</a>                    
                </div>
                <div class="pull-left marginLeftTen registerSpinner">
                    <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                </div>
                <div class="alert alert-success pull-left marginLeftTen imageDetailsSaved">
                    <strong>Image details have been Successfully Saved</strong>
                </div>
                <div class="alert alert-danger pull-left marginLeftTen imageDetailsError">
                    <strong>Error in Saving Image Details</strong><br />Please try again as we are experiencing technical issues.
                </div>
            </div><!-- panel-footer -->
           </div>
        </div><!-- panel -->
                                
    </div>
<%} %>
