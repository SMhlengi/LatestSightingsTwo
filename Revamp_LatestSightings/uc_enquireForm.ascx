<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_enquireForm.ascx.cs" Inherits="Revamp_LatestSightings.uc_enquireForm" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="<%= ResolveUrl("~/css/enquireForm.css") %>">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Enquire Form</h4>
      </div>
      <div class="modal-body">
                <div class="row">
                    
                    <div class="form-group col-md-10">
                        <p class="text-primary">Name ( required )</p>
                        <input type="text" id="firstname" name="firstname" placeholder="" class="form-control" value="" >
                    </div>
                     <div class="form-group col-md-10">
                        <p class="text-primary">Email ( required )</p>
                        <input type="email" id="useremail" name="email" placeholder="" class="form-control" value="">
                    </div>
                    <div class="form-group col-md-10">
                        <p class="text-primary">Country ( required )</p>
                        <input type="text" id="country" name="lastname" placeholder="" class="form-control" value="">
                    </div>
                    <div class="form-group col-md-10">
                        <p class="text-primary">Telephone</p>
                        <input type="text" id="telephonenumber" name="telephonenumber" placeholder="" class="form-control" value="" >
                    </div>
                  
                    <div class="form-group col-md-10">
                        <p class="text-primary">Date Of Travel</p>
                        <input type="text" id="datepicker" name="telephonenumber" placeholder="" class="form-control" value="" >
                    </div>

                    <div class="form-group col-md-10">
                        <p class="text-primary">Number of adults (12 + years old)</p>
                        <input type="text" id="numberofadults" name="othercontant" placeholder="" class="form-control" value="">
                    </div>
                    <!-- social network -->
                    <div class="form-group col-md-10">
                        <p class="text-primary">Number of children</p>
                        <input type="text" id="numberofchildren" name="facebook" placeholder="" class="form-control" value="">
                    </div>
                    <div class="form-group col-md-10">
                        <p class="text-primary">Number of nights travelled</p>
                        <input type="text" id="Numberofnightstravelled" name="Numberofnightstravelled" placeholder="" class="form-control" value="">
                    </div>
                    <div class="form-group col-md-10">
                        <p class="text-primary">Special requests</p>
                        <textarea class="form-control" id="specialrequests" rows="5" placeholder=""></textarea>
                    </div>
                    <div class="form-group col-md-10 errorMessages">
                        <p class="text-danger firstname">* Name is required</p>
                        <p class="text-danger emailrequired"></p>
                        <p class="text-danger telephonenumberrequired">Telephone number invalid. Example: Option (+) 021 323 4567</p>
                        <p class="text-danger countryrequired">* Country is required</p>                        
                        <p class="text-danger numberofadultsrequired"></p>
                        <p class="text-danger numberofchildrenrequired"></p>
                    </div>
                </div><!-- row -->
      </div>
      <div class="modal-footer">
          <p class="text-primary enquireMailSending">Sending mail ... </p>
          <p class="text-success enquireMailSent">Mail sent successfully </p>
          <button type="button" class="btn btn-primary sendEnquireEmail">Send Mail</button>
          <button type="button" class="btn btn-default closeEnquireDialog" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>

<script src="<%= ResolveUrl("~/js/jquery-uiv4.min.js") %>"></script>
<script src="<%= ResolveUrl("~/js/enqureForm.js?v=9") %>"></script>