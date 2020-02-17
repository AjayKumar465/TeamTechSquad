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
@WebServlet("/forgotpassword")
public class ForgotPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
	
		String email = request.getParameter("email");
		
		UserService userService = new UserServiceImpl();
		try {
			
			if(userService.checkUserByEmailOrMobile(email) == 0){
				request.setAttribute("notifyForgotPwdMsg", "Email Id you entered is Invalid. Please try again.");
				request.setAttribute("msgType", "danger");
				request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
				return;
			}
			
			if(userService.forgotPwd(email)>0){
				request.setAttribute("loginMsg", "Password is emailed successfully.");
				request.setAttribute("msgType", "success");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
			
		} catch (Exception e) {
			request.setAttribute("notifyForgotPwdMsg", "Sorry! Due to internal problem your request has failed. Please try again.");
			request.setAttribute("msgType", "danger");
			request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
			return;
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
