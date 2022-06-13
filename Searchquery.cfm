<!DOCTYPE HTML>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

	<head>
		<title>Search Query </title>
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
		
			<section id="main">
				<div class="inner">
			<center><H3>SELECT YOUR PROPERTY EASILY AND FAST BY SELECTING THE OPTIONS BELOW IN THE ORDER. </H3>
			<H5 style="color:#666666;">Choose and buy a property from our various options and preferences.</H5></center>
			<cfquery name="RangeInfo" datasource="Mohsina180096">
				SELECT *
				 FROM Range;
				</cfquery>

			<cfif isDefined('form.select_Range')>
      <cfset page.select_Range = form.select_Range>
    </cfif>
    <cfif isDefined('form.select_Model')>
      <cfset page.select_Model = form.select_Model>
    </cfif>
    <cfoutput>
      <form name="RangeSelection" method="post">
        <cfquery name="get_Range" datasource="Mohsina180096">
        SELECT Range_ID, Range_Title
        FROM Range
        </cfquery>
        <select name="select_Range" required="yes" onChange="submit()">
          <option>Select Range</option>
          <cfloop query="get_Range">
            <option value="#Range_id#" <cfif isDefined('form.select_Range')><cfif form.select_Range eq "#Range_id#">selected</cfif></cfif>>#Range_Title#</option>
          </cfloop>
        </select>
        <cfif isDefined('form.select_Range')>
          <cfquery name="get_Model" datasource="Mohsina180096">
          SELECT Model_id, Model_Title
          FROM Model 
          WHERE Range_ID = '#page.select_Range#';
          </cfquery>
          <select name="select_Model" required="yes" onchange="submit()" >
          <option>Select Model</option>
          <cfloop query="get_Model">
            <option value="#Model_id#" <cfif isDefined('form.select_model')><cfif form.select_model eq "#Model_id#">selected</cfif></cfif>>#Model_Title#</option>
          </cfloop>
        </cfif>
        </select>
        <cfif isDefined('form.select_Model')>
          <cfquery name="get_Property" datasource="Mohsina180096">
          SELECT  *
          FROM (Range INNER JOIN Model ON Range.[Range_ID] = Model.[Range_ID]) INNER JOIN Locality_Prop ON Model.[Model_ID] = Locality_Prop.[Model_ID]
          Where Locality_Prop.Model_ID = '#page.select_Model#'
          ORDER BY Locality_Prop.Price;
          </cfquery>
          <select name="selectProperty_id" required="yes" onchange="submit()">
          <option>Select property</option>
          <cfloop query="get_Property">
            <option value="#Prop_id#" <cfif isDefined('form.selectVehicle_id')><cfif form.selectVehicle_id eq "#Prop_id#">selected</cfif></cfif>>#Property_Name#::#Price# OMR</option>
          </cfloop>
        </cfif>
        </select>
      </form>
    </cfoutput>
    <cfif isDefined('form.selectProperty_id')>
      <cfoutput query="get_Property">
        <cfset the_vehicle_id = #form.selectProperty_id#>
			<div class="details" style="border-style:solid;"><center>
								<img src="#Property_img#" alt="" width="250" height="177" />							
								<p><b>Property_Name</b>:#Property_Name#<br>
								<b>Property ID</b> :#Prop_Id#<br>
								<b>Price</b>:#Price#</p><br>
	        
			<a href="property.cfm?theProperty=#the_vehicle_id#"class="button alt">Get Started</a></center>
			</div>
			
      </cfoutput>
    </cfif>
    <div> </div>
  </div>
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