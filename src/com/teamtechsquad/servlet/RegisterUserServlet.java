package com.teamtechsquad.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamtechsquad.dto.RegisterUserFormDTO;
import com.teamtechsquad.service.UserService;
import com.teamtechsquad.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/Registration")
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		RegisterUserFormDTO registerUserFormDTO = new RegisterUserFormDTO();
		registerUserFormDTO.setFirstName(request.getParameter("fname"));
		registerUserFormDTO.setLastName(request.getParameter("lname"));
		registerUserFormDTO.setEmail(request.getParameter("email"));
		registerUserFormDTO.setPassword(request.getParameter("password"));
		registerUserFormDTO.setMobile(request.getParameter("mobile"));
		UserService userService = new UserServiceImpl();
		try {
			
			if(userService.checkUserByEmailOrMobile(registerUserFormDTO.getEmail()) != 0){
				request.setAttribute("notifyRegisterMsg", "Email already exists");
				request.setAttribute("msgType", "danger");
				request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
			}
			
			if(userService.checkUserByEmailOrMobile(registerUserFormDTO.getMobile()) != 0){
				request.setAttribute("notifyRegisterMsg", "Mobile no already exists");
				request.setAttribute("msgType", "danger");
				request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
			}
			
			int isUpdated = userService.registerUser(registerUserFormDTO);
			if (isUpdated > 0) {
				request.setAttribute("loginMsg", "Successfully registered.please do login");
				request.setAttribute("msgType", "success");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				session.setAttribute("loginMsg", "Registration failed due to internal problem");
				request.setAttribute("msgType", "danger");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			session.setAttribute("notifyRegisterMsg", "Registration failed due to internal problem");
			request.setAttribute("msgType", "danger");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
