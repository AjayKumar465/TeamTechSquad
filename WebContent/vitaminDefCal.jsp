<%@page import="com.teamtechsquad.dto.DeficiencyDTO"%>
<%@page import="com.teamtechsquad.dto.DeficiencyCategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.teamtechsquad.service.impl.VitaminServiceImpl"%>
<%@page import="com.teamtechsquad.service.VitaminService"%>
<jsp:include page="header.jsp"></jsp:include>
<%
VitaminService vitaminService = new VitaminServiceImpl();
List<DeficiencyCategoryDTO> deficiencyCategories = vitaminService.getDeficiencyCategories();
request.setAttribute("currentPage", "Vitamin Deficiency Calculator");
%>
<div class="content">
	<div class="container-fluid">
		<div class="col-md-8 mr-auto ml-auto">
			<!--      Wizard container        -->
			<div class="wizard-container">
				<div class="card card-wizard" data-color="rose" id="wizardProfile"
					style="width: 123%; margin-left: -85px;">
					<form action="vitaminDeficiencyCalculator" method="post">
						<!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
						<div class="card-header text-center">
							<h3 class="card-title">What vitamins does your body need?</h3>
							<h5 class="card-description">Evaluation</h5>
						</div>
						<div class="wizard-navigation">
							<ul class="nav nav-pills">
								<%
									for (DeficiencyCategoryDTO defCategory : deficiencyCategories) {
								if(defCategory.getDefCatId() ==1){
									%>
								<li class="nav-item active"><a class="nav-link"
									href="#<%=defCategory.getDeficiencyCatName() %>"
									data-toggle="tab" role="tab"> <%=defCategory.getDeficiencyCatName() %>
								</a></li>

								<%
								}else{
									%>
								<li class="nav-item"><a class="nav-link"
									href="#<%=defCategory.getDeficiencyCatName() %>"
									data-toggle="tab" role="tab"> <%=defCategory.getDeficiencyCatName() %>
								</a></li>

								<%
								}
								%>
								<%
									}
								%>

							</ul>
						</div>
						<div class="card-body" style="margin-right: 36px">
							<div class="tab-content">
								<%
									for (DeficiencyCategoryDTO defCategory : deficiencyCategories) {
										if(defCategory.getDefCatId() ==1){
								%>
								<div class="tab-pane active"
									id="<%=defCategory.getDeficiencyCatName()%>">
									<%
									}else{
								%>
									<div class="tab-pane"
										id="<%=defCategory.getDeficiencyCatName()%>">

										<%
									}
										%>
										<div class="row justify-content-center">
											<div >
												<%
									List<DeficiencyDTO> deficiencies = defCategory.getDeficiencies();
									for(DeficiencyDTO deficiency : deficiencies){
										%>

												<div class="form-check form-check-inline"
													style="margin-top: 30px; margin-left: 100px;width: 300px">
													<label class="form-check-label"> <input
														class="form-check-input" type="checkbox"
														name="deficiencies" value="<%=deficiency.getDefId()%>">
														<%=deficiency.getDeficiencyName() %> <span
														class="form-check-sign"> <span class="check"></span>
													</span>
													</label>
												</div>
												<%
									}
									%>
											</div>
										</div>
									</div>
									<%	
										
									}
								%>
								</div>
							</div>
							<div class="card-footer">
								<div class="mr-auto">
									<input type="button"
										class="btn btn-previous btn-fill btn-default btn-wd disabled"
										name="previous" value="Previous">
								</div>
								<div class="ml-auto">
									<input type="button"
										class="btn btn-next btn-fill btn-rose btn-wd" name="next"
										value="Next"> <input type="submit"
										class="btn btn-finish btn-fill btn-rose btn-wd" name="finish"
										value="Finish" style="display: none;">
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</form>
				</div>

			</div>
			<!-- wizard container -->
		</div>
	</div>
</div>

