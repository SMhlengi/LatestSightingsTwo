/// <reference path="~/Scripts/knockout-3.3.0.js" />
/// <reference path="~/Scripts/jquery-1.10.2.js" />
/// <reference path="~/Scripts/resumable.js" />
$(document).ready(function () {

    function HideErrorMessageOnVideoDetails(control) {
        $("div " + control).hide();
    }

    function HideMessageErrorsOnVideoDetails() {
        HideErrorMessageOnVideoDetails(".videoTitle");
        HideErrorMessageOnVideoDetails(".alias");
        HideErrorMessageOnVideoDetails(".keywords");
        HideErrorMessageOnVideoDetails(".notes");
    }


    function ClearErrorStateOfVideoDetailsTextBoxes(control) {
        classAttr = $(control).parent().removeClass("has-error");
    }

    function ClearErrorWarningOnVideoDetailsTextBoxes() {
        ClearErrorStateOfVideoDetailsTextBoxes("#videoTitle");
        ClearErrorStateOfVideoDetailsTextBoxes("#alias");
        ClearErrorStateOfVideoDetailsTextBoxes("#keywords");
        ClearErrorStateOfVideoDetailsTextBoxes("#notes");
    }

    $(".updateVideoDetails").click(function () {
        ClearErrorWarningOnVideoDetailsTextBoxes();
        HideMessageErrorsOnVideoDetails();
        var status = ValidateVidDetails();
        if (status) {
            $(".registerSpinner").show();
            //videoUploadWithVideoDetailsCompleted($("#videoTitle").val(), $("#alias").val(), $("#keywords").val(), $("#notes").val(), self.r.files[0].file.name);
            SaveVideoDetailsAndSendMail($("#videoTitle").val(), $("#alias").val(), $("#keywords").val(), $("#notes").val());
        }
    });

    function ValidateVidDetails() {
        var valid = true;
        if (isEmpty("#videoTitle")) {
            $("#videoTitle").parent().addClass("has-error");
            $("div .videoTitle").show();
            valid = false;
        }

        if (isEmpty("#alias")) {
            $("#alias").parent().addClass("has-error");
            $("div .alias").show();
            valid = false;
        }

        if (isEmpty("#keywords")) {
            $("#keywords").parent().addClass("has-error");
            $("div .keywords").show();
            valid = false;
        }

        if (isEmpty("#notes")) {
            $("#notes").parent().addClass("has-error");
            $("div .notes").show();
            valid = false;
        }
        return valid;
    }

    function SaveVideoDetailsAndSendMail(videoTitle, alias, keywords, notes) {
        var postUrl = "/AjaxOperation.aspx/SaveVideoDetailsAndSendMail";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'videoTitle' : '" + videoTitle + "', 'alias' : '" + alias + "', 'keywords' : '" + keywords + "', 'notes' : '" + notes + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.d.savedStatus === "true") {
                    $.cookie('recordid', data.d.videoId, { expires: 100, path: '/' });
                    $(".registerSpinner").hide();
                    $("#videoTitle").removeAttr("disabled");
                    $("#alias").removeAttr("disabled");
                    $("#keywords").removeAttr("disabled");
                    $("#notes").removeAttr("disabled");

                    $("#videoTitle").val("");
                    $("#alias").val("");
                    $("#keywords").val("");
                    $("#notes").val("");

                    swal({
                        title: "Almost there..",
                        text: "Lets upload the media",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonText: "Ok",
                        closeOnConfirm: true,
                        html: false
                    });

                    hideVideoCaptureFormAndShowVideoUpload();

                    //$(".videoDetailsSaved").show();
                    //setTimeout(function () {
                    //    location.href = "/dashboard.aspx";
                    //}, 2000);


                } else {
                    $(".registerSpinner").hide();
                    $("#videoTitle").removeAttr("disabled");
                    $("#alias").removeAttr("disabled");
                    $("#keywords").removeAttr("disabled");
                    $("#notes").removeAttr("disabled");
                    $(".videoDetailsSavedError").show();
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function videoUploadWithVideoDetailsCompleted(videoTitle, alias, keywords, notes, filename) {
        swal({
            title: "Upload Complete !!",
            text: "File successfully uploaded.",
            type: "success",
            showCancelButton: false,
            confirmButtonText: "OK",
            closeOnConfirm: true
        });

        setTimeout(function () {
            $(".videoDetailsFormHeading").html("<strong>Saving video details. Please wait ...</strong>");
            $(".videoDetailsFormHeading").removeClass("alert-success");
            $(".videoDetailsFormHeading").addClass("alert-info");
            $("#videoTitle").attr("disabled", "disabled");
            $("#alias").attr("disabled", "disabled");
            $("#keywords").attr("disabled", "disabled");
            $("#notes").attr("disabled", "disabled");
        }, 3000);

        var postUrl = "/AjaxOperation.aspx/SaveVideoDetails";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'videoTitle' : '" + videoTitle + "', 'alias' : '" + alias + "', 'keywords' : '" + keywords + "', 'notes' : '" + notes + "', 'videofilename' : '" + filename + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d == true) {
                    $(".registerSpinner").hide();
                    $("#videoTitle").removeAttr("disabled");
                    $("#alias").removeAttr("disabled");
                    $("#keywords").removeAttr("disabled");
                    $("#notes").removeAttr("disabled");

                    swal({
                        title: "Done !!",
                        text: "Video Details successfully saved.",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonText: "Ok",
                        closeOnConfirm: false,
                        html: false
                    }, function () {
                        window.location.href = "/dashboard.aspx"
                    });


                } else {
                    $(".registerSpinner").hide();
                    $("#videoTitle").removeAttr("disabled");
                    $("#alias").removeAttr("disabled");
                    $("#keywords").removeAttr("disabled");
                    $("#notes").removeAttr("disabled");
                    $(".videoDetailsSavedError").show();
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function UpdateFileDetailsRecordWithFileName(filename, recordid, fileType) {
        var postUrl = "/AjaxOperation.aspx/UpdateRecordDetails";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'videofilename' : '" + filename + "', 'recordid' : '" + recordid + "', 'fileType' : '" + fileType + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d == true) {
                    swal({
                        title: "Well Done.",
                        text: "File successfully uploaded",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonText: "Ok",
                        closeOnConfirm: false,
                        html: false
                    }, function () {
                        window.location.href = "/dashboard.aspx"
                    });
                } else {
                    swal({
                        title: "Error with updating video record.",
                        text: "Something went wrong with updating your video details record with video name. Please try uploading the file again.",
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonText: "Ok",
                        closeOnConfirm: true,
                        html: false
                    });
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function isEmpty(control) {
        if ($(control).val() == "") {
            return true;
        }
        return false;
    }

    function hideVideoCaptureFormAndShowVideoUpload() {
        setTimeout(function () {
            $(".captureVideoDetailsContainer").hide();
            $(".rfuploaderPadding").show("slow");
            $(".rfuploader").show("slow");
            $this = $(".current");
            $this.removeClass("current");
            $this.addClass("visited");
            $($this.next()[0]).addClass("current");
        }, 2000);
    }



    vm = function ViewModel() {
        var self = this;
        self.filesToUpload = ko.observableArray();
        self.startUploadButtonText = ko.observable("Start Upload");
        self.uploadHasStarted = ko.observable(false);

        self.mainProgressBar = ko.observable('0%');
        self.disableUpload = ko.observable(false);
        self.r = new Resumable({ target: 'https://rfuapitwo.socialengine.co.za/api/File/Upload' });
        self.r.assignBrowse(document.getElementById('browseButton'));
        self.r.on('progress', function () {
            self.mainProgressBar((self.r.progress() * 100) + '%');
        });

        self.r.on('fileSuccess', function (file) {
            //console.debug('fileSuccess', file);
        });
        self.r.on('fileProgress', function (file) {
            //console.debug('fileProgress', file);

            for (var i = 0, iLen = self.filesToUpload().length; i < iLen; i++) {
                if (self.filesToUpload()[i].uniqueIdentifier == file.uniqueIdentifier) {
                    self.filesToUpload()[i].progress((file.progress() * 100) + '%');
                }
            }

        });
        self.r.on('fileAdded', function (file, event) {
            console.log("FILENAME");
            console.log(file.fileName);
            self.filesToUpload.push({
                fileName: file.fileName,
                uniqueIdentifier: file.uniqueIdentifier,
                progress: ko.observable('0%'),
                resumableFile: file,
                img: file.relativePath
            });
            //console.debug('fileAdded', event);
        });
        self.r.on('filesAdded', function (array) {
            $("#browseButton").attr("disabled", true);
            //console.debug('filesAdded', array);
        });
        self.r.on('fileRetry', function (file) {
            //console.debug(file);
        });
        self.r.on('fileError', function (file, message) {
            //console.debug('fileError', file, message);
        });
        self.r.on('uploadStart', function () {
            self.uploadHasStarted(true);
            $("#content-inner").css("height", "1150px");
            $this = $(".current");
            $this.removeClass("current");
            $this.addClass("visited");
            $($this.next()[0]).addClass("current");

        });
        self.r.on('complete', function () {
            //videoUploadWithVideoDetailsCompleted($("#videoTitle").val(), $("#alias").val(), $("#keywords").val(), $("#notes").val(), self.r.files[0].file.name);
            if ($.cookie('vupload', { path: '/' }) == "true") {
                UpdateFileDetailsRecordWithFileName(self.r.files[0].file.name, $.cookie('recordid'), "vid");
            }
            else if ($.cookie('imgupload', { path: '/' }) == "true") {
                UpdateFileDetailsRecordWithFileName(self.r.files[0].file.name, $.cookie('recordid'), "img");
            }

        });

        self.r.on('error', function (message, file) {
            //console.debug('error', message, file);
        });
        self.r.on('pause', function () {
            //console.debug('pause');
        });
        self.r.on('cancel', function () {
            //console.debug('cancel');
        });

        self.removeFile = function (file) {
            $("#browseButton").attr("disabled", false);
            self.r.removeFile(file);
            for (var i = 0, iLen = self.filesToUpload().length; i < iLen; i++) {
                if (self.filesToUpload()[i].uniqueIdentifier == file.uniqueIdentifier) {
                    self.filesToUpload(self.filesToUpload.splice(i + 1, 1));
                }
            }
        };

        self.UploadFileIfFileDoesNotExist = function () {
            var postUrl = "/AjaxOperation.aspx/DoesFileAlreadyExist";
            var fileType = "";
            if ($.cookie('vupload', { path: '/' }) == "true") {
                fileType = "vid";
            }
            else if ($.cookie('imgupload', { path: '/' }) == "true") {
                fileType = "img";
            }

            $.ajax({
                type: "POST",
                url: postUrl,
                data: "{'filename' : '" + self.filesToUpload()[0].fileName + "', 'fileType' : '" + fileType + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(
                function (data, textStatus, jqXHR) {
                    console.log(data.d);
                    if (data.d) {
                        swal({
                            title: "Duplicate File Detected!",
                            text: "Please rename your file as we already have a file with the same name uploaded.",
                            type: "warning",
                            showCancelButton: false,
                            confirmButtonText: "Ok",
                            closeOnConfirm: true,
                            html: false
                        });

                    } else {
                        self.r.upload()
                        self.startUploadButtonText("Uploading...");
                        self.disableUpload(true);
                    }
                }
            ).fail(
                function (data, textStatus, jqXHR) {
                }
            );
        };

        self.doUpload = function () {
            self.UploadFileIfFileDoesNotExist();
        };

        self.pauseUpload = function () {
            self.r.pause();
            self.startUploadButtonText("Resume");
        };
    };

    ko.applyBindings(vm);
});

