package com.expensetracker.servlet;

import java.io.IOException;

import com.expensetracker.service.UpdateService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String slno=req.getParameter("slno");
		String category=req.getParameter("category");

		int x=new UpdateService().updateData(slno, category);
		if(x==1) {
			System.out.println("Updated Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("Update.jsp");
			rd.forward(req, res);
			
		}else {
			System.out.println("Not updated");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
