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
			-->
			 ul{
					    padding-left:10%;
						padding-right:inherit;
					 
					 }
					 
					 
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
				li {
						  display: inline-flex;
						  width: 100%;
						  height: 100%;
						  padding: 5px ;				  				 
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
							 <cfquery name="GetRangeInfo"  datasource="Mohsina180096">
							SELECT *
							   FROM Model
								   WHERE Range_ID= '#Trim(url.theRange)#';
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
								  WHERE Range_ID='#Trim(url.theRange)#'  ;
								
							</cfquery>
							
							<CFOUTPUT QUERY = "GetModelInfo">				
					  <cfset Range_id = #Range_id#>
					</cfoutput>
					<cfquery name="GetlocationID"  datasource="Mohsina180096">
							SELECT *
							   FROM Location;
								  
							</cfquery>
							
							
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
				  <a class="crumb" href="Range.cfm?theRange=#Range_id#" title="#Range_Title#">#bread_Range.Range_Title#</a><span class="style1">&gt;</span></cfoutput>
				  <cfoutput query="GetModelInfo">
				 <a class="crumb" href="">#GetModelInfo.Model_Title#</a></p>
				 	<h6 style="padding-left:5%;">Welcome to the #GetModelInfo.Model_Title# page</h6></cfoutput>
								

		<!--main-->
		
		
					<!-- Second nav-->
				<div class="row">
				  <div class="column" style="background-color:#CCCCCC; padding-left:10%;">
					<ul>
					<li><H4>SELECT FROM OUR MODELS</H4></li>
							<cfoutput query="GetRangeInfo">
							
							<li><a href="model.cfm?theModel=#GetModelInfo.Model_ID#&amp;theRange=#GetRangeInfo.Range_ID#" title="Go to the #GetRangeInfo.Model_Title# page">#GetRangeInfo.Model_Title#</a>	</li>
										      </cfoutput>
											  </ul>
				  </div>
				  
				  <!-- Range Information-->
				  <div class="column" style="background-color:#FFFFFF;">
					<div class="inner">
					<header class="major special">  
					
						<ul>
						<li>	 
					 
						 <cfoutput query="GetModelInfo">
						 <article >
						<div class="content">
						
							<header>
								<h1 align="center">#GetModelInfo.Model_Title#</h1><HR>
							</header>
							
							<center><p>#GetModelInfo.Model_Info#</p><center>
							
						</div>
					</article>
					</cfoutput>
					</li>
					 </ul>
					 
					</header>
					
				</div>
				  </div>
				  <!--Model Pic-->
				  <div class="column" style="background-color:#ccc;">
					<cfoutput query="GetModelInfo">
					<div class="image fit">
								<img src= "#GetModelInfo.Model_Img#" alt="" width="200" height="275" />							</div>
								</cfoutput>
				  </div>
				</div>					
	
					</li>
					 </ul>
					 
					</header>
					
				</div>
			</section>
		
		<!-- Locality section -->
			<section id="main" >				
				<div class="inner">
				<h2 align="center">SELECT FROM A VARIETY OF LOCATIONS</h2>
					<header class="major special">
			         
							
                     
					 <ul>
					 
					<li> <cfoutput query="GetLocationInfo"><article style="margin-right:10%">
						<div class="content">
						
							<header>
								<h3 align="center">#GetLocationInfo.Location_Title#</h3>
							</header>
							<div class="image fit">
								<img src="#GetLocationInfo.Location_Img#" alt="" width="458" height="177" />							</div>
							<center><p>#GetLocationInfo.Location_Info#</p></center>
							<ul class="actions">
							
						<center><li><a href="locationprop.cfm?theLocation=#GetLocationInfo.Location_ID#&amp;theModel=#GetModelInfo.Model_ID#"class="button alt">Get Started</a></li></center>
					</ul>
						</div>
					</article>
					</cfoutput>
					</li>
					 </ul>
					 
					</header>
					
				</div>
			</section>	
		<!--Property section-->
		
		<section id="main" style="padding-top:0%;" >				
				<div class="inner">
				<h2 align="center">CHECK OUT OUR PROPERTIES</h2>
					<header class="major special">
			         
							
                     
					 <ul>
					 
					<li> 	<cfoutput query="GetPropertyInfo"><article style="margin-right:10%">
						<div class="content">
						
							<header>
								<h3 align="center">#GetPropertyInfo.Property_Name#</h3>
							</header>
							<div class="image fit">
								<a href="property.cfm?theProperty=#Prop_ID#"><img src="#GetPropertyInfo.Property_img#" alt="" width="200" height="275" /></a>							</div>
								<center><p>#GetPropertyInfo.Prop_Info#</p></center>
							<center><p>#GetPropertyInfo.Price#</p></center>
							<center><li><a href="property.cfm?theProperty=#Prop_ID#" class="button alt">More Details</a></li></center>
							
						</div>
					</article>
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

	</body>
</html>