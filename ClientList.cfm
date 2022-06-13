<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

	<head>
		<title>Client list </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		

	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="home.cfm" class="logo">Sindbad</a>
					<nav id="nav">
							<a href="home.cfm">Home</a>							
								<a href="query.html">Queries</a>						</nav>
				</div>
			</header>
			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
					<header class="major special">
						<h1>Client List</h1><br>
						<br>					
					</header>
					<cfquery name = "ClientInfo" datasource = "Mohsina180096">
					SELECT *
						FROM  Client 
							ORDER BY Client_ID;
					</cfquery>
					<cfif ClientInfo.recordCount eq 0>
					  <cfoutput>
						<h3> No Records Found</h3>
					  </cfoutput>
					  <cfelse>
					<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											 <th>Forename</th>
											  <th>Surname</th>											  
											  <th>Email address</th>											
											  <th>Town</th>
											  <th>Phone Number</th>
											  <th>Mobile Number</th>
										</tr>
									</thead>
									<tbody>
										 <cfoutput query="ClientInfo">
										  <tr>
											<td>#Client_Forename# </td>
											<td>#Client_Surname# </td>											
											<td>#Email_Address# </td>
											<td>#Town# </td>
											<td>#Telephone_No# </td>
											<td>#Mobile_No# </td>
										  </tr>
										</cfoutput>
										
									</tbody>
									
								</table>
								</cfif>
								<center><a href="#" class="button">Back</a></center>
							</div>
						</section>
					 	
					
				

		<!-- Footer -->
			<section id="footer">
				<div class="inner">
				<section id="three"><H2>Get in Touch</H2>
			<div class="inner style2">
				<article>
					<div class="content" style="width:200%;">
							
						
							
					
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29239.674917719178!2d58.18390095872718!3d23.641626247176486!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e8dfc9369db9d95%3A0x57afe2923c208e99!2sNational%20University%20of%20Science%20and%20Technology%20(College%20of%20Engineering%2C%20Caledonian%20Campus)!5e0!3m2!1sen!2som!4v1620497697441!5m2!1sen!2som" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
							
					</div>
				</article>
				<article>
					<div class="content">
					
							
						<header>
							
				    Phone no: 00968 1234567899<br>
					    Fax Number: 0968 987654321<br>
					  Address: <br>
					  			  P.O.Box : 2322, <br>
							   	 CPO Seeb 111, <br>
							  	 Sultanate of Oman<br>
							Email Address:  <a href="mailto:hege@example.com">hege@example.com</a>
						</header>
						
					</div>
				</article>
				
		    </div>
			</section>
					<header>
					
					<div class="copyright">
						&copy; Sindbad Real Estate: <a href="home.cfm/">SINDBAD REAL ESTATE</a>.
						<a href="#" class="fa fa-facebook"></a>
						<a href="#" class="fa fa-twitter"></a>
						<a href="#" class="fa fa-google"></a>
						<a href="#" class="fa fa-linkedin"></a>
						<a href="#" class="fa fa-youtube"></a>
					</div>
				</div>
			</section>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

	</body>
</html>