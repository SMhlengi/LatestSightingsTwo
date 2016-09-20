<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_resumableFileUpload.ascx.cs" Inherits="Revamp_LatestSightings.uc_resumableFileUpload" %>

    <!-- Main Container Section -->	
<link href="<%= ResolveUrl("~/css/sweetalert.css") %>" rel="stylesheet" type="text/css">
<link href="<%= ResolveUrl("~/css/site.css") %>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%= ResolveUrl("~/css/rfu.css") %>"	/>

    <div class="container">
        <div id="page-content">

            <!-- Page Content Area -->
            <div id="content-inner">
    <div class="panel row">
        <h2>Upload files</h2>
        <div class="row">
            <div class="col-md-2">
                <a href="#" id="browseButton" class="btn btn-success fileinput-button" disabled.bind="disableUpload">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Add files...</span>
                </a>
            </div>
            <div class="col-md-2">
                <button id="startButton" data-bind="click: doUpload" type="button" class="btn btn-primary start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span data-bind="text: startUploadButtonText"></span>
                </button>
            </div>
            <div class="col-md-2">
                <button id="startButton" data-bind="click: pauseUpload" type="button" class="btn btn-info start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Pause upload</span>
                </button>
            </div>
        </div>
    </div>

    <ul class="list-group row">
        <li data-bind="foreach: filesToUpload" class="list-group-item col-md-12">
            <div class="col-md-3">
                <span data-bind="text: fileName"></span>
            </div>

            <div class="progress col-md-8 nopadding">
                <div class="progress-bar" role="progressbar"
                     aria-valuemin="0" aria-valuemax="100" data-bind="style: {width: progress()}">
                    <span class="sr-only" data-bind="text: fileName + ' Complete'"></span>
                </div>
            </div>
            <div class="col-md-1">
                <a data-bind="click: function(){removeFile(resumableFile)}">
                    <span class="glyphicon glyphicon-remove" style="cursor: pointer;color:red"></span>
                </a>
            </div>

        </li>
    </ul>
    <div class="progress row">
        <div id="progressBar" class="progress-bar" role="progressbar" aria-valuenow="70"
             aria-valuemin="0" aria-valuemax="100" data-bind="style: {width: mainProgressBar()}">
            <span class="sr-only" data-bind="text: mainProgressBar + ' Complete'"></span>
        </div>
    </div>

    <div class="panel panel-default row">
        <div class="panel-heading">
            <h3 class="panel-title">Notes</h3>
        </div>
        <div class="panel-body">
            <ul>
                <li>We need to put some text here saying the following browsers are supported Firefox 4+, Chrome 11+, Safari 6+ and Internet Explorer 10+.</li>
                <li>Uploads will resume if you internet connection is interupted</li>
            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>


<script src="<%= ResolveUrl("~/js/modernizr-2.6.2.js") %>"></script>
<script src="<%= ResolveUrl("~/js/knockout-3.3.0.js") %>"></script>
<script src="<%= ResolveUrl("~/js/sweetalert.min.js") %>"></script>
<script src="<%= ResolveUrl("~/js/resumable.js") %>"></script>
<script src="<%= ResolveUrl("~/js/upload.js?v=7") %>"></script>


<!--bootstrap.css -->
