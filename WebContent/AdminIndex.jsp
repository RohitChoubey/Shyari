<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="Controll.Logic"%>
<%
	ResultSet resultset = null;
%>


<% 
		//  if (session != null) {
		// if (session.getAttribute("name") != null) {
			//String name = (String) session.getAttribute("name");
			
		// } 
		// else {
			//response.sendRedirect("LogIn.html");
		 //}
		 //*String a=session.getAttribute("username").toString();
        // out.println("Hello  "+a);
		  //}
		  
		//if (session != null) {
	//		out.print("Welcome to Shayri World "+ request.getAttribute("name"));
		//} else {
	//		response.sendRedirect("LogIn.jsp");
	//	} 
	
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
<!-- Required meta tags - Bootstrap START-->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap END-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta property="og:site_name"
	content="Shayari Ki Dhuniya - Collection of Shayari" />
<meta name="Keywords"
	content="Hindi Shayari, Urdu Shayari, Romantic Shayari, Love Shayari, Sad Shayari, Dard Shayari" />
<!-- Latest compiled and minified JavaScript -->
<link href="bundles/css_bundle3b0e.css" rel="stylesheet" />
<title>Shayari Ki Dhuniya - Shayari for every emotion</title>
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button2 {
	background-color: #008CBA;
} /* Blue */
.button3 {
	background-color: #f44336;
} /* Red */
</style>
</head>
<body
	style="background-image: linear-gradient(to right top, #051937, #004d7a, #008793, #00bf72, #a8eb12);">

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "../connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=154562311800147";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<form method="post" action="AdminIndex.jsp" id="form1">
		<div class="aspNetHidden">
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
			<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" /> 
				<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTE1Mjk0NTQ5NQ9kFgJmD2QWAgIBD2QWBgILD2QWAgIBD2QWAgIGDzwrAAkBAA8WBB4IRGF0YUtleXMWAB4LXyFJdGVtQ291bnRmZGQCDw9kFgICAQ8WAh8BAgoWFGYPZBYEAgMPDxYEHgRUZXh0BQxJc2hxIFNoYXlhcmkeC05hdmlnYXRlVXJsBRd+L0NhdGVnb3J5L0lzaHFfU2hheWFyaWRkAgUPDxYCHwIFDDI1NCBzaGF5YXJpc2RkAgEPZBYEAgMPDxYEHwIFDVB5YWFyIFNoYXlhcmkfAwUYfi9DYXRlZ29yeS9QeWFhcl9TaGF5YXJpZGQCBQ8PFgIfAgUMMjAyIHNoYXlhcmlzZGQCAg9kFgQCAw8PFgQfAgUMRGFyZCBTaGF5YXJpHwMFF34vQ2F0ZWdvcnkvRGFyZF9TaGF5YXJpZGQCBQ8PFgIfAgUMMTk4IHNoYXlhcmlzZGQCAw9kFgQCAw8PFgQfAgULU2FkIFNoYXlhcmkfAwUWfi9DYXRlZ29yeS9zYWRfc2hheWFyaWRkAgUPDxYCHwIFDDE5NyBzaGF5YXJpc2RkAgQPZBYEAgMPDxYEHwIFDExvdmUgU2hheWFyaR8DBRd+L0NhdGVnb3J5L2xvdmVfc2hheWFyaWRkAgUPDxYCHwIFDDE5MiBzaGF5YXJpc2RkAgUPZBYEAgMPDxYEHwIFDFByZW0gU2hheWFyaR8DBRd+L0NhdGVnb3J5L1ByZW1fU2hheWFyaWRkAgUPDxYCHwIFDDE4NiBzaGF5YXJpc2RkAgYPZBYEAgMPDxYEHwIFIuCkh+CkguCkpOClm+CkvuCksCDgpLbgpL7gpK/gpLDgpYAfAwUhfi9DYXRlZ29yeS9JbnRlemFhcl9TaGF5YXJpX0hpbmRpZGQCBQ8PFgIfAgUMMTcyIHNoYXlhcmlzZGQCBw9kFgQCAw8PFgQfAgUKRGFyZC1lLURpbB8DBRV+L0NhdGVnb3J5L0RhcmQtZS1EaWxkZAIFDw8WAh8CBQwxNzAgc2hheWFyaXNkZAIID2QWBAIDDw8WBB8CBR3gpKbgpL/gpLIg4KSV4KWHIOCkleCksOClgOCkrB8DBSV+L0NhdGVnb3J5L0RpbF9LZV9LYXJpYl9TaGF5YXJpX0hpbmRpZGQCBQ8PFgIfAgUMMTYyIHNoYXlhcmlzZGQCCQ9kFgQCAw8PFgQfAgUQTW9oYWJiYXQgU2hheWFyaR8DBRt+L0NhdGVnb3J5L01vaGFiYmF0X1NoYXlhcmlkZAIFDw8WAh8CBQwxNjEgc2hheWFyaXNkZAIXD2QWAgIBDxYCHwECBRYKZg9kFgQCAw8PFgQfAgUZQWpuYWJpIGdhbGl5b24gc2UgaHVtIGcuLh8DBSp+L0NvbnRlbnQvMTQ2My9Bam5hYmlfZ2FsaXlvbl9zZV9odW1fZ3V6cmFkZAIFDw8WAh8CBQxJc2hxIFNoYXlhcmlkZAIBD2QWBAIDDw8WBB8CBRlDaGFuZCBUYWFyZSBUb2ggTmEgTGEgUy4uHwMFLH4vQ29udGVudC8xOTczL0NoYW5kX1RhYXJlX1RvaF9OYV9MYV9TYWt1bmdhZGQCBQ8PFgIfAgUMR2hhbSBTaGF5YXJpZGQCAg9kFgQCAw8PFgQfAgUYRGlsIEsgUWFyZWViIEFhIEsgSmFiIFdvHwMFJ34vQ29udGVudC8yMDQ2L0RpbF9LX1FhcmVlYl9BYV9LX0phYl9Xb2RkAgUPDxYCHwIFDkJld2FmYSBTaGF5YXJpZGQCAw9kFgQCAw8PFgQfAgUZTWVyaSBDaGFoYXQgbmUgVXNlIEtodXNoaR8DBSh+L0NvbnRlbnQvMTU4NC9NZXJpX0NoYWhhdF9uZV9Vc2VfS2h1c2hpZGQCBQ8PFgIfAgUNUHlhYXIgU2hheWFyaWRkAgQPZBYEAgMPDxYEHwIFGVVuaGUgTmFmcmF0IEh1eWkgU2FhcmUgLi4fAwUrfi9Db250ZW50LzEyNjkvVW5oZV9OYWZyYXRfSHV5aV9TYWFyZV9KYWhhbmRkAgUPDxYCHwIFC0R1YSBTaGF5YXJpZGRksQb1z4pWKV9MG5zYxYDUBSAZqk/5YMrj/0JQxO7Mkk4=" />
		</div>

		<script type="text/javascript">
			//<![CDATA[
			var theForm = document.forms['form1'];
			if (!theForm) {
				theForm = document.form1;
			}
			function __doPostBack(eventTarget, eventArgument) {
				if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
					theForm.__EVENTTARGET.value = eventTarget;
					theForm.__EVENTARGUMENT.value = eventArgument;
					theForm.submit();
				}
			}
			//]]>
		</script>


		<script src="WebResource5690.js" type="text/javascript"></script>
		<script src="ScriptResourcede5b.js" type="text/javascript"></script>
		<script src="ScriptResource588b.js" type="text/javascript"></script>
		<div class="aspNetHidden">
			<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="90059987" /> 
				<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" />
		</div>
		<div id="IdBgImage"></div>
		<div id="Div1" data-role="header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!--Header starts -->
						<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<a href="index-2.html" class="navbar-brand">
							<img src="images/logo.png" width="180px" height="100px" />
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item active lnk1"><a href="AdminIndex.jsp"
									class="nav-link" title="Home">Home <span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item lnk2"><a class="nav-link"
									href="ContactUs.jsp" title="Contact us">Contact us</a></li>
							 	<li class="nav-item lnk3"><a class="nav-link"
									href="InsertSh.jsp" title="Inerst Shayari">Submit new
										Shayari</a></li> 
							<!--	<li class="nav-item lnk3"><a class="nav-link"
									href="LogInForm.jsp" title="Contact me">Login </a></li>-->
								<li class="nav-item dropdown lnk4"><a
									class="nav-link dropdown-toggle" href="#"
									id="navbarDropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> Categories </a> 
									<%
									 	try {
									 		Connection con = Logic.conn();
									 		Statement st = con.createStatement();
									 		resultset = st.executeQuery("select * from sayraikidhuniyatable");
									 %>
									<div class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<ul style="">
											<%
												while (resultset.next()) {
														String rs = resultset.getString(2).toUpperCase();
											%>
											<li><a href="AdminIndex.jsp?category=<%=rs%>"><%=rs%></a></li>
											<%
												}
												} catch (Exception e) {
													out.println("wrong entry" + e);
												}
											%>
										</ul>
									</div></li>
									<li class="nav-item lnk2"><a class="nav-link"
									href="logout.jsp" title="Log Out">Log Out</a></li>
								<li class="nav-item lnk2"><a class="nav-link" title="Name">
									<%
									 if (session.getAttribute("name") != null) {
											String name = (String) session.getAttribute("name");
											out.print("Hello " + name );
										 } 
										 
									
									else {
										response.sendRedirect("LogIn.html");
									 }
											%>
											</li>
							</ul>
						</div>
						</nav>
						<!--Header ends -->
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-9">
					<div class="title">
						<span>15 Random Shayari</span>
					</div>
					<%
						if (request.getParameter("category") != null) {
							try {
								System.out.println(request.getParameter("category"));
								Connection con = Logic.conn();
								Statement statement = con.createStatement();
								//resultset = statement.executeQuery("select TOP 2 * from " + request.getParameter("category"));
								//resultset = statement.executeQuery("select * from " + request.getParameter("category") + "ORDER BY id DESC ");
								resultset = statement.executeQuery("select * from " + request.getParameter("category"));
								while (resultset.next()) {
									// "insert into "+ category +" (sayari) values(?);"
					%>
					<div class="card rounded mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col">
									<h5 class="card-title">
										<a id="cphMain_ccContent_repContentList_hplTitle_1"
											href="Content/11077/%e0%a4%b8%e0%a4%bf%e0%a4%b0%e0%a5%8d%e0%a4%ab_%e0%a4%87%e0%a4%b6%e0%a4%be%e0%a4%b0%e0%a5%8b%e0%a4%82_%e0%a4%ae%e0%a5%87%e0%a4%82_%e0%a4%b9%e0%a5%8b%e0%a4%a4%e0%a5%80_%e0%a4%ae%e0%a4%b9%e0%a5%8b%e0%a4%ac%e0%a5%8d%e0%a4%ac%e0%a4%a4_4.html">
											<%=resultset.getString("title")%><!-- सिर्फ इशारों में होती महोब्बत अगर,इन अलफाजों को खुबसूरती कौन देता,बस पत्थर बन के रह जाता ‘ताज महल’अगर इश्क इसे अपनी पहचान ना देता..-->
											</span>
											</p>
										</a>
									</h5>
									<h6 class="card-subtitle mb-2 text-muted">
										Category : <span
											id="cphMain_ccContent_repContentList_lblCategory_1">Love
											Sayari</span>
									</h6>
								</div>
								<!--<div class="col">
                        <div class="float-right highlighted-info">
                            <a id="cphMain_ccContent_repContentList_hypDownloadApp_1" href="../external.html?link=https://y6s46.app.goo.gl/kPAc" target="_blank"><img src="Images/icons/Android_App_Download.png" alt="Download Android App" />Download App
                            </a>
                        </div>
                    </div>-->
							</div>
							<p class="card-text my-5">
								<span id="cphMain_ccContent_repContentList_lblContent_1"><%=resultset.getString("Sayari")%>
									<br /> 
									<a href="Update.jsp?id=<%=resultset.getString("id")%>&category=<%= request.getParameter("category")%>"
									class="button button2"> Edit</a> 
									
									
									
									<a href="Delete.jsp?id=<%=resultset.getString("id")%>&category=<%= request.getParameter("category")%>"
									class="button button3"> Delete X</a> 
									
									
									
									
									
									<!-- सिर्फ इशारों में होती महोब्बत अगर,इन अलफाजों को खुबसूरती कौन देता,बस पत्थर बन के रह जाता ‘ताज महल’अगर इश्क इसे अपनी पहचान ना देता..--></span>
							</p>
							<div>
								<div
									class='addthis_toolbox addthis_default_style addthis_32x32_style'>
								</div>
							</div>
						</div>
					</div>
					<%
						}
							}

							catch (Exception e) {
								out.println("wrong entry" + e);
							}
						}
					%>

					<div class="card rounded mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col">
									<h5 class="card-title">
										<a id="cphMain_ccContent_repContentList_hplTitle_2"
											href="Content/1148/Koi_achha_lage_to_usse_pyar.html">Koi
											achha lage to usse pyar</a>
									</h5>
									<h6 class="card-subtitle mb-2 text-muted">
										Category : <span
											id="cphMain_ccContent_repContentList_lblCategory_2">Bewafa
											Shayari</span>
									</h6>

								</div>
								<!--   <div class="col">
                        <div class="float-right highlighted-info">
                            <a id="cphMain_ccContent_repContentList_hypDownloadApp_2" href="../external.html?link=https://y6s46.app.goo.gl/7wZM" target="_blank"><img src="Images/icons/Android_App_Download.png" alt="Download Android App" />Download App
                            </a>
                        </div>
                    </div>-->
							</div>
							<p class="card-text my-5">
								<span id="cphMain_ccContent_repContentList_lblContent_2">Koi
									achha lage to usse pyar mat karna, <br />Uske liye neendein
									bekaar mat karna, <br /> <br />Do din to aayenge khushi se
									milne, <br />Teesre din kahenge mera intezar mat karna..
								</span>
							</p>
							<div>
								<div
									class='addthis_toolbox addthis_default_style addthis_32x32_style'>
									<a class='addthis_button_facebook'
										addthis:url='http://www.shayariguru.in/Content/1148/Koi achha lage to usse pyar'
										addthis:title='Koi achha lage to usse pyar'
										addthis:description='Koi achha lage to usse pyar mat karna, <br/>Uske liye neendein bekaar mat karna, <br/><br/>Do din to aayenge khushi se milne, <br/>Teesre din kahenge mera intezar mat karna..'></a>
									<a class='addthis_button_twitter'
										addthis:url='http://www.shayariguru.in/Content/1148/Koi achha lage to usse pyar'
										addthis:title='Koi achha lage to usse pyar'
										addthis:description='Koi achha lage to usse pyar mat karna, <br/>Uske liye neendein bekaar mat karna, <br/><br/>Do din to aayenge khushi se milne, <br/>Teesre din kahenge mera intezar mat karna..'></a>
									<a class='addthis_button_email'
										addthis:url='http://www.shayariguru.in/Content/1148/Koi achha lage to usse pyar'
										addthis:title='Koi achha lage to usse pyar'
										addthis:description='Koi achha lage to usse pyar mat karna, <br/>Uske liye neendein bekaar mat karna, <br/><br/>Do din to aayenge khushi se milne, <br/>Teesre din kahenge mera intezar mat karna..'></a>
									<a class='addthis_button_whatsapp'
										addthis:url='http://www.shayariguru.in/Content/1148/Koi achha lage to usse pyar'
										addthis:title='Koi achha lage to usse pyar'
										addthis:description='Koi achha lage to usse pyar mat karna, <br/>Uske liye neendein bekaar mat karna, <br/><br/>Do din to aayenge khushi se milne, <br/>Teesre din kahenge mera intezar mat karna..'></a>
									<a class='addthis_button_compact'
										addthis:url='http://www.shayariguru.in/Content/1148/Koi achha lage to usse pyar'
										addthis:title='Koi achha lage to usse pyar'
										addthis:description='Koi achha lage to usse pyar mat karna, <br/>Uske liye neendein bekaar mat karna, <br/><br/>Do din to aayenge khushi se milne, <br/>Teesre din kahenge mera intezar mat karna..'></a>
								</div>
							</div>
						</div>
					</div>
					<div class="card rounded mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col">
									<h5 class="card-title">
										<a id="cphMain_ccContent_repContentList_hplTitle_3"
											href="Content/1111/Khwab_Rehteh_The_Jo_Kabhi.html">Khwab
											Rehteh The Jo Kabhi</a>
									</h5>
									<h6 class="card-subtitle mb-2 text-muted">
										Category : <span
											id="cphMain_ccContent_repContentList_lblCategory_3">Khwab
											Shayari</span>
									</h6>
								</div>
								<!--    <div class="col">
                        <div class="float-right highlighted-info">
                            <a id="cphMain_ccContent_repContentList_hypDownloadApp_3" href="../external.html?link=https://y6s46.app.goo.gl/YM0b" target="_blank"><img src="Images/icons/Android_App_Download.png" alt="Download Android App" />Download App
                            </a>
                        </div>
                    </div>-->
							</div>


							<p class="card-text my-5">
								<span id="cphMain_ccContent_repContentList_lblContent_3">Khwab
									Rehteh The Jo Kabhi Palkon Pe,<br /> Moti Bankar Aankhon Se
									Gir Gaye,<br /> <br />Daav Par Hote Hain Dil O Jaan Yaha,<br />
									Pyar Ka Yeh Saude Mehenge Pad Gaye,<br /> <br />Dhundhle
									Raaste, Manzil Bhi Anjaani Si,<br /> Rukte Kadam Phir Aage
									Badh Gaye,<br /> <br>
								</span>
							</p>
							<div
								class='addthis_toolbox addthis_default_style addthis_32x32_style'>
								<a class='addthis_button_facebook'
									addthis:url='http://www.shayariguru.in/Content/1111/Khwab Rehteh The Jo Kabhi'
									addthis:title='Khwab Rehteh The Jo Kabhi'addthis:description= 'Khwab Rehteh The Jo Kabhi Palkon Pe,<br/> Moti Bankar Aankhon Se Gir Gaye,<br/><br/>Daav Par Hote Hain Dil O Jaan Yaha,<br/> Pyar Ka Yeh Saude Mehenge Pad Gaye,<br/><br/>Dhundhle Raaste, Manzil Bhi Anjaani Si,<br/> Rukte Kadam Phir Aage Badh Gaye,<br/><br'></a>
								<a class='addthis_button_twitter'
									addthis:url='http://www.shayariguru.in/Content/1111/Khwab Rehteh The Jo Kabhi'
									addthis:title='Khwab Rehteh The Jo Kabhi'addthis:description= 'Khwab Rehteh The Jo Kabhi Palkon Pe,<br/> Moti Bankar Aankhon Se Gir Gaye,<br/><br/>Daav Par Hote Hain Dil O Jaan Yaha,<br/> Pyar Ka Yeh Saude Mehenge Pad Gaye,<br/><br/>Dhundhle Raaste, Manzil Bhi Anjaani Si,<br/> Rukte Kadam Phir Aage Badh Gaye,<br/><br'></a>
								<a class='addthis_button_email'
									addthis:url='http://www.shayariguru.in/Content/1111/Khwab Rehteh The Jo Kabhi'
									addthis:title='Khwab Rehteh The Jo Kabhi'addthis:description= 'Khwab Rehteh The Jo Kabhi Palkon Pe,<br/> Moti Bankar Aankhon Se Gir Gaye,<br/><br/>Daav Par Hote Hain Dil O Jaan Yaha,<br/> Pyar Ka Yeh Saude Mehenge Pad Gaye,<br/><br/>Dhundhle Raaste, Manzil Bhi Anjaani Si,<br/> Rukte Kadam Phir Aage Badh Gaye,<br/><br'></a>
								<a class='addthis_button_whatsapp'
									addthis:url='http://www.shayariguru.in/Content/1111/Khwab Rehteh The Jo Kabhi'
									addthis:title='Khwab Rehteh The Jo Kabhi'addthis:description= 'Khwab Rehteh The Jo Kabhi Palkon Pe,<br/> Moti Bankar Aankhon Se Gir Gaye,<br/><br/>Daav Par Hote Hain Dil O Jaan Yaha,<br/> Pyar Ka Yeh Saude Mehenge Pad Gaye,<br/><br/>Dhundhle Raaste, Manzil Bhi Anjaani Si,<br/> Rukte Kadam Phir Aage Badh Gaye,<br/><br'></a>
								<a class='addthis_button_compact'
									addthis:url='http://www.shayariguru.in/Content/1111/Khwab Rehteh The Jo Kabhi'
									addthis:title='Khwab Rehteh The Jo Kabhi'addthis:description= 'Khwab Rehteh The Jo Kabhi Palkon Pe,<br/> Moti Bankar Aankhon Se Gir Gaye,<br/><br/>Daav Par Hote Hain Dil O Jaan Yaha,<br/> Pyar Ka Yeh Saude Mehenge Pad Gaye,<br/><br/>Dhundhle Raaste, Manzil Bhi Anjaani Si,<br/> Rukte Kadam Phir Aage Badh Gaye,<br/><br'></a>
							</div>
						</div>
					</div>
					<div class="card rounded mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col">
									<h5 class="card-title">
										<a id="cphMain_ccContent_repContentList_hplTitle_9"
											href="Content/1202/Kya_leke_aye_they_Kya.html">Kya leke
											aye they Kya</a>
									</h5>
									<h6 class="card-subtitle mb-2 text-muted">
										Category : <span
											id="cphMain_ccContent_repContentList_lblCategory_9">Ishq
											Shayari</span>
									</h6>

								</div>
								<!--  <div class="col">
                        <div class="float-right highlighted-info">
                            <a id="cphMain_ccContent_repContentList_hypDownloadApp_9" href="../external.html?link=https://y6s46.app.goo.gl/7wZM" target="_blank"><img src="Images/icons/Android_App_Download.png" alt="Download Android App" />Download App
                            </a>
                        </div>
                    </div>-->
							</div>
							<p class="card-text my-5">
								<span id="cphMain_ccContent_repContentList_lblContent_9">Kya
									leke aye they,<br />Kya lekar jaoge,<br />Mujhe SMS na karke,<br />Zalim
									kitne Paise Bachaoge!
								</span>
							</p>
							<div>
								<div
									class='addthis_toolbox addthis_default_style addthis_32x32_style'>
									<a class='addthis_button_facebook'
										addthis:url='http://www.shayariguru.in/Content/1202/Kya leke aye they Kya'
										addthis:title='Kya leke aye they Kya'
										addthis:description='Kya leke aye they,<br/>Kya lekar jaoge,<br/>Mujhe SMS na karke,<br/>Zalim kitne Paise Bachaoge!'></a>
									<a class='addthis_button_twitter'
										addthis:url='http://www.shayariguru.in/Content/1202/Kya leke aye they Kya'
										addthis:title='Kya leke aye they Kya'
										addthis:description='Kya leke aye they,<br/>Kya lekar jaoge,<br/>Mujhe SMS na karke,<br/>Zalim kitne Paise Bachaoge!'></a>
									<a class='addthis_button_email'
										addthis:url='http://www.shayariguru.in/Content/1202/Kya leke aye they Kya'
										addthis:title='Kya leke aye they Kya'
										addthis:description='Kya leke aye they,<br/>Kya lekar jaoge,<br/>Mujhe SMS na karke,<br/>Zalim kitne Paise Bachaoge!'></a>
									<a class='addthis_button_whatsapp'
										addthis:url='http://www.shayariguru.in/Content/1202/Kya leke aye they Kya'
										addthis:title='Kya leke aye they Kya'
										addthis:description='Kya leke aye they,<br/>Kya lekar jaoge,<br/>Mujhe SMS na karke,<br/>Zalim kitne Paise Bachaoge!'></a>
									<a class='addthis_button_compact'
										addthis:url='http://www.shayariguru.in/Content/1202/Kya leke aye they Kya'
										addthis:title='Kya leke aye they Kya'
										addthis:description='Kya leke aye they,<br/>Kya lekar jaoge,<br/>Mujhe SMS na karke,<br/>Zalim kitne Paise Bachaoge!'></a>
								</div>
							</div>
						</div>
					</div>


					<div id="cphMain_ccContent_pnlPaging"></div>
					<input type="hidden" name="ctl00$cphMain$ccContent$hdnPageNo"
						id="cphMain_ccContent_hdnPageNo" />

				</div>
			</div>
		</div>
		</div>
		<br />
		<!-- Footer -STARTS -->
		<footer style="background-color:#333;">
		<div class="container">
			<div class="nav-footer no-bdr-btm">
				<table cellspacing="5"
					style="width: 100%; border-bottom: solid 0px #747474;">
					<tr>
						<td style="width: 33%; border-right: solid 1px #747474;"><a
							href="#">About Me</a></td>
						<td style="width: 33%; border-right: solid 1px #747474;"><a
							href="#">Privacy Policy</a></td>
						<td style="width: 33%; font-size: 12px; font-weight: normal;">
							Developed By & Under<br /> <a href="#" target="_blank">Rohit
								Choubey</a>
						</td>
					</tr>
				</table>
				<div class="credits">Copyright &copy; 2020-2021 - All Rights
					Reserved.</div>
			</div>
		</div>
		</footer>
		<!-- Footer -ENDS -->
		<script type="text/javascript">
			
		</script>

	</form>



	<script src="bundles/js_bundle9cfa" type="text/javascript"
		async="async"></script>


	<script type="text/javascript" src="JS/addthis_widget.js" async="async"></script>

</body>
</html>
