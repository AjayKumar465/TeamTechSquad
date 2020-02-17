<!doctype html>
<html lang="en">
<%@page import="com.teamtechsquad.dto.UserInfoDTO"%>
<head>
<jsp:include page="common.jsp"></jsp:include>
<%@page import="com.teamtechsquad.dto.UserInfoDTO"%>
<%UserInfoDTO userInfo = (UserInfoDTO)session.getAttribute("userInfo") ;
if(userInfo != null){
	request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	return;
}
String state = (String)session.getAttribute("currentState");
if(state!= null && state.equalsIgnoreCase("lock")){
	request.setAttribute("errorMsg", "Please unlock");
	request.getRequestDispatcher("lock.jsp").forward(request, response);
	return;
}else{
	
}


%>
<style>

.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(assets/img/loading.gif) center no-repeat #fff;
}
</style>
<title>Forgot password</title>
</head>
<body class="off-canvas-sidebar login-page" style="background-image: url('assets/img/login.jpg'); background-size: cover; background-position: top center;">
	<!-- Navbar -->
	<div  class="se-pre-con"></div>
	<nav
		class="navbar navbar-expand-lg bg-primary navbar-transparent navbar-absolute"
		color-on-scroll="500">
		<div class="container">
			<div class="navbar-wrapper">
				<a class="navbar-brand" href="#pablo">Nutrient's On a Click</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navigation" aria-controls="navigation-index"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="sr-only">Toggle navigation</span> <span
					class="navbar-toggler-icon icon-bar"></span> <span
					class="navbar-toggler-icon icon-bar"></span> <span
					class="navbar-toggler-icon icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbar">
				<ul class="navbar-nav">
					<li class="nav-item "><a href="register.jsp" class="nav-link">
							<i class="material-icons">person_add</i> Register
					</a></li>
					<li class="nav-item  active "><a href="login.jsp"
						class="nav-link"> <i class="material-icons">fingerprint</i>
							Login
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
<%
String notifyForgotPwdMsg = (String)request.getAttribute("notifyForgotPwdMsg");
if(notifyForgotPwdMsg != null){
%>

<script>

$(function(){
    demo.showNotification("top","right","<%=request.getAttribute("msgType")%>","<%=notifyForgotPwdMsg%>",1000);
});
</script>
<%
}
%>

	<div class="wrapper wrapper-full-page">

		<div class="page-header login-page" >
		<!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->

			<div class="container">
				<div class="col-md-4 col-sm-6 ml-auto mr-auto">
					<form class="form" method="post" action="forgotpassword">
						<div class="card card-login card-hidden">
							<div class="card-header card-header-rose text-center">
								<h4 class="card-title">Forgot password</h4>
							
							</div>
							<div class="card-body ">
								<span class="bmd-form-group">
								</span> 	<h5 style="color:red"><%=request.getAttribute("successMsg")==null ?"":request.getAttribute("successMsg") %><%=request.getAttribute("errorMsg")==null ?"":request.getAttribute("errorMsg") %></h5><span class="bmd-form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="material-icons">email</i>
											</span>
										</div>
										<input type="email" name="email" class="form-control"
											placeholder="Email..." required="true">
									</div>
								</span> 
							</div>
							<div class="card-footer justify-content-center">
								<input type="submit" class="btn btn-rose btn-link btn-lg" value="Submit"  id="fgp">
									
							</div>
							
						</div>
					</form>
				</div>
			</div>
			<footer class="footer ">



			</footer>


		</div>

	</div>

</body>
</html>

<script>

//Wait for window load
$(function(){
	// Animate loader off screen
	$(".se-pre-con").fadeOut("slow");;
});

$("#fgp").click(function(){
	$(".se-pre-con").fadeIn("slow");
});
</script>