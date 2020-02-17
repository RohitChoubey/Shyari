<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="Controll.Logic"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String mNumber = request.getParameter("mNumber");
	String agreeterm = request.getParameter("agreeterm");
	try {
		if ((!(name.equals(null) && !(email.equals(null))) && !(pass.equals(null) && !(mNumber.equals(null)) && !(agreeterm.equals(null))))) {
			Connection con = Logic.conn();
			Statement st = con.createStatement();
			int i = st.executeUpdate("insert into user(email,psw,phone,name,agreeterm)values('" + email + "','" + pass + "','" + mNumber + "','" + name + "','" + agreeterm + "')");
			out.println("Thank you for register ! Please <a href='LogIn.html'>Login</a> to continue.");
		} else {
			out.println("All Fileds are Madotry");
		}
	}

	catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>