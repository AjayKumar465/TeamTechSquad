package com.teamtechsquad.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamtechsquad.dto.LoginDTO;
import com.teamtechsquad.service.UserService;
import com.teamtechsquad.service.impl.UserServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/unlock")
public class UnlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserServiceImpl();
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		LoginDTO loginDTO = new LoginDTO(uname, pwd);
		try {
			Boolean isAuthenticated = userService.authenticateUser(loginDTO);
			if (isAuthenticated !=null && isAuthenticated) {
				request.getSession().removeAttribute("currentState");
				request.setAttribute("currentPage", "Dashboard");
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
			} else {
				request.setAttribute("errorMsg", "Unlock failed due to invalid credentials");
				request.getRequestDispatcher("lock.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "Unlock failed due to internal problem");
			request.getRequestDispatcher("lock.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
