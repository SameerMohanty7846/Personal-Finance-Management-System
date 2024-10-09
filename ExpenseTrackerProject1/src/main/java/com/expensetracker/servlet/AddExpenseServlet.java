package com.expensetracker.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.expensetracker.service.AddExpenseService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddExpenseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw=res.getWriter();
		String category = req.getParameter("expenseType");
		String expenseAmount = req.getParameter("expenseAmount");
		if ((category != null || category != " " || category.length() != 0)
				&& (expenseAmount != null || expenseAmount != " " || expenseAmount.length() != 0)) {
			
			Integer a = Integer.parseInt(expenseAmount);
			int amount = a * (-1);
			String investmenttype = "E";

			AddExpenseService ob = new AddExpenseService();
			int x = ob.addExpense(investmenttype, category, amount);
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
