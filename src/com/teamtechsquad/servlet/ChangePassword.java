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
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String oldPwd  = request.getParameter("oldPassword");
		UserService userService = new UserServiceImpl();
		
		
			
			if(userService.isValidPwd(oldPwd, email)){
				if(userService.isNewAndOldPwdSame(pwd, oldPwd)){
					request.setAttribute("notifyChangePasswordFailed", "New password and old password should not be same");;
					request.getRequestDispatcher("dashboard.jsp").forward(request, response);
					return;	
				}
				
				if(userService.changePassword(email, pwd)>0){
					request.setAttribute("notifyChangePassword", "Password is changed successfully");;
					request.getRequestDispatcher("dashboard.jsp").forward(request, response);
					return;	
				}else{
					request.setAttribute("notifyChangePasswordFailed", "Change password request has failed due to internal problem.");;
					request.getRequestDispatcher("dashboard.jsp").forward(request, response);
					return;	
				}
				
			}else{
				request.setAttribute("notifyChangePasswordFailed", "Incorrect old password");
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
