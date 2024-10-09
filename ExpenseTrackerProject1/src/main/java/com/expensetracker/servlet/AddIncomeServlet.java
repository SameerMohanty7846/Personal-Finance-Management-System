package com.expensetracker.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import com.expensetracker.service.AddIncomeService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddIncomeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();

		String category = req.getParameter("incomeType");
		String incomeAmount = req.getParameter("incomeAmount");
		if ((category != null || category != " " || category.length() != 0)
				&& (incomeAmount != null || incomeAmount != " " || incomeAmount.length() != 0)) {
			

				Integer a = Integer.parseInt(incomeAmount);
				int amount = a;
				String investmenttype = "I";

				AddIncomeService ob = new AddIncomeService();
				int x = ob.addIncome(investmenttype, category, amount);
				if (x != 0) {
					RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
					rd.forward(req, res);
				}

			}else {
				pw.println("<p>Don't refresr</p>");

			}
				

		}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
