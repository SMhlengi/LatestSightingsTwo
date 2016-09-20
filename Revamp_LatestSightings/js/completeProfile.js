$(document).ready(function () {
    SetBankingDetails();
    ValidateProfilePage();
    //if (status) {
    //    $(".registerSpinner").show();
    //    $("#firstname").attr("disabled", "disabled");
    //    $("#lastname").attr("disabled", "disabled");
    //    $("#email").attr("disabled", "disabled");
    //    $("#password").attr("disabled", "disabled");
    //    SaveRegistration($("#firstname").val(), $("#lastname").val(), $("#email").val(), $("#password").val());
    //}

    function isWholeNumber(s) {
        //var isWhole_re = /^\s*\d+\s*$/;
        var isWhole_re = /^[\d+\s]+$/;
        return String(s).search(isWhole_re) != -1;
    }

    function ValidateProfilePage() {
        var valid = true;
        if (isEmpty("#firstname")) {
            $("#firstname").parent().addClass("has-error");
            $("div .firstname").show();
            valid = false;
        }

        if (isEmpty("#lastname")) {
            $("#lastname").parent().addClass("has-error");
            $("div .lastname").show();
            valid = false;
        }

        if (isEmpty("#email")) {
            $("#email").parent().addClass("has-error");
            $("div .email").html("<p class='text-danger'>Email is required</p>");
            $("div .email").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#email").val())) {
                $("#email").parent().addClass("has-error");
                $("div .email").html("<p class='text-danger'>Invalid Email address</p>");
                $("div .email").show();
                valid = false;
            }
        }

        if (isEmpty("#cellnumber")) {
            $("#cellnumber").parent().addClass("has-error");
            $("div .cellnumber").html("<p class='text-danger'>Cellphone number is required</p>");
            $("div .cellnumber").show();
            valid = false;
        } else {
            if (isWholeNumber($("#cellnumber").val()) == false) {
                $("#cellnumber").parent().addClass("has-error");
                $("div .cellnumber").html("<p class='text-danger'>Cellphone number is invalid. Example: Option (+) 074 357 1596</p>");
                $("div .cellnumber").show();
                valid = false;
            }
        }

        if (isEmpty("#telephonenumber")) {
            $("#telephonenumber").parent().addClass("has-error");
            $("div .telephonenumber").html("<p class='text-danger'>Telephone number is required</p>");
            $("div .telephonenumber").show();
            valid = false;
        } else {
            if (isWholeNumber($("#telephonenumber").val()) == false) {
                $("#telephonenumber").parent().addClass("has-error");
                $("div .telephonenumber").html("<p class='text-danger'>Telephone number invalid. Example: Option (+) 021 323 4567</p>");
                $("div .telephonenumber").show();
                valid = false;
            }
        }

        if (isEmpty("#othercontant") == false) {
            if (isWholeNumber($("#othercontant").val()) == false) {
                $("#othercontant").parent().addClass("has-error");               
                $("div .othercontant").show();
                valid = false;
            }
        }

        if (isEmpty("#address")) {
            $("#address").parent().addClass("has-error");
            $("div .address").show();
            valid = false;
        }

        //if (isEmpty("#bank")) {
        //    $("#bank").parent().addClass("has-error");
        //    $("div .bank").show();
        //    valid = false;
        //}
        return valid;
    }

    // validate contact us 
    function ValidateContactUs() {
        var valid = true;
        if (isEmpty("#firstname")) {
            $("#firstname").parent().addClass("has-error");
            $("div .userfirstname").show();
            valid = false;
        }

        if (isEmpty("#email")) {
            $("#email").parent().addClass("has-error");
            $("div .useremail").html("<p class='text-danger'>Email is required</p>");
            $("div .useremail").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#email").val())) {
                $("#email").parent().addClass("has-error");
                $("div .useremail").html("<p class='text-danger'>Invalid Email address</p>");
                $("div .useremail").show();
                valid = false;
            }
        }

        if (isEmpty("#address")) {
            $("#address").parent().addClass("has-error");
            $("div .useraddress").show();
            valid = false;
        }

        return valid;
    }
    // end of validate contact us

    $(".updateProfile").click(function () {
        ClearErrorWarningOnTextBoxes();
        HideMessageErrors();
        var status = ValidateProfilePage();
        if (status) {
            $(".registerSpinner").show();
            DisableControls();
            UpdateProfile($("#firstname").val(), $("#lastname").val(), $("#email").val(), $("#cellnumber").val(), $("#telephonenumber").val(), $("#othercontant").val(), $("#address").val(), $("#bank").val(), $("#payPal").val(), $("#facebook").val(), $("#twitter").val(), $("#skype").val(), $("#Accounttype").val(), $("#accountnumber").val(), $("#branchname").val(), $("#branchcode").val());
        }

    });

    // contact us
    $(".submitContactUs").click(function () {
        ClearErrorWarningOnTextBoxes();
        HideMessageErrors();
        var status = ValidateContactUs();
        if (status) {
            $(".registerSpinner").show();
            //DisableControls();
            SendContactUsEmail($("#firstname").val(), $("#email").val(), $("#address").val());
        }

    });
    // end of contact us 

    $(".launchNativeEmailClient").click(function () {
        window.location.href = "mailto:videos@latestsightings.com";
    });

    $(".launchDotNetUploader").click(function () {
        if ($("#chk_terms").prop('checked') == false) {
            event.preventDefault();
        } else {
            $(".ajaxUploaderClass").hide();
            $(".dontnetuploaderpanel").show("slow");
        }
    });

    function DisableControls() {
        $("#firstname").attr("disabled", "disabled");
        $("#lastname").attr("disabled", "disabled");
        $("#email").attr("disabled", "disabled");
        $("#cellnumber").attr("disabled", "disabled");
        $("#telephonenumber").attr("disabled", "disabled");
        $("#othercontant").attr("disabled", "disabled");
        $("#address").attr("disabled", "disabled");
        $("#bank").attr("disabled", "disabled");
        $("#payPal").attr("disabled", "disabled");
        $("#facebook").attr("disabled", "disabled");
        $("#twitter").attr("disabled", "disabled");
        $("#skype").attr("disabled", "disabled");
    }

    function EnableControls() {
        $("#firstname").removeAttr("disabled");
        $("#lastname").removeAttr("disabled");
        $("#email").removeAttr("disabled");
        $("#cellnumber").removeAttr("disabled");
        $("#telephonenumber").removeAttr("disabled");
        $("#othercontant").removeAttr("disabled");
        $("#address").removeAttr("disabled");
        $("#bank").removeAttr("disabled");
        $("#payPal").removeAttr("disabled");
        $("#facebook").removeAttr("disabled");
        $("#twitter").removeAttr("disabled");
        $("#skype").removeAttr("disabled");
    }

    function isEmpty(control) {
        if ($(control).val() == "") {
            return true;
        }
        return false;
    }

    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailAddress);
    }

    function ClearErrorWarningOnTextBoxes() {
        ClearErrorStateOfTextBox("#firstname");
        ClearErrorStateOfTextBox("#lastname");
        ClearErrorStateOfTextBox("#email");
        ClearErrorStateOfTextBox("#cellnumber");
        ClearErrorStateOfTextBox("#telephonenumber");
        ClearErrorStateOfTextBox("#address");
        //ClearErrorStateOfTextBox("#bank");
        ClearErrorStateOfTextBox("#othercontant");
    }

    function ClearErrorStateOfTextBox(control) {
        classAttr = $(control).parent().removeClass("has-error");
    }

    function HideMessageErrors() {
        HideErrorMessage(".firstname");
        HideErrorMessage(".lastname");
        HideErrorMessage(".email");
        HideErrorMessage(".cellnumber");
        HideErrorMessage(".telephonenumber");
        HideErrorMessage(".address");
        //HideErrorMessage(".bank");
        HideErrorMessage(".othercontant");
        HideErrorMessage(".userfirstname");
        HideErrorMessage(".useremail");
        HideErrorMessage(".useraddress");
    }

    function HideErrorMessage(control) {
        $("div " + control).hide();
    }

    function EnableTabs() {
        $("#addvideoTab").attr("href", "#addvideo");
        $("#addvideoTab").parent().attr("class", "");
        $("#videoListTab").attr("href", "#videolist");
        $("#videoListTab").parent().attr("class", "");
    }

    function SetBankingDetails() {
        if ($("#bankChoosen").val() != "") {
            var type = $("#bankChoosen").val();
            $("#bank").val(type).attr("selected", "selected");
        }

        if ($("#accountTypeChoose").val() != "") {
            var type = $("#accountTypeChoose").val();
            $("#Accounttype").val(type).attr("selected", "selected");
        }
    }

    function UpdateProfile(firstname, lastname, email, cellnumber, telephonenumber, othercontant, address, bank, payPal, facebook, twitter, skype, accounttype, accountnumber, branchname, brachcode) {
        var postUrl = "/AjaxOperation.aspx/UpdateProfile";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'firstname' : '" + firstname + "', 'lastname' : '" + lastname 
                + "', 'telephonenumber' : '" + telephonenumber + "', 'othercontact' : '" + othercontant
                + "', 'address' : '" + address + "', 'bank' : '" + bank 
                + "', 'payPal' : '" + payPal + "', 'facebook' : '" + facebook
                + "', 'twitter' : '" + twitter + "', 'skype' : '" + skype
                + "', 'email' : '" + email + "', 'cellnumber' : '" + cellnumber
                + "', 'accounttype' : '" + accounttype + "', 'accountnumber' : '" + accountnumber
                + "', 'branchname' : '" + branchname + "', 'brachcode' : '" + brachcode + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d == true) {
                    $(".registerSpinner").hide();
                    $(".profileUpdated").show();
                    EnableControls();
                    $(".text-success").hide();
                    setTimeout(function () { $(".profileUpdated").hide(); }, 10000);
                    EnableTabs();
                } else {
                    EnableControls();
                    $(".registerSpinner").hide();
                    $(".profileUpdatedError").show();
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function SendContactUsEmail(firstname, email, message) {
        var postUrl = "/AjaxOperation.aspx/SendContactUsEmail";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'name' : '" + firstname + "', 'email' : '" + email + "', 'message' : '" + message + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d == true) {
                    $(".registerSpinner").hide();
                    $(".profileUpdated").show();
                    //EnableControls();
                    //$(".text-success").hide();
                    //setTimeout(function () { $(".profileUpdated").hide(); }, 10000);
                    //EnableTabs();
                } else {
                    //EnableControls();
                    $(".registerSpinner").hide();
                    $(".profileUpdatedError").show();
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }
});