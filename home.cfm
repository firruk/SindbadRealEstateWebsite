<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Sindbad Real Estate</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	    <style type="text/css">
<!--
.style1 {
	color: #5a5a5a;
	font-weight: bold;
}
.style2 {color: #FF0000}
.style3 {color: #333333; }
-->
 li {
						  display: inline-flex;
						  width: 100%;
						  height: 100%;
						  border-style:solid;
						  border-color:#333333;
						 
						  
						 
						 
						}		 
        </style>
</head>
	<body>
	 <cfquery name = "GetRangeID" datasource = "Mohsina180096">
			 SELECT *
			 FROM range
			 WHERE Active = Yes
			 ORDER BY Range_Title;
    </cfquery>
	 <cfquery name = "GetRangeInfo" datasource = "Mohsina180096">
			 SELECT *
			 FROM range
			 ORDER BY Range_Title;
    </cfquery>
	<cfquery name="GetRangeInfo"  datasource="Mohsina180096">
							SELECT *
							   FROM Range
							   WHERE ACTIVE=YES
									ORDER BY Range_Title;
			  </cfquery>
		<!-- Header -->
		<header id="header">
				<div class="inner">
					<a href="home.cfm" class="logo">Sindbad</a>
					<nav id="nav">
							<a href="home.cfm">Home</a>
							<cfoutput query="GetRangeID">
							<a href="range.cfm?theRange=#GetRangeID.Range_ID#" title="Go to the #GetRangeID.Range_Title# page">#GetRangeID.Range_Title#</a>				      </cfoutput>
							
							<a href="query.html">Queries</a>						</nav>
				</div>
	</header>
			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

		<!-- Banner -->
			<section id="banner" name="banner" style="background-image:url(images/background.jpg)">
				<div class="inner" >
					<h1 style="color:#CC0033;">Sindbad <span style="color:#FFFFFF;">Find your dream home here......</span></h1>
					<ul class="actions">
						<a href="#INTRO" class="button alt" style="margin-right:5%;background-color:#999999;">Get Started</a>
							<a href="register.html" class="button alt" style="background-color:#999999;">Register</a>
					</ul>
				</div>
	</section>

		<!-- One -->
			<section id="one">
				<div class="inner">
					<header>
						  <h1 align="center">SINDBAD REAL ESTATE</h1><hr style="COLOR:#333333;">
			      <h2 align="center" ><strong>WHO WE ARE </strong><a name="INTRO"></a></h2>
					</header>
					 <p align="center" class="style1">Founded in 2000,Sindbad Real Estate  is a unique and distict company in the Sultanate of Oman that offers a variety of dream homes to our valued customer.Sindbad is reimagining real estate to make it easier for our clients to unlock life's next chapter.</p>
              <p align="center"><strong>Our website lets you search property listings within Oman and includes a large inventory of homes for sale at your conveneint budget.Our listings include all types of homes such as villas, apartments and more, We can also match your lifestyle choices such as ocean view and hill side view and many other. </strong>&nbsp;</p><hr>
					
			  </div>
			</section>

		<!-- Two -->
			<section id="main"  >
			<H2 align="center" class="style5 style2" >SELECT FROM OUR WIDE RANGE OF PROPERTIES</H2>
			<section id="main" >
				<div class="inner">
			<header class="major special">			         
							
						
					 <ul>
					 
					 <li> <cfoutput query="GetRangeInfo"><article style="margin-right:10%">
						<div class="content">
						
							<header>
								<h3 align="center">#GetRangeInfo.Range_Title#</h3>
							</header>
							<div class="image fit">
								<img src="#GetRangeInfo.Range_Img#" alt="" width="150" height="200" style="width:500px;"/>							</div>
							<p>#GetRangeInfo.Range_Info#</p>
							<ul class="actions">
						<CENTER><li><a href="range.cfm?theRange=#GetRangeInfo.Range_ID#" title="Go to the #GetRangeInfo.Range_Title# page" class="button alt">Get Started</a></li></CENTER>
					</ul>
						</div>
						<hr>
					</article>
					</cfoutput>
					</li>
					 </ul>
					 
				  </header>
					
				</div>
			</section>	
		<!-- Three -->
			<section id="three"><H2 align="center" class="style2">CHECK OUT OUR LATEST OFFERS </H2>
			<div class="inner style2">
				<article>
					<div class="content">
							<span class="icon fa-diamond"></span>
						<header>
							<h3>GET THE SUMMER HEAT OFFER</h3>
						</header>
						<p>Find your dream summer house and use our 'SUMMER10' and get a 10% off on our commission.</p>
						<ul class="actions">
							 <li><a href="offers.html" class="alt style6">Learn More</a></li>
						</ul>
					</div>
				</article>
				<article>
					<div class="content">
					<span class="icon fa-laptop"></span>
							
						<header>
							<h3> Summer 2021 offer </h3>
						</header>
						<p>Buy from our latest villas and Apartments and win a 'Pool Day' at your favourite hotel in Muscat .</p>
						<ul class="actions">
						 <li><a href="offers.html" class="alt style6">Learn More</a></li>
						</ul>
					</div>
				</article>
				<article>
				  <div class="content">
				  <span class="icon fa-diamond"></span>
							
						  <header>
							  <h3>Summer online house hunting </h3>
						  </header>
						  <p>Check out the new properties with the view of the ocean and many more .</p>
						  <ul class="actions">
							  <li><a href="offers.html" class="alt style6">Learn More</a></li>
						  </ul>
				  </div>
				</article>
		    </div>
			</section>

		<!-- Footer -->
				<section id="footer" style="padding-top:0%;">
				<div class="inner" >
				<section id="three" style="padding-bottom:0%; padding-top::2%;"><H2>Get in Touch</H2>
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