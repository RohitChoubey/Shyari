<%@page import="Controll.Logic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<%
	String None=request.getParameter("None");
	String category=request.getParameter("category");
	String text=request.getParameter("text");
	String title=request.getParameter("title");
	try {
		 if(category.isEmpty()){
			RequestDispatcher req = request.getRequestDispatcher("LogIn.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;>Please Select Sayari Type</h2>");
		} 
		 else if(None.equals("None")){
			 RequestDispatcher req = request.getRequestDispatcher("LogIn.jsp");
				req.include(request, response);
				out.println("<h2 style=color:red;>Please Select Sayari Type</h2>");
		 }
		else if(text.isEmpty()){
			RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;>Please Filled out the Ssayari</h2>");
		} 
		else if(title.isEmpty()) {
			RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;>Please filled the title</h2>");
		}
		else if (category.isEmpty() || text.isEmpty() || title.isEmpty()){
			RequestDispatcher req = request.getRequestDispatcher("LogInForm.jsp");
			req.include(request, response);
			out.println("<h2 style=color:red;><b>All Fields are mendotry</b></h2>");
		}
		else{
			Connection con=Logic.conn();
			PreparedStatement ps=con.prepareStatement("insert into "+ category +" (sayari,title) values(?,?);");
		//	ps.setString(1,category);
			ps.setString(1,text);
			ps.setString(2,title);
			ps.executeUpdate();
			out.println("<h3 style=color:red;><b>Sayari is successfully inserted!</b></h3>");
			RequestDispatcher req = request.getRequestDispatcher("/LogIn.jsp");
			req.include(request,response);
		}
	}
	catch(Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>