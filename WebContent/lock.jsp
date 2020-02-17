<%@page import="com.teamtechsquad.dto.UserInfoDTO"%>
<jsp:include page="common.jsp"></jsp:include>

<div class="wrapper wrapper-full-page">
	<div class="page-header lock-page header-filter"
		style="background-image: url('assets/img/login.jpg'); background-size: cover; background-position: top center;">
		<!--   you can change the color of the filter page using: data-color="blue | green | orange | red | purple" -->

		<div class="container">
			<div class="col-md-4 ml-auto mr-auto">
<%



			
UserInfoDTO userInfo = (UserInfoDTO)session.getAttribute("userInfo") ;
if(userInfo == null){
	
	request.setAttribute("errorMsg", "Please login");
	request.getRequestDispatcher("login.jsp").forward(request, response);
}else{
	session.setAttribute("currentState", "lock");
}



%>



<%
				String errorMsg = (String) request.getAttribute("errorMsg");

				if (errorMsg != null) {
			%>
			<script type="text/javascript">
				    $(document).ready(function () {
					
					demo.showNotification("top","right","danger","<%=errorMsg%>",3534);
				    });
				    </script>
			<%
				}%>
				<form action="unlock" method="post">
					<div class="card card-profile text-center card-hidden">

						<div class="card-header ">
							<div class="card-avatar">
								<a href="#pablo"> <img class="img"
									src="assets/img/faces/avatar.png">
								</a>
							</div>
							<h4 class="card-title"><%=userInfo.getFirstName()  %>
								<%=userInfo.getLastName() == null ?"":userInfo.getLastName() %></h4>

						</div>
						<div class="card-body ">
							<%-- <span style="color: red"><%=request.getAttribute("errorMsg")==null ?"":request.getAttribute("errorMsg") %></span> --%>
							<div class="form-group">
							<input type="hidden" name="uname" value="<%=userInfo.getEmail() %>" class="form-control"
									id="exampleInput1">
								<label for="exampleInput1" class="bmd-label-floating">Enter
									Password</label> <input type="password" name="pwd" class="form-control"
									id="exampleInput1" required="true">
							</div>
						</div>

						<div class="card-footer justify-content-center">
							<a href="#pablo" class="btn btn-rose btn-round">Unlock</a>
						</div>

					</div>
				</form>

			</div>
		</div>
	</div>