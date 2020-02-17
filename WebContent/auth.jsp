<%@page import="com.teamtechsquad.dto.UserInfoDTO"%>
<%UserInfoDTO userInfo = (UserInfoDTO)session.getAttribute("userInfo") ;
if(userInfo == null){
	request.setAttribute("errorMsg", "Please login");
	request.getRequestDispatcher("login.jsp").forward(request, response);
	return;
}

String state = (String)session.getAttribute("currentState");
if(state!= null && state.equalsIgnoreCase("lock")){
	request.setAttribute("errorMsg", "Please unlock");
	request.getRequestDispatcher("lock.jsp").forward(request, response);
	return;
}
%>

