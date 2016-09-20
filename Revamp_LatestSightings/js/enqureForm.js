$(document).ready(function () {
    $(function () {
        $("#datepicker").datepicker();
    });

    var EnquiredLodgeName = "";

    $(".EnquiredAboutLodge").click(function () {
        $("#myModalLabel").html("Enquire Form");
        EnquiredLodgeName = $(this).parent().parent().parent().find("h4").html();
        var formheader = $("#myModalLabel").html() + " | " + EnquiredLodgeName;
        $("#myModalLabel").html(formheader);
    });


    $(".sendEnquireEmail").click(function () {
        ClearErrorWarningOnTextBoxes();
        HideMessageErrors();
        if (ValidateEnquireForm()) {
            $(".enquireMailSending").show();
            $(".enquireMailSending").css("display", "inline");
            SendEnquireEmail($("#firstname").val(), $("#useremail").val(), $("#country").val(), $("#telephonenumber").val(), $("#datepicker").val(), $("#numberofadults").val(), $("#numberofchildren").val(), $("#specialrequests").val(), $("#Numberofnightstravelled").val());
        }
    });

    function SendEnquireEmail(firstname, email, country, telephonenumber, datepicker, numberofadults, numberofchildren, specialrequests, Numberofnightstravelled) {
        var postUrl = "/AjaxOperation.aspx/SendEnquireMail";
        $.ajax({
            type: "POST",
            url: postUrl,
            data: "{'name' : '" + firstname + "', 'email' : '" + email + "', 'country' : '" + country + "', 'tel' : '" + telephonenumber + "', 'dateOfTravel' : '" + datepicker + "', 'numberOfAdults' : '" + numberofadults + "', 'numberOfChildren' : '" + numberofchildren + "', 'specialRequest' : '" + specialrequests + "', 'numberofnightstravelled' : '" + Numberofnightstravelled + "', 'EnquiredLodgeName' : '" + EnquiredLodgeName + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(
            function (data, textStatus, jqXHR) {
                if (data.d == true) {
                    $(".enquireMailSending").hide();
                    $(".enquireMailSent").show();
                    $(".enquireMailSent").css("display", "inline");
                    setTimeout(function () {
                        $(".enquireMailSent").hide();
                        $(".closeEnquireDialog").click();
                    }, 1700);
                }
            }
        ).fail(
            function (data, textStatus, jqXHR) {
            }
        );
    }

    function ClearErrorWarningOnTextBoxes() {
        ClearErrorStateOfTextBox("#firstname");
        ClearErrorStateOfTextBox("#useremail");
        ClearErrorStateOfTextBox("#country");
        ClearErrorStateOfTextBox("#telephonenumber");
        ClearErrorStateOfTextBox("#numberofadults");
        ClearErrorStateOfTextBox("#numberofchildren");
    }

    function ClearErrorStateOfTextBox(control) {
        classAttr = $(control).parent().removeClass("has-error");
    }

    function HideMessageErrors() {
        HideErrorMessage(".firstname");
        HideErrorMessage(".emailrequired");
        HideErrorMessage(".telephonenumberrequired");
        HideErrorMessage(".countryrequired");
        HideErrorMessage(".numberofadultsrequired");
        HideErrorMessage(".numberofchildrenrequired");
    }

    function HideErrorMessage(control) {
        $("div " + control).hide();
    }

    function isEmpty(control) {
        if ($(control).val() == "") {
            return true;
        }
        return false;
    }

    function isWholeNumber(s) {
        //var isWhole_re = /^\s*\d+\s*$/;
        var isWhole_re = /^[\d+\s]+$/;
        return String(s).search(isWhole_re) != -1;
    }
    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailAddress);
    }

    function ValidateEnquireForm() {
        var valid = true;
        if (isEmpty("#firstname")) {
            $("#firstname").parent().addClass("has-error");
            $(".firstname").show();
            valid = false;
        }

        if (isEmpty("#country")) {
            $("#country").parent().addClass("has-error");
            $(".countryrequired").show();
            valid = false;
        }

        if (isEmpty("#useremail")) {
            $("#useremail").parent().addClass("has-error");
            $(".emailrequired").html("* Email is required");
            $(".emailrequired").show();
            valid = false;
        } else {
            if (!isValidEmailAddress($("#useremail").val())) {
                $("#useremail").parent().addClass("has-error");
                $(".emailrequired").html("* Invalid Email address");
                $(".emailrequired").show();
                valid = false;
            }
        }

        if ($("#telephonenumber").val() != "") {
            if (isWholeNumber($("#telephonenumber").val()) == false) {
                $("#telephonenumber").parent().addClass("has-error");
                $(".telephonenumberrequired").html("* Telephone is invalid. Example: (+) 074 357 1596");
                $(".telephonenumberrequired").show();
                valid = false;
            }
        }

        if ($("#numberofadults").val() != "") {
            if (isWholeNumber($("#numberofadults").val()) == false) {
                $("#numberofadults").parent().addClass("has-error");
                $(".numberofadultsrequired").html("* Number of adults is invalid. Example: (+) 3");
                $(".numberofadultsrequired").show();
                valid = false;
            }
        }

        if ($("#numberofchildren").val() != "") {
            if (isWholeNumber($("#numberofchildren").val()) == false) {
                $("#numberofchildren").parent().addClass("has-error");
                $(".numberofchildrenrequired").html("* Number of children is invalid. Example: (+) 2");
                $(".numberofchildrenrequired").show();
                valid = false;
            }
        }
        return valid;
    }
});