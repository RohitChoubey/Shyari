<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="Controll.Logic"%>
<%
	
	try {
		String email = "";
		String psw = "";
		if (request.getParameter("username") != null) {
			email = request.getParameter("username");
		}
		if (request.getParameter("password") != null) {
			psw = request.getParameter("password");
		}

		if (email.isEmpty() || psw.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("LogIn.html");
			out.println("<h2 style=color:red;>Please Enter Email adress</h2>");
			req.include(request, response);
			
		} else {
			Connection con = Logic.conn();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user where email=? and psw=?");
			pst.setString(1, email);
			pst.setString(2, psw);
			ResultSet rs = pst.executeQuery();
			RequestDispatcher req = request.getRequestDispatcher("AdminIndex.jsp");
			req.forward(request, response);
			UUID token = UUID.randomUUID();
			if (rs.next()) {
				session.setAttribute("session", "TRUE");
				String name = rs.getString("name");
				session.setAttribute("name", name);
				RequestDispatcher reqs = request.getRequestDispatcher("AdminIndex.jsp");
				reqs.forward(request, response);
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

%>