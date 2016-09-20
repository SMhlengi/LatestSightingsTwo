<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Revamp_LatestSightings.register" %>

<asp:Content id="register" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Main Container Section -->			
    <div class="container panel-signup">
        <div id="page-content">

            <!-- Page Content Area -->
            <div id="formcontainer">
                <!-- Regsiter -->
            <div class="panel transparentBackground col-md-12 col-sm-12 col-xs-9">
                <div class="panel-body">
                    <h4 class="text-center mb5 col-xs-9 col-md-12 col-sm-12">Welcome to Latest Sightings Contributor App</h4>
                    <p class="text-center mb5 col-xs-9 col-md-12 col-sm-12">Please fill out the registration form below</p>
                    
                    <div class="mb30"></div>
                    
                    <form id="registration" action="signin.html" method="post">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="input-group form-group mb15 col-md-12 col-sm-12 col-xs-8">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" class="form-control" placeholder="First name" id="firstname">
                                </div>
                                <div class="input-group form-group firstname">
                                    <p class="text-danger">First name is required</p>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group form-group mb15 col-md-12 col-sm-12 col-xs-8">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" class="form-control" placeholder="Last name" id="lastname">
                                </div>
                                <div class="input-group form-group lastname">
                                    <p class="text-danger">Last name is required</p>
                                </div>
                            </div>
                        <br />
                            <div class="col-sm-12">
                                <div class="input-group form-group mb15 col-md-12 col-sm-12 col-xs-8">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <input type="email" class="form-control" placeholder="Email address" id="email">
                                </div>
                                <div class="input-group form-group email">
                                    <p class="text-danger">Email address is required</p>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group form-group mb15 col-md-12 col-sm-12 col-xs-8">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" class="form-control" placeholder="Password" id="password">
                                </div>
                                <div class="input-group form-group password">
                                    <p class="text-danger">Password is required</p>
                                </div>
                            </div>
                        </div><!-- row -->
                        <br />
                        <div class="clearfix">
                            <div class="row">
                                <div class="col-sm-12 col-xs-9">
                                    <div class="pull-left">
                                        <button type="button" class="btn btn-success submitRegistration">Register <i class="fa fa-angle-right ml5"></i></button>
                                    </div>
                                    <div class="pull-left marginRightTen registerSpinner">
                                        <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                                    </div>
                                </div>
                            </div>
                            <div class="row successfullyRegistered">
                                <div class="col-sm-12 col-xs-9">
                                    <div class="alert alert-success">                                    
                                        <strong>Well done! You have successfully registered.</strong> Logging you in
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                </div><!-- panel-body -->
            </div>

                <!-- end of register -->

                <div class="row">
                </div>
            </div>
        </div>
    </div>


</asp:Content>