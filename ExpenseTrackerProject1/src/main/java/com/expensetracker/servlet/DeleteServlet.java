package com.expensetracker.servlet;

import java.io.IOException;

import com.expensetracker.service.DeleteService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String slno=req.getParameter("slno");
		

		int x=new DeleteService().deleteData(slno);
		if(x==1) {
			System.out.println("Updated Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("deleteInvestment.jsp");
			rd.forward(req, res);
			
		}else {
			System.out.println("Not DELETED");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
