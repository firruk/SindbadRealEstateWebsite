<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

	<head>
		<title>CLIENT REGISTRATION </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<cfquery name="GetPropertyInfo"  datasource="Mohsina180096">
							SELECT *
								 FROM Locality_Prop
								 Where Prop_ID='#Trim(url.theProperty)#' AND ACTIVE=YES ;
								 
								
							</cfquery>

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
						<center><h1>Login</h1></center>
						<center><p>Befor making a purchase please LogIn with your registered Email Address and Password</p></center>
					</header>
					
					
				</div>
			</section>

		<!-- Footer -->
			<section id="footer">
				<div class="inner">
					<header>
						<h2>ENTER THE DETAILS</h2>
					</header>
					<cfoutput query="GetPropertyInfo">
					<form id="form" name="form" method="post" action="Checklogin.cfm?theProperty=#GetPropertyInfo.Prop_ID#" >
					</cfoutput>
						<div class="field ">
							<label for="Fname">Enter Registered Email Address</label>
							<input type="email" name="Email" id="Email" required/>
						</div>
						<div class="field ">
							<label for="Sname">Enter Password</label>
							  <input type="Password" name="Passwd" id="Passwd" />
						
						<br>
						<br>

						 <label>
						<input type="submit" name="Submit" value="Submit" />
						</label>
					</form>
					<center>Dont have an account in Sindbad Real Estate?<center>
					<center><a href="register.html/">Register</a></center>
					<div class="copyright">
						&copy; SINDBAD REAL ESTATE
						<p>Note:You cannot make any purchases if your not registered in Sindbad Real estate or if you have given any wrong Login details. </p>
					</div>
				</div>
			</section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>