<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="auth.jsp"></jsp:include>
<jsp:include page="common.jsp"></jsp:include>
<%@page import="com.teamtechsquad.dto.UserInfoDTO"%>
</head>


<body class="">
<div  class="se-pre-con"></div>
	<div class="wrapper">
		<div class="sidebar" data-color="rose" data-background-color="black"
			data-image="assets/img/sidebar-1.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
        Tip 2: you can also add an image using data-image tag
    -->

			<div class="logo">
			<!--  <a href="#" class="simple-text logo-mini">
             N
        </a>

        <a href="#" class="simple-text logo-normal">
             Nutrient's On a Click
        </a> -->
			</div>
			<%UserInfoDTO userdetails = (UserInfoDTO)session.getAttribute("userInfo") ;%>
			<div class="sidebar-wrapper">
				<div class="user">
					<div class="photo">
						<img src="assets/img/faces/avatar.png" />
					</div>
					<div class="user-info">
						<a data-toggle="collapse" href="#collapseExample" class="username">
							<span> <%=userdetails.getFirstName() %> <%=userdetails.getLastName() %>
								<b class="caret"></b>
						</span>
						</a>
						<div class="collapse" id="collapseExample">
							<ul class="nav">
								<li class="nav-item"><a class="nav-link"
									data-toggle="modal" data-target="#viewProfile"> <span
										class="sidebar-mini"> MP </span> <span class="sidebar-normal">
											My Profile </span>
								</a></li>
								<li class="nav-item"><a class="nav-link"
									data-toggle="modal" data-target="#editProfile"> <span
										class="sidebar-mini"> EP </span> <span class="sidebar-normal">
											Edit Profile </span>
								</a></li>
								<li class="nav-item"><a class="nav-link"
									data-toggle="modal" data-target="#changePassword"> <span
										class="sidebar-mini"> CP </span> <span class="sidebar-normal">
											Change password </span>
								</a></li>

							</ul>
						</div>
					</div>
				</div>
				<ul class="nav">

					<li class="nav-item"><a class="nav-link" href="dashboard.jsp">
							<i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="vitaminDefCal.jsp"> <i class="material-icons">add_to_photos</i>
							<p>Vitamin Deficiency Calculator</p>
					</a> </a></li>

					<!-- <li class="nav-item "><a class="nav-link" href="uvIndCal.jsp">
							<i class="material-icons">invert_colors </i>
							<p>UVIndex Calculator</p>
					</a></li> -->
					<li class="nav-item "><a class="nav-link"
						href="vitaminDCal.jsp"> <i class="material-icons">accessibility
						</i>
							<p>Vitamin D Calculator</p>
					</a></li>

					<li class="nav-item "><a class="nav-link" href="lock.jsp">
							<i class="material-icons">lock_outline </i>
							<p>Lock Screen</p>
					</a></li>

				</ul>
			</div>
		</div>


		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-minimize">
							<button id="minimizeSidebar"
								class="btn btn-just-icon btn-white btn-fab btn-round">
								<i
									class="material-icons text_align-center visible-on-sidebar-regular">more_vert</i>
								<i
									class="material-icons design_bullet-list-67 visible-on-sidebar-mini">view_list</i>
							</button>
						</div>
						<a class="navbar-brand" href="#pablo"> <%-- <%= request.getAttribute("currentPage") %> --%>
						</a>
					</div>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-controls="navigation-index"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>

					<div class="collapse navbar-collapse justify-content-end">
						<form class="navbar-form">
							<div class="input-group no-border">
								<!--   <input type="text" value="" class="form-control" placeholder="Search...">
              <button type="submit" class="btn btn-white btn-round btn-just-icon">
                <i class="material-icons">search</i>
                <div class="ripple-container"></div>
              </button> -->
								<a class="dropdown-item" href="logout"> <i
									class="material-icons">power_settings_new</i>Logout
								</a>
							</div>
						</form>

						<ul class="navbar-nav">
							<!-- <li class="nav-item">
					<a class="nav-link" href="#pablo">
            <i class="material-icons">dashboard</i>
						<p>
             
            </p>
					</a>
				</li> -->
							<!-- <li class="nav-item dropdown">
					<a class="nav-link" href="https://creative-tim.com/" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="material-icons">person</i>
						<p>
							<span class="d-lg-none d-md-block">Some Actions<b class="caret"></b></span>
						</p>
					</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#"><i class="material-icons">face</i>Profile</a>
					</div>
				</li> -->
						</ul>
					</div>
				</div>
			</nav>

			<%
				String notifyUpdateSucceded = (String) request.getAttribute("notifyUpdateSucceded");

				if (notifyUpdateSucceded != null) {
			%>
			<script type="text/javascript">
				    $(document).ready(function () {
					
					demo.showNotification("top","right","success","<%=notifyUpdateSucceded%>",3534);
				    });
				    </script>
			<%
				}

				String notifyUpdateFailed = (String) request.getAttribute("notifyUpdateFailed");
				if (notifyUpdateFailed != null) {
			%>
			<script type="text/javascript">
    $(document).ready(function () {
	$('#editProfile').modal('show');
	demo.showNotification("top","right","danger","<%=notifyUpdateFailed%>
				", 3534);
						});
			</script>
			<%
				}
			%>
			<%
				String notifyChangePassword = (String) request.getAttribute("notifyChangePassword");

				if (notifyChangePassword != null) {
			%>
			<script type="text/javascript">
				    $(document).ready(function () {
					
					demo.showNotification("top","right","success","<%=notifyChangePassword%>",3534);
				    });
				    </script>
			<%
				}

				String notifyChangePasswordFailed = (String) request.getAttribute("notifyChangePasswordFailed");
				if (notifyChangePasswordFailed != null) {
			%>
			<script type="text/javascript">
    $(document).ready(function () {
	$('#changePassword').modal('show');
	demo.showNotification("top","right","danger","<%=notifyChangePasswordFailed%>", 3534);
						});
			</script>
			<%
				}	
			%>

			<div class="modal fade" id="editProfile" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				style="margin-left: 12%">
				<div class="modal-dialog">
					<div class="modal-content">
						<form method="post" id="RegisterValidation2" action="updateProfile">
							<div class="card ">
								<div class="card-header card-header-rose card-header-icon">
									<div class="card-icon">
										<i class="material-icons">account_circle</i>
									</div>
									<h4 class="card-title">Edit Profile</h4>
								</div>
								<div class="card-body ">
									<div class="form-group">
										<label for="FirstName" class="bmd-label-floating">
											First Name *</label> <input type="hidden" class="form-control"
											value="<%=userdetails.getUserId() %>" name="uid">
										<input type="text" class="form-control" id="fname"
											value="<%=userdetails.getFirstName() %>" name="fname"
											required="true">
									</div>
									<div class="form-group">
										<label for="LastName" class="bmd-label-floating">
											Last Name </label> <input type="text" class="form-control" id="lname"
											value="<%=userdetails.getLastName() %>" name="lname">
									</div>
									<div class="form-group">
										<label for="Mobile" class="bmd-label-floating">
											Mobile *</label> <input type="number" class="form-control"
											id="mobile" name="mobile"
											value="<%=userdetails.getMobile() %>" required="true">
									</div>
									<div class="form-group">
										<label for="Email" class="bmd-label-floating">
											Email Address *</label> <input type="email" class="form-control"
											id="email" value="<%=userdetails.getEmail() %>" name="email"
											required="true">
									</div>

									<div class="category form-category">* Required fields</div>
								</div>

							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-rose btn-link btn-lg"
									value="Update" />
								<button type="button" class="btn btn-danger btn-link btn-lg"
									data-dismiss="modal">Cancel</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<div class="modal fade" id="changePassword" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
				style="margin-left: 12%">
				<div class="modal-dialog">
					<div class="modal-content">
						<form method="post" id="RegisterValidation" action="changePassword">
							<div class="card ">
								<div class="card-header card-header-rose card-header-icon">
									<div class="card-icon">
										<i class="material-icons">lock_outline</i>
									</div>
									<h4 class="card-title">Change Password</h4>
								</div>
								<div class="card-body ">

									<div class="form-group">
										<input type="hidden" class="form-control" 
											value="<%=userdetails.getEmail() %>" name="email"
											required="true">
									</div>

									<div class="form-group">
										<label for="examplePassword" class="bmd-label-floating">Old
											Password *</label> <input type="password" class="form-control"
											id="oldPassword" name="oldPassword" required="true">
									</div>
									<div class="form-group">
										<label for="examplePassword" class="bmd-label-floating">
											Password *</label> <input type="password" class="form-control"
											id="password" name="password" required="true" name="password">
									</div>
									<div class="form-group">
										<label for="examplePassword1" class="bmd-label-floating">
											Confirm Password *</label> <input type="password"
											class="form-control" id="password1" required="true"
											equalTo="#password" name="password_confirmation">
									</div>
									<div class="category form-category">* Required fields</div>
								</div>

							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-rose btn-link btn-lg"
									value="Change" />
								<button type="button" class="btn btn-danger btn-link btn-lg"
									data-dismiss="modal">Cancel</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<div class="modal fade" id="viewProfile" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				style="margin-left: 12%">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="card card-profile text-center card-hidden">
							<div class="card-header ">
								<div class="card-avatar">
									<a href="#pablo"> <img class="img"
										src="assets/img/faces/avatar.png">
									</a>
								</div>
								<h4 class="card-title"></h4>
							</div>

							<div class="card-body">
								<div align="center" style="margin-left: 119px">

									<div class="row">
										<label for="firstName" class="col-md-4"> First Name :</label>
										<%=userdetails.getFirstName() %>
									</div>
									<div class="row">
										<label for="LastName" class="col-md-4"> Last Name :</label><%=userdetails.getLastName() %>
									</div>
									<div class="row">
										<label for="Mobile" class="col-md-4"> Mobile :</label>
										<%=userdetails.getMobile() %>
									</div>
									<div class="row">
										<label for="Email" class="col-md-4"> Email Address :</label>
										<%=userdetails.getEmail() %>
									</div>
								</div>


							</div>
						</div>

						<div class="modal-footer">
							<!-- 	<input type="submit" class="btn btn-rose btn-link btn-lg"
									value="Update" /> -->
							<button type="button" class="btn btn-danger btn-link btn-lg"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
    $(document).ready(function () {
        var url = window.location;
        $('ul.nav a[href="'+ url +'"]').parent().addClass('active');
        $('ul.nav a').filter(function() {
             return this.href == url;
        }).parent().addClass('active');
    });
</script>