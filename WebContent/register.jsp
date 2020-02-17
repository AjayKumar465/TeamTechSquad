<!doctype html>
<html lang="en">
<%@page import="com.teamtechsquad.dto.UserInfoDTO"%>
<%UserInfoDTO userInfo = (UserInfoDTO)session.getAttribute("userInfo") ;
if(userInfo != null){
	request.getRequestDispatcher("dashboard.jsp").forward(request, response);
}

String state = (String)session.getAttribute("currentState");
if(state!= null && state.equalsIgnoreCase("lock")){
	request.setAttribute("errorMsg", "Please unlock");
	request.getRequestDispatcher("lock.jsp").forward(request, response);
}
%>

<head>
<title>Registration</title>
	<jsp:include page="common.jsp"></jsp:include>
</head>

<body class="off-canvas-sidebar register-page" style="background-image: url('assets/img/login.jpg'); background-size: cover; background-position: top center;">
    <!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-primary navbar-transparent navbar-absolute" color-on-scroll="500">
	<div class="container">
    <div class="navbar-wrapper">
	        <a class="navbar-brand" href="#pablo">Nutrient's On a Click</a>
		</div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
      <span class="sr-only">Toggle navigation</span>
      <span class="navbar-toggler-icon icon-bar"></span>
      <span class="navbar-toggler-icon icon-bar"></span>
      <span class="navbar-toggler-icon icon-bar"></span>
    </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbar">
           <ul class="navbar-nav">
					<li class="nav-item  active"><a href="register.jsp" class="nav-link">
							<i class="material-icons">person_add</i> Register
					</a></li>
					<li class="nav-item"><a href="login.jsp"
						class="nav-link"> <i class="material-icons">fingerprint</i>
							Login
					</a></li>
				</ul>
        </div>
	</div>
</nav>
<!-- End Navbar -->
<%
String notifyRegisterMsg = (String)request.getAttribute("notifyRegisterMsg");
if(notifyRegisterMsg != null){
%>

<script>

$(function(){
    demo.showNotification("top","right","<%=request.getAttribute("msgType")%>","<%=notifyRegisterMsg%>",5000);
});
</script>
<%
}
%>

    <div class="wrapper wrapper-full-page" >
       <div class="page-header login-page">
  <div class="container">
  
           		<div class="col-md-4 col-sm-6 ml-auto mr-auto">
          <form method="post" id="RegisterValidation" action="Registration">
          <div class="card ">
            <div class="card-header card-header-rose card-header-icon">
              <div class="card-icon">
                <i class="material-icons">mail_outline</i>
              </div>
              <h4 class="card-title">Register Form</h4>
            </div>
            <div class="card-body ">
            <div class="form-group">
                <label for="exampleEmail" class="bmd-label-floating"> First Name *</label>
                <input type="text" class="form-control" id="fname"  name="fname" required="true">
              </div>
            <div class="form-group">
                <label for="exampleEmail" class="bmd-label-floating"> Last Name </label>
                <input type="text" class="form-control" id="lname"  name="lname">
              </div>
              <div class="form-group">
                <label for="exampleEmail" class="bmd-label-floating"> Mobile *</label>
                <input type="number" class="form-control" id="mobile"  name="mobile"  required="true">
              </div>
              <div class="form-group">
                <label for="exampleEmail" class="bmd-label-floating"> Email Address *</label>
                <input type="email" class="form-control" id="email"  name="email" required="true">
              </div>
              <div class="form-group">
                <label for="examplePassword" class="bmd-label-floating"> Password *</label>
                <input type="password" class="form-control" id="password" name="password" required="true" name="password">
              </div>
              <div class="form-group">
                <label for="examplePassword1" class="bmd-label-floating"> Confirm Password *</label>
                <input type="password" class="form-control" id="password1" required="true" equalTo="#password" name="password_confirmation">
              </div>
              <div class="category form-category">* Required fields</div>
            </div>
            <div class="card-footer text-right">
              <button type="submit" class="btn btn-rose">Register</button>
            </div>
          </div>
        </form>
              </div>
                </div>
        </div>
    <footer class="footer ">
</footer>

</div>

    </div>

</body>
</html>
