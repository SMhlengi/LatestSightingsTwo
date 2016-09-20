$(document).ready(function () {
    $(".submitRegistration").click(function () {
        ClearErrorWarningOnTextBoxes();
        HideMessageErrors();
        var status = ValidateRegisterPage();

        if (status) {
            var postUrl = "/AjaxOperation.aspx/DoesEmailExistgs";
            $.ajax({
                type: "POST",
                url: postUrl,
                data: "{'email' : '" + $("#email").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(
                function (data, textStatus, jqXHR) {
                    if (data.d.doesEmailExits == "true") {
                        $("div .email").prev().addClass("has-error");
                        $("div .email").html("<p class='text-danger'>Email Address already exists</p>");
                        $("div .email").show();
                    } else {
                        DoesScreenNameExists($("#screenName").val());
                    }
                }
            ).fail(
                function (data, textStatus, jqXHR) {
                }
            );
        }

    });


    function DoesScreenNameExists(screenName) {
        var postUrl = "/AjaxOperation.aspx/DoesScreenNameExist";
            $.ajax({
                type: "POST",
                url: postUrl,
                data: "{'screenName' : '" + screenName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(
                function (data, textStatus, jqXHR) {
                    if (data.d == true) {
                        $("div .screenName").prev().addClass("has-error");
                        $("div .screenName").html("<p class='text-danger'>Screen Name already exists</p>");
                        $("div .screenName").show();
                    } else {
                        $(".registerSpinner").show();
                        $("#firstname").attr("disabled", "disabled");
                        $("#lastname").attr("disabled", "disabled");
                        $("#email").attr("disabled", "disabled");
                        $("#password").attr("disabled", "disabled");
                        SaveRegistration($("#firstname").val(), $("#lastname").val(), $("#email").val(), $("#password").val(), $("#screenName").val());
                    }
                }
            ).fail(
                function (data, textStatus, jqXHR) {
                }
            );
    }

    $(".submitLogin").click(function () {
        $(".invalidCredentials").hide();
        ClearErrorWarningOnTextBoxes();
        HideMessageErrors();
        var status = ValidateLoginPage();

        if (status) {
            $(".registerSpinner").show();
            $("#email").attr("disabled", "disabled");
            $("#password").attr("disabled", "disabled");
            ValidateCredentials($("#email").val(), $("#password").val());
        }

    });

    $(".submitEmail").click(function () {
        $(".invalidCredentials").hide();
        ClearErrorWarningOnTextBoxes();
        HideMessageErrors();
        var status = ValidateForgottenPassword();

        if (status) {
            $(".registerSpinner").show();
            $("#email").attr("disabled", "disabled");
            SendForgottonPasswordEmail($("#email").val());
        }

    });

    $(".resetPassword").click(function () {
        $(".passwordsDoNotMatch").hide();
        ClearErrorWarningOnTextBoxes();
        HideMessageErrors();
        var status = ValidateResetPasswordPage();

        if (status) {
            $(".registerSpinner").show();
            $("#password").attr("disabled", "disabled");
            $("#confirmPassword").attr("disabled", "disabled");
            UpdatePassword($("#password").val(), $("#email").val());
        }
    });

    $(".readmoreblogs").click(function () {
        location.href = "/bloglist";
    });

    $(".newsletter").click(function () {
        $(".panelWithWhiteBackgroundBorder").show();
    });

    $(".subScribeToNewsletter").click(function () {
        $(".email").hide();
        ClearErrorStateOfTextBox(".email");
        valid = true;

        if (isEmpty("#email")) {
            $("div .email").prev().addClass("has-error");
            $("div .email").html("<p class='text-danger'>Email is required</p>");
            $("div .email").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#email").val())) {
                $("div .email").prev().addClass("has-error");
                $("div .email").html("<p class='text-danger'>Invalid Email address</p>");
                $("div .email").show();
                valid = false;
            }
        }

        if (valid) {
            $(".email").hide();
            ClearErrorStateOfTextBox(".email");
            $(".newslettersubscribing").show();
            SubscribeToNewsLetter($("#email").val(), false);
        }
    });

    $(".footerSubscribeToNewsLetter").click(function () {
        $(".emailfooter").hide();
        ClearErrorStateOfTextBox(".emailfooter");
        valid = true;

        if (isEmpty("#emailfooter")) {
            $("div .emailfooter").prev().addClass("has-error");
            $("div .emailfooter").html("<p>Email is required</p>");
            $("div .emailfooter").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#emailfooter").val())) {
                $("div .emailfooter").prev().addClass("has-error");
                $("div .emailfooter").html("<p>Invalid Email address</p>");
                $("div .emailfooter").show();
                valid = false;
            }
        }

        if (valid) {
            $(".emailfooter").hide();
            ClearErrorStateOfTextBox(".emailfooter");
            $(".footerSubscribeToNewsLetter").next().html("<strong>Subscribing</strong>&nbsp;&nbsp;Please wait .....")

            SubscribeToNewsLetter($("#emailfooter").val(), true);
        }
    });

    function isEmpty(control) {
        if ($(control).val() == "") {
            return true;
        }
        return false;
    }

    function ClearErrorStateOfTextBox(control) {
        classAttr = $("div " + control).prev().removeClass("has-error");
    }

    function HideErrorMessage(control) {
        $("div " + control).hide();
    }

    function ValidateRegisterPage() {
        var valid = true;
        if (isEmpty("#firstname")) {
            $("div .firstname").prev().addClass("has-error");
            $("div .firstname").show();
            valid = false;
        }

        if (isEmpty("#lastname")) {
            $("div .lastname").prev().addClass("has-error");
            $("div .lastname").show();
            valid = false;
        }

        if (isEmpty("#email")) {
            $("div .email").prev().addClass("has-error");
            $("div .email").html("<p class='text-danger'>Email is required</p>");
            $("div .email").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#email").val())) {
                $("div .email").prev().addClass("has-error");
                $("div .email").html("<p class='text-danger'>Invalid Email address</p>");
                $("div .email").show();
                valid = false;
            }
        }

        if (isEmpty("#password")) {
            $("div .password").prev().addClass("has-error");
            $("div .password").show();
            valid = false;
        }

        if (isEmpty("#screenName")) {
            $("div .screenName").prev().addClass("has-error");
            $("div .screenName").show();
            valid = false;
        }

        return valid;
    }

    function ValidateLoginPage() {
        var valid = true;

        if (isEmpty("#email")) {
            $("div .email").prev().addClass("has-error");
            $("div .email").html("<p class='text-danger'>Email is required</p>");
            $("div .email").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#email").val())) {
                $("div .email").prev().addClass("has-error");
                $("div .email").html("<p class='text-danger'>Invalid Email address</p>");
                $("div .email").show();
                valid = false;
            }
        }

        if (isEmpty("#password")) {
            $("div .password").prev().addClass("has-error");
            $("div .password").show();
            valid = false;
        }

        return valid;
    }

    function SubscribeToNewsLetter(emailAddress, footer) {
        var postUrl = "/AjaxOperation.aspx/SubscribeToNewsLetter";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'email' : '" + emailAddress + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d == true) {
                    if (footer) {
                        $(".footerSubscribeToNewsLetter").next().html("<strong>Successfully Subscribed !!!</strong>")
                    } else {
                        $(".newslettersubscribing").hide();
                        $(".successfullySubscribeToNewsletter").show();
                        setTimeout(function () {
                            $(".successfullySubscribeToNewsletter").hide();
                            $(".panelWithWhiteBackgroundBorder").hide();
                            $(".newsletter").hide();

                        }, 3500);
                    }
                } else {
                    console.log("in else part");
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function ValidateResetPasswordPage() {
        var valid = true;

        if (isEmpty("#password")) {
            $("div .password").prev().addClass("has-error");
            $("div .password").show();
            valid = false;
        }
        if (isEmpty("#confirmPassword")) {
            $("div .confirmPassword").prev().addClass("has-error");
            $("div .confirmPassword").show();
            valid = false;
        }

        if (valid == true) {
            valid = DoPasswordsMatch($("#password").val(), $("#confirmPassword").val());
        }
        return valid;
    }

    function DoPasswordsMatch(password, confirmPassword)
    {
        if (password != confirmPassword) {
            $(".passwordsDoNotMatch").show();
            $("div .password").prev().addClass("has-error");
            $("div .confirmPassword").prev().addClass("has-error");
            return false;
        }

        return true;
    }

    function ValidateForgottenPassword() {
        var valid = true;

        if (isEmpty("#email")) {
            $("div .email").prev().addClass("has-error");
            $("div .email").html("<p class='text-danger'>Email is required</p>");
            $("div .email").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#email").val())) {
                $("div .email").prev().addClass("has-error");
                $("div .email").html("<p class='text-danger'>Invalid Email address</p>");
                $("div .email").show();
                valid = false;
            }
        }

        return valid;
    }

    function ClearErrorWarningOnTextBoxes() {
        ClearErrorStateOfTextBox(".firstname");
        ClearErrorStateOfTextBox(".lastname");
        ClearErrorStateOfTextBox(".email");
        ClearErrorStateOfTextBox(".password");
        ClearErrorStateOfTextBox(".confirmPassword");
        ClearErrorStateOfTextBox(".confirmPassword");
        ClearErrorStateOfTextBox(".screenName");
    }

    function HideMessageErrors() {
        HideErrorMessage(".firstname");
        HideErrorMessage(".lastname");
        HideErrorMessage(".email");
        HideErrorMessage(".password");
        HideErrorMessage(".confirmPassword");
        HideErrorMessage(".screenName");
    }

    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailAddress);
    }

    function SaveRegistration(firstname, lastname, email, password, screenName) {
        var postUrl = "/AjaxOperation.aspx/SaveRegistrationData";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'firstname' : '" + firstname + "', 'lastname' : '" + lastname + "', 'email' : '" + email + "', 'password' : '" + password + "', 'screenName' : '" + screenName + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d == true) {
                    $(".registerSpinner").hide();
                    $(".successfullyRegistered").show();
                    setTimeout(function () { location.href = "/dashboard.aspx"; }, 3500);
                } else {
                    console.log("in else part");
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function ValidateCredentials(email, password) {
        var postUrl = "/AjaxOperation.aspx/IsValidUser";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'email' : '" + email + "', 'password' : '" + password + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.d.credentialsValid == "true") {
                    $("#userFullname").html(data.d.firstname + " " + data.d.lastname);
                    $(".successfullyLoggedIn").show();
                    if ($("#rememberMe").prop("checked")) {
                        SetRememberCookie(data.d.encreptedPassword);
                    }
                    setTimeout(function () { location.href = "/dashboard.aspx" }, 3500);
                } else {
                    $(".registerSpinner").hide();
                    $("div .email").prev().addClass("has-error");
                    $("div .password").prev().addClass("has-error");
                    $(".invalidCredentials").show();
                    $("#email").removeAttr("disabled");
                    $("#password").removeAttr("disabled");
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function SendForgottonPasswordEmail(email) {
        var postUrl = "/AjaxOperation.aspx/SendForgottonPasswordEmail";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'email' : '" + email + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.d == true) {
                    $(".registerSpinner").hide();
                    $(".successfullySentMail").show();
                    setTimeout(function () { location.href = "/"; }, 5500);
                } else {
                    $(".registerSpinner").hide();
                    $(".successfullyNotSentMail").show();
                    $("#email").removeAttr("disabled");
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function UpdatePassword(password, email) {
        var postUrl = "/AjaxOperation.aspx/UpdatePassword";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'password' : '" + password + "', 'email' : '" + email + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.d == true) {
                    $(".registerSpinner").hide();
                    $(".succesfullyUpdateEmail").show();
                    setTimeout(function () { location.href = "/login"; }, 5500);
                } else {
                    $(".registerSpinner").hide();
                    $(".errorWithEmailUpdate").show();
                    setTimeout(function () { location.href = "/"; }, 5500);
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }



    $(".tncNext").click(function () {
        if ($("#chk_terms").prop('checked')) {
            $(".termsAndConditions").hide();
            $(".captureVideoDetailsContainer").show("slow");
            $(".updateVideoDetails").show("slow");
            $("#content-inner").css("height", "850px");
            $this = $(".current");
            $this.removeClass("current");
            $this.addClass("visited");
            $($this.next()[0]).addClass("current");
            $.cookie('vupload', true, { expires: 100, path: '/' });
            $.cookie('imgupload', false, { expires: 100, path: '/' });
        }
    });

    $("#ContentPlaceHolder1_ctl00_Uploader1__Insert").click(function (event) { // <- goes here !
        if ($("#chk_terms").prop('checked') == false) {
            event.preventDefault();
        }
    });

    function SetRememberCookie(encreptedPassword) {
        $.cookie('lsrm', true, { expires: 100, path: '/' });
        $.cookie('lsusername', $("#email").val(), { expires: 100, path: '/' });
        $.cookie('lspassword', encreptedPassword, { expires: 100, path: '/' });
        $.cookie('pencr', true, { expires: 100, path: '/' });
    }

    function LoginIfOnLoginPageAndRememberMeIsSet() {
        if (location.pathname.toLowerCase() == "/login" || location.pathname.toLowerCase() == "/login.aspx") {
            if ($.cookie('lsrm', { path: '/' }) == "true") {
                if (HasPasswordBeenEncreptedBefore() == false) {
                    EncreptPassword($.cookie('lspassword', { path: '/' }));
                } else {
                    $("#email").val($.cookie('lsusername', { path: '/' }));
                    DecreptPassword($.cookie('lspassword', { path: '/' }));
                }
            }
        }
    }

    function HasPasswordBeenEncreptedBefore() {
        if ($.cookie('pencr', { path: '/' }) == null) {
            return false;
        } else {
            return true;
        }
    }

    function EncreptPassword(ps) {
        var postUrl = "/AjaxOperation.aspx/EncreptPassword";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'password' : '" + ps + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                console.log(data);
                $.cookie('lspassword', data.d, { expires: 100, path: '/' });
                $.cookie('pencr', true, { expires: 100, path: '/' });
                $("#email").val($.cookie('lsusername', { path: '/' }));
                DecreptPassword($.cookie('lspassword', { path: '/' }));
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );

    }

    function DecreptPassword(p) {
        var postUrl = "/AjaxOperation.aspx/DecreptPassword";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'password' : '" + p + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.d.decrepted == "true") {                    
                    $("#password").val(data.d.decreption);
                    $("#rememberMe").attr("checked", true);
                    $(".submitLogin").click();
                }

            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    $("#lscms2logout").click(function () {
        $.cookie('lsrm', null, { path: '/' });
        $.cookie('lsusername', null, { path: '/' });
        $.cookie('lspassword', null, { path: '/' });
        $.cookie('pencr', null, { path: '/' });
        location.href = "/";
    });


    $(".Login").click(function () {
        location.href = "/login";
    });

    $(".shareOnFacebook").click(function () {
        var videoId = $(this).parent().parent().find(".youtube").attr("rel");
        var youtubeVideoUrl = "https://www.youtube.com/watch?v=";
        youtubeVideoUrl += videoId;

        FB.ui({
            method: 'share',
            href: youtubeVideoUrl,
        }, function (response) { });
    });

    $(".blogFacebookShare").click(function () {
        var shareUrl = location.href;

        FB.ui({
            method: 'share',
            href: shareUrl,
        }, function (response) { });
    });

    $(".aboutUsFacebookShare").click(function () {
        var shareUrl = location.href;

        FB.ui({
            method: 'share',
            href: shareUrl,
        }, function (response) { });
    });


    $(".shareOnTwitter").click(function () {
        var videoId = $(this).parent().parent().find(".youtube").attr("rel");
        var youtubeVideoUrl = "https://www.youtube.com/watch?v=";
        youtubeVideoUrl += videoId;

        //We get the URL of the link
        var loc = $(this).attr('href');

        //We get the title of the link
        var title = encodeURIComponent($(this).parent().parent().find(".blog-grid-content").find("a").html());

        //We trigger a new window with the Twitter dialog, in the middle of the page
        window.open('http://twitter.com/share?url=' + youtubeVideoUrl + '&text=' + title + '&', 'twitterwindow', 'height=450, width=550, top=' + ($(window).height() / 2 - 225) + ', left=' + $(window).width() / 2 + ', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
    });

    $(".featured-video-shareOnTwitter").click(function () {
        var videoId = $(this).parent().parent().parent().prev().find(".youtube").attr("rel");
        var youtubeVideoUrl = "https://www.youtube.com/watch?v=";
        youtubeVideoUrl += videoId;
        //We get the title of the link
        var title = encodeURIComponent($(this).parent().parent().parent().find(".blog-list-title").find("a").html());

        //We trigger a new window with the Twitter dialog, in the middle of the page
        window.open('http://twitter.com/share?url=' + youtubeVideoUrl + '&text=' + title + '&', 'twitterwindow', 'height=450, width=550, top=' + ($(window).height() / 2 - 225) + ', left=' + $(window).width() / 2 + ', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
    });

    $(".featured-video-shareOnFacebook").click(function () {
        var videoId = $(this).parent().parent().parent().prev().find(".youtube").attr("rel");
        var youtubeVideoUrl = "https://www.youtube.com/watch?v=";
        youtubeVideoUrl += videoId;

        FB.ui({
            method: 'share',
            href: youtubeVideoUrl,
        }, function (response) { });
    });

    $(".blogTwitterShare").click(function () {

        //We get the URL of the link
        var loc = location.href;

        //We get the title of the link
        var title = encodeURIComponent($(".main-title").html() + " via @LatestKruger");

        //We trigger a new window with the Twitter dialog, in the middle of the page
        window.open('http://twitter.com/share?url=' + loc + '&text=' + title + '&', 'twitterwindow', 'height=450, width=550, top=' + ($(window).height() / 2 - 225) + ', left=' + $(window).width() / 2 + ', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
    });

    $(".aboutUsTwitterShare").click(function () {

        //We get the URL of the link
        var loc = location.href;

        //We get the title of the link
        var title = encodeURIComponent("About Latest Sightings via @LatestKruger");

        //We trigger a new window with the Twitter dialog, in the middle of the page
        window.open('http://twitter.com/share?url=' + loc + '&text=' + title + '&', 'twitterwindow', 'height=450, width=550, top=' + ($(window).height() / 2 - 225) + ', left=' + $(window).width() / 2 + ', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
    });

    $(".aboutNadavTab").click(function () {
        $(".aboutUs").hide();
        $(".AboutNadavOssendryver").show();
        $(".aboutUsTab").removeClass("active");
        $(this).addClass("active");
    });

    $(".aboutUsTab").click(function () {
        $(".AboutNadavOssendryver").hide();
        $(".aboutUs").show();
        $(".aboutNadavTab").removeClass("active");
        $(this).addClass("active");
    });

    $(".singup").click(function () {
        location.href = "/register";
    });

    $(".contactus").click(function () {
        location.href = "contact-us";
    });

    $(".appReadMore").click(function () {
        location.href = "/content/latest-sightings-app";
    });

    $("#videoUploadRadio").click(function () {
        $("#imageUploadRadio").removeClass("checked");
        $("#videoUploadRadio").addClass("checked");
        $(".uploadImagePanel").hide();
        $(".uploadVideoPanel").show("slow");
        $.cookie('vupload', true, { expires: 100, path: '/' });
        $.cookie('imgupload', false, { expires: 100, path: '/' });
    });

    $("#imageUploadRadio").click(function () {
        $("#videoUploadRadio").removeClass("checked");
        $("#imageUploadRadio").addClass("checked");
        $(".uploadVideoPanel").hide();
        $(".uploadImagePanel").show("slow");
        $("#content-inner").css("height", "1050px");
        $.cookie('imgupload', true, { expires: 100, path: '/' });
        $.cookie('vupload', false, { expires: 100, path: '/' });
    });


    //$('#searchFor').bind("enterKey", function (e) {
    //    alert($("#searchFor").val());
    //});

    //$('#searchFor').keyup(function (e) {
    //    if (e.keyCode == 13) {
    //        $(this).trigger("enterKey");
    //    }
    //});


    LoginIfOnLoginPageAndRememberMeIsSet();

    $("#videoListTab").click(function () {
        $("#content-inner").css("height", "1650px");
    });
});