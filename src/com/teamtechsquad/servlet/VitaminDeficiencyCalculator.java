package com.teamtechsquad.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamtechsquad.dto.VitaminDeficiencyDTO;
import com.teamtechsquad.service.VitaminService;
import com.teamtechsquad.service.impl.VitaminServiceImpl;

/**
 * Servlet implementation class VitaminDeficiencyCalculator
 */
@WebServlet("/vitaminDeficiencyCalculator")
public class VitaminDeficiencyCalculator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] defIds= request.getParameterValues("deficiencies");
		VitaminService vitaminService = new VitaminServiceImpl();
		try {
			List<VitaminDeficiencyDTO>  vitaminDeficiencies = vitaminService.calculateVitaminDeficiency(Arrays.asList(defIds));
			request.setAttribute("defResult", vitaminDeficiencies);
			request.setAttribute("currentPage", "Deficiency Result");
			request.getRequestDispatcher("vitaminDefCalResult.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
