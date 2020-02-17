<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import=" java.util.UUID"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	try {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username.isEmpty() || password.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;>Please Enter Username and Password</h2>");
		} 
		else if (username.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;>Please Enter Username</h2>");
		} 
		else if (password.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;>Please Enter password</h2>");
		} 
		else if (username.equals("admin") && password.equals("admin@123")) {
			//session.setAttribute("session",UUID.randomUUID().toString().getBytes("UTF-8")); 
			session.setAttribute("session", "TRUE");
			RequestDispatcher req = request.getRequestDispatcher("/LogIn.jsp");
			req.include(request, response);

		} 
		else {
			//out.println("Data is successfully inserted!");
			RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;>Please Enter Correct Username and Password</h2>");

		}
	} catch (Exception e) {
		RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
		req.include(request, response);
	}
%>
