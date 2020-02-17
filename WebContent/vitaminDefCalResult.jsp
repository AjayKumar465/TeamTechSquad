<%@page import="com.teamtechsquad.dto.VitaminDeficiencyDTO"%>
<%@page import="com.teamtechsquad.dto.DeficiencyDTO"%>
<%@page import="com.teamtechsquad.dto.DeficiencyCategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.teamtechsquad.service.impl.VitaminServiceImpl"%>
<%@page import="com.teamtechsquad.service.VitaminService"%>
<jsp:include page="header.jsp"></jsp:include>
<div class="content">
	<div class="container-fluid">
		<div class="col-md-8 mr-auto ml-auto">
			<div class="row">
				<div class="col-lg-12 col-md-24">
					<div class="card">
						<div class="card-header card-header-text card-header-warning">
							<div class="card-text">
								<h4 class="card-title">What vitamins does your body need?
									Evaluation Result</h4>
							</div>
						</div>
						<div class="card-body">
							<div class="col-sm-10" style="overflow: break-word;">

								<%
								List<VitaminDeficiencyDTO>  vitaminDeficiencies = (List<VitaminDeficiencyDTO>)request.getAttribute("defResult");
								if(vitaminDeficiencies == null){
									request.getRequestDispatcher("vitaminDefCal.jsp").forward(request, response);
								}
								for(VitaminDeficiencyDTO vitaminDeficiency : vitaminDeficiencies){
									%>
								<div class="col-sm-10" style="overflow: break-word;">
									<div>
										<span><b><%=vitaminDeficiency.getVitaminName() %> (<%=vitaminDeficiency.getVitminChemicalName() %>) </b> Deficiency rate:</span>
										<span style="color: red;"> <%for(int i = 0;i<vitaminDeficiency.getDeficiencyPercentage()/20;i++){
										%> <i class="material-icons">star</i> <%
									} %> <%for(int i = 0;i<4-vitaminDeficiency.getDeficiencyPercentage()/20;i++){
										%> <i class="material-icons">star_border</i> <%
									} %>
									</span>
									</div>
								</div>
								<%
								}
								%>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div></div>
		<jsp:include page="footer.jsp"></jsp:include>