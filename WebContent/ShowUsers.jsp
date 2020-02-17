<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<%@page import="Controll.Logic"%>

<%
	ResultSet resultset = null;
/**if (session.getAttribute("name") != null) {
		String name = (String) session.getAttribute("name");
		out.print("Hello, " + name + "  Welcome to ur Profile");
	} 
	else {
		response.sendRedirect("LogIn.html");
	}
*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Shayari Ki Duniya</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">

		<table class="table">
			<thead>
				<tr>
					<th>id</th>
					<th>Name</th>
					<th>Phone Number</th>
					<th>Email</th>
					<th>Password</th>
					<th></th>
					
				</tr>
			</thead>
			<tbody>
			<%
			try {
		 		Connection con = Logic.conn();
		 		Statement st = con.createStatement();
		 		resultset = st.executeQuery("select * from user");
				while (resultset.next()) {
			%>
				<tr class="table-success">
					<td><%=resultset.getString("id") %></td>
					<td><%=resultset.getString("Name") %></td>
					<td><%=resultset.getString("phone") %></td>
					<td><%=resultset.getString("email") %></td>
					<td><%=resultset.getString("psw") %></td>
					<td>
						<a href="ShowUsers.jsp?id=<%=resultset.getString("id") %>">
							<button type="button" class="btn btn-danger">Delete</button>
						</a>
					</td>
				</tr>
		<% 
				}
			} 
			catch (Exception e) {
				out.println("wrong entry" + e);
			}
		%>
			<%
				String id=request.getParameter("id");
				try {
					Connection con = Logic.conn();
			 		Statement st = con.createStatement();
					int i=st.executeUpdate("DELETE FROM user WHERE id="+id);
					out.println("<style=color:red;>Data Deleted Successfully!");
				}
				catch(Exception e) {
					System.out.print(e);
				    e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>