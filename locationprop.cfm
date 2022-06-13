<cfif not IsDefined("url.theModel")>
   <cflocation url="home.cfm">
 </cfif>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Sindbad Real Estate</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	 <style type="text/css">
			<!--
			.style1 {color: #000000}
			.style2{ border:#666666;
			border-style:solid;
			}
			
			-->
			 
					 
					 
		p.breadcrumb {
				margin-top: 0px;
				padding-top: 2%;
				
 			   padding-left: 7%;
			   padding-bottom:0%;

			}
			crumb{
			color:#000000;
			}
			
				/* Create three equal columns that floats next to each other */
				.column {
				  float: left;
				  width: 33.33%;
				  padding: 10px;
				  height: 300px; /* Should be removed. Only for demonstration */
				}
				
				/* Clear floats after the columns */
				.row:after {
				  content: "";
				  display: table;
				  clear: both;
				}
				
        </style>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="index.cfm" class="logo">Sindbad</a>
				  <nav id="nav" >
					
					  <cfquery name = "GetRangeID" datasource = "Mohsina180096">
					    SELECT *
					    FROM range
					    WHERE Active = Yes
					    ORDER BY Range_Title;
				      </cfquery>
					  <cfquery name="GetModelInfo"  datasource="Mohsina180096">
							SELECT *
							   FROM Model
								   WHERE Model_ID= '#Trim(url.theModel)#';
							</cfquery>
							
							 <cfquery name="GetLocationId"  datasource="Mohsina180096">
							SELECT *
							   FROM Location
								   WHERE Location_ID= '#Trim(url.theLocation)#';
							</cfquery>
							<cfquery name="GetModelID"  datasource="Mohsina180096">
								SELECT Model_ID ,Model_Title
									FROM Model
									WHERE Active = Yes
									ORDER BY Model_Title;
								
							</cfquery>
							<cfquery name="GetPropertyInfo"  datasource="Mohsina180096">
							SELECT *
								 FROM Locality_Prop
								 Where Model_ID='#Trim(url.theModel)#' AND Location_ID='#Trim(url.theLocation)#' AND ACTIVE=YES ;
								 
								
							</cfquery>
							<cfif GetPropertyInfo.recordCount eq 0>
					  
						<a href="home.cfm"><h3 style="padding:25% 10%;"> SORRY , NO PROPERTIES FOUND UNDER THIS SECTION .PLEASE TRY AGAIN WITH OTHER SPECIFICATIONS.Click here to go Home. </h3></a>
						
					
					  <cfelse>
							
							<CFOUTPUT QUERY = "GetModelInfo">				
					  <cfset Range_id = #Range_id#>
					</cfoutput>
									
							
							<cfquery name="GetLocationInfo" datasource="Mohsina180096">
							 SELECT * 
									from Location
									WHERE ACTIVE=YES
									ORDER BY Location_Title;
                     </cfquery>

			<cfquery name="bread_Range" DATASOURCE="Mohsina180096">
					SELECT *
						FROM Range
						WHERE Range_ID = '#Range_id#'
					</CFQUERY>
				    
					<p><a href="home.cfm" title="Go to Homepage">Home</a>
					  <cfoutput query="GetRangeID">
					    <a href="Model.cfm?theRange=#GetRangeID.Range_ID#" title="Go to the #GetRangeID.Range_Title# page">#GetRangeID.Range_Title#</a>				      </cfoutput>
				    	<a href="query.html" title="Go to Queries page">Queries</a>
					</p>
				  </nav>
				</div>
			</header>
			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
			
			<CFOUTPUT QUERY = "GetModelInfo">				
					  <cfset Range_id = #Range_id#>
					</cfoutput>

			<cfquery name="bread_Range" DATASOURCE="Mohsina180096">
					SELECT *
						FROM Range
						WHERE Range_ID = '#Range_id#'
					</CFQUERY>
			<!--breadcrumb tail-->
				<p class="breadcrumb">
			
				<a class="crumb" href="home.cfm"
					 title="Go to the home page">HOME </a><span class="style1">&gt;</span>
					  <cfoutput query="bread_Range">
				  <a class="crumb" href="range.cfm?theRange=#Range_id#" title="#Range_Title#">#bread_Range.Range_Title#</a><span class="style1">&gt;</span></cfoutput>
				  <cfoutput query="GetModelInfo">
				 <a class="crumb" href="model.cfm?theModel=#Model_id#&amp;theRange=#bread_Range.Range_id#">#GetModelInfo.Model_Title#</a><span class="style1">&gt;</span></cfoutput>
			
				 <cfoutput query="GetLocationId">
				 <a class="crumb" href="model.cfm?theModel=#GetModelInfo.Model_id#&amp;theRange=#bread_Range.Range_id#">#Location_Title#</a><span class="style1">&gt;</span></cfoutput>
				 
				 <a class="crumb" href="">PROPERTY LIST</a>
				 <h6 style="padding-left:5%;">Welcome to the Property list page</h6>
				 
								

		<!--main-->			
		
					
					<section id="main" >
				<div class="inner">
				<center><h2 style="color:#666666;">SELECT FROM OUR PROPERTIES</h2><HR></center>
					<header class="major special">
			        
					 <ul>
					
					 <li> <cfoutput query="GetPropertyInfo">
					<article style="padding:0% 0% 2% 2%;">
						<div class="content">
						
							<header>
								<h2 >#GetPropertyInfo.Property_Name#</h2>
							</header>
							<div class="image fit">
								<img src="#GetPropertyInfo.Property_img#" alt="" style="padding-left:25%; padding-right:25%; height:300px;" />																		                   </div>
							 <center><p> <B>Property Name</B>: #GetPropertyInfo.Property_Name#</p>
						  <p> <B> Property Buildup Area(sq.ft)</B>: #GetPropertyInfo.BuildupArea#</p>
						  <p> <B>Property Facing</B> : #GetPropertyInfo.Facing#</p>
						 
						  <p> <B>Property Location</B> : #GetPropertyInfo.Location#</p>
						    <p><B> Property Price(OMR)</B>: #GetPropertyInfo.Price#</p></center>
							<ul class="actions">
						<center><a href="property.cfm?theProperty=#Prop_ID#" class="button alt">More Details</a></center>
					</ul>
						</div>
					</article>
					<hr>
					</cfoutput>
					</li>
					 </ul>
					
					</header>
					
				</div>
				
	</section>	



				
							
				
			
		<!-- Footer -->
			<section id="footer" style="padding-top:0%;">
				<div class="inner" >
				<section id="three" style="padding-bottom:0%;padding-top:2%;"><H2>Get in Touch</H2>
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
	</cfif>	
	</body>
</html>