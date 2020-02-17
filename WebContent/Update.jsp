<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@page import="Controll.Logic"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
	String id = request.getParameter("id");
	Connection con = Logic.conn();
	Statement statement = null;
	ResultSet resultSet = null;
%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
select {
	width: 38%;
	padding: 16px 20px;
	border: none;
	border-radius: 4px;
	background-color: #f1f1f1;
}

* {
	outline: none;
	border: none;
	margin: 0px;
	padding: 0px;
	font-family: Courier, monospace;
}

body {
	background: #333
		url(https://static.tumblr.com/maopbtg/a5emgtoju/inflicted.png) repeat;
}

#paper {
	color: #FFF;
	font-size: 20px;
}

#margin {
	margin-left: 202px;
	margin-bottom: 20px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
	color: white;
}

#text {
	width: 500px;
	overflow: hidden;
	background-color: #FFF;
	color: #222;
	font-family: Courier, monospace;
	font-weight: normal;
	font-size: 24px;
	resize: none;
	line-height: 40px;
	padding-left: 100px;
	padding-right: 100px;
	padding-top: 45px;
	padding-bottom: 34px;
	background-image:
		url(https://static.tumblr.com/maopbtg/E9Bmgtoht/lines.png),
		url(https://static.tumblr.com/maopbtg/nBUmgtogx/paper.png);
	background-repeat: repeat-y, repeat;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	-webkit-box-shadow: 0px 2px 14px #000;
	box-shadow: 0px 2px 14px #000;
	border-top: 1px solid #FFF;
	border-bottom: 1px solid #FFF;
}

#title {
	background-color: transparent;
	border-bottom: 3px solid #FFF;
	color: #FFF;
	font-size: 20px;
	font-family: Courier, monospace;
	height: 28px;
	font-weight: bold;
	width: 220px;
	margin-right: -500px;
}

#button {
	cursor: pointer;
	margin-top: 20px;
	height: 40px;
	padding-left: 24px;
	padding-right: 24px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 20px;
	color: #FFF;
	text-shadow: 0px -1px 0px #000000;
	-webkit-border-radius: 8px;
	border-radius: 8px;
	border-top: 1px solid #FFF;
	-webkit-box-shadow: 0px 2px 14px #000;
	box-shadow: 0px 2px 14px #000;
	background-color: #62add6;
	background-image:
		url(https://static.tumblr.com/maopbtg/ZHLmgtok7/button.png);
	background-repeat: repeat-x;
}

#button:active {
	zoom: 1;
	filter: alpha(opacity = 80);
	opacity: 0.8;
}

#button:focus {
	zoom: 1;
	filter: alpha(opacity = 80);
	opacity: 0.8;
}

#wrapper {
	width: 600px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: 24px;
	margin-bottom: 100px;
}

#text1 {
	width: 400px;
	overflow: hidden;
	background-color: #FFF;
	color: #222;
	font-family: Courier, monospace;
	font-weight: normal;
	font-size: 24px;
	resize: none;
	line-height: 40px;
	padding-left: 100px;
	padding-right: 100px;
	background-image:
		url(https://static.tumblr.com/maopbtg/E9Bmgtoht/lines.png),
		url(https://static.tumblr.com/maopbtg/nBUmgtogx/paper.png);
	background-repeat: repeat-y, repeat;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	-webkit-box-shadow: 0px 2px 14px #000;
	box-shadow: 0px 2px 14px #000;
	border-top: 1px solid #FFF;
	border-bottom: 1px solid #FFF;
}
</style>
<script>
	$(document).ready(function() {
		$('#title').focus();
		$('#text').autosize();
	});
</script>
</head>
<body>
	<%
		/*
		 // if (session != null) {
		     if (session.getAttribute("name") != null) {
		String name = (String) session.getAttribute("name");
		out.print("Hello, " + name + "  Welcome to ur Profile");
		     } 
		     else {
		response.sendRedirect("LogIn.jsp");
		     }
		  }
		   */
		if (session != null) {
			out.print("Hello, Rohit  Welcome to ur Profile");
		} 
		else {
			response.sendRedirect("LogIn.jsp");
		}
	%>
	
	<br />
	<br />
	<br />
	<h3 style="color: blue;font-face=verdana">Welcome Rohit Please
		Enter Something &emsp;&emsp;</h3>
	<br />

	<form method="post" action="UpdateContoller.jsp">

		<div id="margin">
			<input type="txt" name="id" value="<%=resultSet.getString("id")%>">
			Title: <input id="title" type="text" name="title" minlength="10"
				value="<%=resultSet.getString("title")%>" requried>
		</div>
		<center>

			<s:setDataSource var="con" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/SayariKiDhuniya" user="root"
				password="1234" scope="session" />
			<s:query var="rs" dataSource="${con}">
        select * from sayraikidhuniyatable
</s:query>
			<select id="text1" name="category" requried>
				<c:forEach var="item" items="${rs.rows}">
					<option value="none">--None--</option>
					<option value="${item.SayariTableName}">${item. SayariTableName}</option>
				</c:forEach>
			</select>

			<div id="wrapper">
				<textarea placeholder="Enter something funny." id="text" name="text"
					rows="6" value="<%=resultSet.getString("Sayari")%>"
					style="overflow: hidden; word-wrap: break-word; resize: none; height: 160px;"
					required minlength="20"></textarea>
				<br> <input id="button" type="submit" value="Create">
			</div>
		</center>
	</form>


</body>

</html>
<%@ include file="Footer.jsp"%>