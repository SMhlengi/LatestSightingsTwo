<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_SiteHeader.ascx.cs" Inherits="Revamp_LatestSightings.uc_SiteHeader" %>

    <script>
        function LogoutFromLatestSightings() {
            $.cookie('lsrm', null, { path: '/' });
            $.cookie('lsusername', null, { path: '/' });
            $.cookie('lspassword', null, { path: '/' });
            console.log("AM DONE LOGGING OUT");
        }
    </script>
	<!-- Header Section -->
		<!-- Header Section -->
		<header>
			<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container">

                    <!-- Profile bar BEGIN -->
                	<div class="profilebar">
                    	<div class="left">
                    				
                            <div class="profile-username"><i class="fa fa-user pro-username" style="padding-right:10px;"></i>
                               <%=username %>

                            </div> 
                            <div class="profilelinks">
                                <a href="#" class="tmq_closeserv Login">Login</a>
                            </div>                       
                    	</div>
                    </div>
                    <!-- Profile bar END -->
                    
					<div class="navbar-header">
					
						<!-- Responsive Menu Trigger -->
						<a id="trigger" href="#" title="Menu"><i class="fa fa-bars"></i></a>
						
						<!-- Website Logo -->
						<a class="navbar-brand" href="/"><img alt="" src='<% = ConfigurationManager.AppSettings["siteUrl"] %>images/logo-horizontal-new.png'></a>
                        
					</div>
                    
                   		<!-- Search Button -->
                        <ul class="navbar-right">
                            <li id="search" data-toggle="popover"><a href="javascript:void(0);" class="top-search" title="Search"><i class="fa fa-search"></i></a></li>
                        </ul>
                        <!-- End Search Button -->
					
					<!-- Main Menu -->
					<nav id="main-menu">
						<div class="menu-container">
							<ul>
								<li class="menu-item"><a href="/">Home</a></li>
                                <li class="menu-item"><a href="/gallery">Galleries</a></li>
                                <li class="menu-item"><a href="/bloglist">Blogs</a></li>
								<li class="menu-item"><a href="/content/live-drive">Live Drive</a></li>
                                <li class="menu-item"><a href="http://latestbookings.com/vacations" target="_blank">Vacations</a></li>
                                <li class="menu-item"><a href="/partnership">Film & Earn</a></li>
								<li class="menu-item"><a href="http://latestsightings.eshop.co.za/" target="_blank">Shop</a></li>
								<li class="menu-item"><a href="/about-us">About Us</a></li>
                                <li class="menu-item"><a href="/contact-us">Contact Us</a></li>
                                <li class="menu-item orange" ><a href="#">Profile</a>                                
                                    <div class="menu-container"> 							
                                        <a class="mp-back" href="#">back</a> 					
                                        <ul> 											
                                            <li class="menu-item"><a href="/financials" class="viewFinancials">View Financials</a></li> 			
                                            <li class="menu-item"><a href="/addmedia" class="uploadVideo">Add Media</a></li>                                                                                        
                                            <li class="menu-item"><a href="/myaccount" class="myAccount">My Account</a></li>        
                                            <%--<li class="menu-item"><a href="#" class="Login">Login</a></li>         --%>                                                                          
                                            <li class="menu-item Logout"><asp:LinkButton ID="logout" runat="server" class="" OnClick="logout_Click" OnClientClick="LogoutFromLatestSightings()">Logout</asp:LinkButton></li>
                                        </ul> 									
                                    </div>                                 
                                </li>


							</ul>
						</div>
					</nav>
					<!-- End Main Menu -->
					
					
				</div>
			</div>
		</header>

<%--			<div class="mp-pusher" id="mp-pusher">

				<!-- mp-menu -->
				<nav id="mp-menu" class="mp-menu">
					<div class="mp-level">
						<h2 class="icon icon-world">All Categories</h2>
						<ul>
                            <li><a href="#">Super Smart Phone</a></li>
                            <li><a href="#">Thin Magic Mobile</a></li>
                            <li><a href="#">Performance Crusher</a></li>
                            <li><a href="#">Futuristic Experience</a></li>
                        </ul>
                    </div>
                </nav>
            </div>--%>
		<!-- End Header -->
    <!-- END Header Section -->
    <script>
        
        var hasUserNameBeenSet = "<%=username %>";
        if (hasUserNameBeenSet != "") {
            $(".viewFinancials").show();
            $(".viewFinancials").attr("href", "/financials");
            $(".Login").hide();
            $(".Logout").show();
            $(".uploadVideo").show();
            $(".uploadVideo").attr("href", "addmedia");
            $(".uploadGalleryImage").show();
            $(".uploadGalleryImage").attr("href", "addImage");
            $(".myAccount").show();
            $(".myAccount").attr("href", "myaccount");
        } else {
            $(".orange").hide();
        }
    </script>