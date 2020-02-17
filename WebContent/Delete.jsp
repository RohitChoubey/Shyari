<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="Controll.Logic"%>
<%
	String id = request.getParameter("id");
	try {
		Connection con = Logic.conn();
		Statement st = con.createStatement();
		//int i=st.executeUpdate("DELETE FROM sayraikidhuniyatable  WHERE id="+id);
		st.executeUpdate("DELETE from "+ request.getParameter("category")+"  WHERE id=" + id);
		response.sendRedirect("AdminIndex.jsp");
		out.println("<h3 style=color:red;>Data Deleted Successfully!</h5>");
	} 
	catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>
