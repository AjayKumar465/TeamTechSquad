package com.teamtechsquad.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamtechsquad.dto.RegisterUserFormDTO;
import com.teamtechsquad.dto.UserInfoDTO;
import com.teamtechsquad.service.UserService;
import com.teamtechsquad.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		HttpSession session = request.getSession();
		UserInfoDTO unserInfo = new UserInfoDTO();
		unserInfo.setUserId(Integer.valueOf(request.getParameter("uid")));
		unserInfo.setFirstName(request.getParameter("fname"));
		unserInfo.setLastName(request.getParameter("lname"));
		unserInfo.setEmail(request.getParameter("email"));
		unserInfo.setMobile(request.getParameter("mobile"));
		UserService userService = new UserServiceImpl();
		
		int isUpdated = 0;
		UserInfoDTO userdetails = (UserInfoDTO)session.getAttribute("userInfo");
	
			
			if(!userdetails.getEmail().equalsIgnoreCase(unserInfo.getEmail()))
			if(userService.checkUserByEmailOrMobile(unserInfo.getEmail()) != 0){
				request.setAttribute("notifyUpdateFailed", "Email already exists");
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				return;
			}
			
			if(!userdetails.getMobile().equalsIgnoreCase(unserInfo.getMobile()))
			if(userService.checkUserByEmailOrMobile(unserInfo.getMobile()) != 0){
				request.setAttribute("notifyUpdateFailed", "Mobile no already exists");
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				return;
			}
			
			isUpdated = userService.updateProfile(unserInfo);
			
		if (isUpdated > 0) {
			request.setAttribute("notifyUpdateSucceded", "Successfully Updated");
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
			return;
		} else {
			session.setAttribute("notifyUpdateFailed", "Updation failed due to internal problem");
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
			return;
		}
		
	}catch (Exception e) {
			request.setAttribute("notifyUpdateFailed", "Updation failed due to internal problem");
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
			e.printStackTrace();
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
