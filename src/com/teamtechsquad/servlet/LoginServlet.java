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
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserServiceImpl();
		HttpSession session = request.getSession(false);
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		LoginDTO loginDTO = new LoginDTO(uname, pwd);
		try {
			Boolean isAuthenticated = userService.authenticateUser(loginDTO);
			if (isAuthenticated == null) {
                request.setAttribute("loginMsg", "User doesn't exist");
            	request.setAttribute("msgType", "danger");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			} else if (isAuthenticated) {
				request.setAttribute("currentPage", "Dashboard");
				session.setAttribute("userInfo", userService.getUserInfoByEmail(uname));
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				return;
			} else {
				request.setAttribute("loginMsg", "Login failed due to invalid credentials");
				request.setAttribute("msgType", "danger");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msgType", "danger");
			request.setAttribute("loginMsg", "Login failed due to internal problem");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		return;
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
