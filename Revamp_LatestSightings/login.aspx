<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Revamp_LatestSightings.login" %>

<asp:Content ID="loginpage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Main Container Section -->			
    <div class="container  panel-signin">
        <div id="page-content">

            <!-- Page Content Area -->
            <div id="formcontainer">

                <div class="row">
                    <div class="panel transparentBackground  col-md-12 col-sm-12 col-xs-10">
                        <div class="panel-body">
<%--                            <div class="logo text-center">
                                <img src="<%=ResolveUrl("~/images/latestsightings.png")%>" alt="Chain Logo" >
                            </div>
                            <br />--%>
                            <h4 class="text-center mb5">Already a Member?</h4>
                            <p class="text-center">Sign in to your account</p>
                    
                            <div class="mb30"></div>
                    
                            <form action="signin.html" method="post" id="login">
                                <div class="input-group form-group mb15 col-md-12 col-sm-12 col-xs-10">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="email" class="form-control" placeholder="Email Address" id="email">
                                </div>
                                <div class="input-group form-group email">
                                    <p class="text-danger">Email is required</p>
                                </div>
                                <div class="input-group form-group mb15 col-md-12 col-sm-12 col-xs-10">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" class="form-control" placeholder="Password" id="password">
                                </div>
                                <div class="input-group form-group password">
                                    <p class="text-danger">Password is required</p>
                                </div>
                        
                                <div class="clearfix">
                                    <div class="row">
                                        <div class="pull-left">
                                            <div class="ckbox ckbox-primary mt10">
                                                <input type="checkbox" id="rememberMe">
                                                <label for="rememberMe">Remember Me</label>
                                            </div>
                                        </div>
                                        <div class="pull-right">
                                            <button type="button" class="btn btn-success submitLogin">Sign In <i class="fa fa-angle-right ml5"></i></button>
                                        </div>
                                        <div class="pull-right marginRightTen registerSpinner">
                                            <img src="<%=ResolveUrl("~/images/loading.gif")%>" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <a href="/forgottenPassword.aspx">Forgot your Password?</a>
                                        </div>
                                    </div>  
                                    <div class="row successfullyLoggedIn">
                                        <div class="col-sm-12">
                                            <div class="alert alert-success welcomeBackMessage">                                    
                                                Howzit <strong id="userFullname"></strong><br />Logging you in .....
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row invalidCredentials">
                                        <div class="col-sm-12">
                                            <div class="alert alert-danger invalidMessage">                                    
                                                <strong>Invalid Credentials</strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>                  
                            </form>
                    
                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            <a href="/register" class="btn btn-primary btn-block">Not yet a Member?<br><strong>Create Account Now</strong></a>
                        </div><!-- panel-footer -->
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>