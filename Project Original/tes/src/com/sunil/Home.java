package com.sunil;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Home extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id;
		String regNo;
		String name;
		String mark1;
		String mark2;
		String degree;
		String mobNo;
		String mailId;
		
		id=request.getParameter("id");
		regNo=request.getParameter("regno");
		name=request.getParameter("name");
		mark1=request.getParameter("mark1");
		mark2=request.getParameter("mark2");
		degree=request.getParameter("degree");
		mobNo=request.getParameter("mobNo");
		mailId=request.getParameter("mail");
		HttpSession session=request.getSession(true);
		try {
			SaveStudentControl ctrl = new SaveStudentControl();
	 		ctrl.addNewStudent(id,regNo,name,mark1,mark2,degree,mobNo,mailId);
	 		response.sendRedirect("Success");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
	
	 
	}
}