<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="completeProfile.ascx.cs" Inherits="Revamp_LatestSightings.completeProfile" %>

<div class="row">
        <div class="panel transparentBackground">
            <div class="panel-heading">                
                <%if (IsVisible){ %>
                    <br />
                    <p class="text-success">Please complete your profile below</p>
                <%} %>
            </div><!-- panel-heading -->
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-4">
                        <input type="text" id="firstname" name="firstname" placeholder="Firstname" class="form-control" value="<%=firstname %>" >
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="lastname" name="lastname" placeholder="Lastname" class="form-control" value="<%=lastname %>">
                    </div>
                    <div class="form-group col-md-4">
                        <input type="email" id="email" name="email" placeholder="Email" class="form-control" value="<%=email %>">
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="cellnumber" name="cellnumber" placeholder="Cell Number" class="form-control" value="<%=cellnumber %>">
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="telephonenumber" name="telephonenumber" placeholder="Telephone" class="form-control" value="<%=telephone %>" >
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="othercontant" name="othercontant" placeholder="Other Contact" class="form-control" value="<%=othercontact %>">
                    </div>
                    <!-- social network -->
                    <div class="form-group col-md-4">
                        <input type="text" id="facebook" name="facebook" placeholder="Facebook Profile" class="form-control" value="<%=facebook %>">
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="twitter" name="twitter" placeholder="Twitter Handle" class="form-control" value="<%=twitter %>" >
                    </div>
                    <div class="form-group col-md-4">
                        <input type="text" id="skype" name="skype" placeholder="Skype Address" class="form-control" value="<%=skype %>">
                    </div>
                </div><!-- row -->
                <div class="row">
                    <div class="form-group col-md-4">
                        <textarea class="form-control" id="address" rows="5" placeholder="Address"><%=address %></textarea>
                     </div>
                    <div class="form-group col-md-8" style="float:right">
                        <div class="panel transparentBackground">
                          <div class="panel-heading">Enter your South African Banking Details</div>
                          <div class="panel-body" style="position:relative; z-index:400">
                              <div class="row">
                                    <div class="form-group col-md-5">
                                        <select class="form-control" id="bank">
                                            <option selected="selected" value="">Please enter your South African bank details</option>
                                            <option value="Nedbank">Nedbank</option>
                                            <option value="Absa">Absa</option>
                                            <option value="Standard Bank">Standard Bank</option>
                                            <option value="FNB">FNB</option>
                                            <option value="Capitec">Capitec</option>
                                            <option value="Investec">Investec</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <!--cheque details -->
                                        <select class="form-control" id="Accounttype">
                                            <option selected="selected" value="">Account Type</option>
                                            <option value="Cheque">Cheque</option>
                                            <option value="Savings">Savings</option>
                                            <option value="Transmission">Transmission</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </div>
                             </div>
                             <div class="row">
                                 <div class="form-group col-md-5">
                                    <!-- Account number -->
                                    <input type="text" id="accountnumber" name="accountnumber" placeholder="Account Number" value="<%=accountnumber %>" class="form-control"/>

                                 </div>
                                 <div class="form-group col-md-5">
                                    <!-- Branch name -->
                                    <input type="text" id="branchname" name="branchname" placeholder="Branch Name" value="<%=branchname %>" class="form-control"/>
                                 </div>
                             </div>
                            <div class="row">
                                 <div class="form-group col-md-5">
                                    <!-- Branch code -->
                                    <input type="text" id="branchcode" name="branchcode" placeholder="Branch Code" value="<%=branchcode %>" class="form-control"/>
                                 </div>
                            </div>
                                     </div>
                               </div>
                          </div>
                        <div class="form-group col-md-4">
                            <textarea class="form-control" id="payPal" rows="5" placeholder="PayPal Details"><%=paypaldetails %></textarea>
                            <input type="hidden" value="<%=bankdetails %>" id="bankChoosen" />
                            <input type="hidden" value="<%=accounttype %>" id="accountTypeChoose" />
                            </div>
                        </div>
                    </div>
                </div>     

                <div class="row">
                    <div class="form-group col-md-4">
                        <div class="form-group firstname">
                            <p class="text-danger">Firstname is required</p>
                        </div>
                        <div class="form-group lastname">
                            <p class="text-danger">Lastname is required</p>
                        </div>
                        <div class="form-group email">
                            <p class="text-danger">Email is required</p>
                        </div>
                        <div class="form-group cellnumber">
                            <p class="text-danger">Cellphone number is required</p>
                        </div>
                        <div class="form-group telephonenumber">
                            <p class="text-danger">Telephone number is required</p>
                        </div>
                        <div class="form-group othercontant">
                            <p class="text-danger">Other contact is invalid. Example: Option (+) 083 521 7896</p>
                        </div>
                        <div class="form-group address">
                            <p class="text-danger">Address is required</p>
                        </div>
                        <div class="form-group bank">
                            <p class="text-danger">Banking Details is required</p>
                        </div>
                    </div>
                </div>           
            <div class="panel-footer transparentBackground">
                <div class="pull-right saveProfileButton">
                    <a href="javascript:void(0)" class="btn btn-success updateProfile" role="button">Save</a>
                    <!--<button class="btn btn-success updateProfile">Save</button> -->
                </div>
                <div class="pull-left marginLeftTen registerSpinner">
                    <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                </div>
                <div class="alert alert-success marginTopEight pull-right marginLeftTen profileUpdated">
                    <strong>Profile update Successfully</strong><br />You can start adding videos by clicking the [ Add Video ] tab
                </div>
                <div class="alert alert-danger pull-left marginLeftTen profileUpdatedError">
                    <strong>Error in Profile Update</strong><br />Please try again later as we are experiencing technical issues.
                </div>
            </div><!-- panel-footer -->
        </div>

<script src="<%= ResolveUrl("~/js/completeProfile.js?v=12") %>"></script>