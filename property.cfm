<cfif not IsDefined("url.theProperty")>
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
				/* Style the Image Used to Trigger the Modal */
						#myImg {
						  border-radius: 5px;
						  cursor: pointer;
						  transition: 0.3s;
						}
						
						#myImg:hover {opacity: 0.7;}
						.row {
							  display: flex;
							}
						/* The Modal (background) */
						.modal {
						  display: none; /* Hidden by default */
						  position: fixed; /* Stay in place */
						  z-index: 1; /* Sit on top */
						  padding-top: 100px; /* Location of the box */
						  left: 0;
						  top: 0;
						  width: 100%; /* Full width */
						  height: 100%; /* Full height */
						  overflow: auto; /* Enable scroll if needed */
						  background-color: rgb(0,0,0); /* Fallback color */
						  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
						}
						
						/* Modal Content (Image) */
						.modal-content {
						  margin: auto;
						  display: block;
						  width: 80%;
						  max-width: 700px;
						}
						
						/* Caption of Modal Image (Image Text) - Same Width as the Image */
						#caption {
						  margin: auto;
						  display: block;
						  width: 80%;
						  max-width: 700px;
						  text-align: center;
						  color: #ccc;
						  padding: 10px 0;
						  height: 150px;
						}
						
						/* Add Animation - Zoom in the Modal */
						.modal-content, #caption {
						  animation-name: zoom;
						  animation-duration: 0.6s;
						}
						
						@keyframes zoom {
						  from {transform:scale(0)}
						  to {transform:scale(1)}
						}
						
						/* The Close Button */
						.close {
						  position: absolute;
						  top: 15%;
						  right: 35px;
						  color: #f1f1f1;
						  font-size: 40px;
						  font-weight: bold;
						  transition: 0.3s;
						}
						
						.close:hover,
						.close:focus {
						  color: #bbb;
						  text-decoration: none;
						  cursor: pointer;
						}
						
						/* 100% Image Width on Smaller Screens */
						@media only screen and (max-width: 700px){
						  .modal-content {
							width: 100%;
						  }

						
        </style>
		<script>
			// Get the modal
				var modal = document.getElementById("myModal");
				
				// Get the image and insert it inside the modal - use its "alt" text as a caption
				var img = document.getElementById("myImg");
				var modalImg = document.getElementById("img01");
				var captionText = document.getElementById("caption");
				img.onclick = function(){
				  modal.style.display = "block";
				  modalImg.src = this.src;
				  captionText.innerHTML = this.alt;
				}
				
				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];
				
				// When the user clicks on <span> (x), close the modal
				span.onclick = function() {
				  modal.style.display = "none";
				}
				
				</script>

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
					 
							
							
							<cfquery name="GetModelID"  datasource="Mohsina180096">
								SELECT Model_ID ,Model_Title
									FROM Model
									WHERE Active = Yes
									ORDER BY Model_Title;
								
							</cfquery>
							<cfquery name="GetPropertyInfo"  datasource="Mohsina180096">
							SELECT *
								 FROM Locality_Prop
								 Where Prop_ID='#Trim(url.theProperty)#' AND ACTIVE=YES ;
								 
								
							</cfquery>
							<cfquery name="GetThumbnails"  datasource="Mohsina180096">
							SELECT *
								 FROM Thumbnails
								 Where Prop_ID='#Trim(url.theProperty)#';
								 
								
							</cfquery>
							<cfif GetPropertyInfo.recordCount eq 0>
					  <cfoutput>
						<h3> No Records Found</h3>
					  </cfoutput>
					  <cfelse>
							
							<CFOUTPUT QUERY = "GetPropertyInfo">				
					  <cfset Range_id = #Range_id#>
					  <cfset Model_id = #Model_id#>
					  <cfset Location_id = #Location_id#>
					  
					</cfoutput>
									
							
							

			<cfquery name="bread_Range" DATASOURCE="Mohsina180096">
					SELECT *
						FROM Range
						WHERE Range_ID = '#Range_id#'
					</CFQUERY>
					<cfquery name="bread_Model" DATASOURCE="Mohsina180096">
					SELECT *
						FROM Model
							WHERE Model_ID = '#Model_id#'
					</CFQUERY>
					<cfquery name="bread_Location" DATASOURCE="Mohsina180096">
					SELECT *
						FROM Location
						WHERE Location_ID = '#Location_id#'
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
			
			

		
			<!--breadcrumb tail-->
				<p class="breadcrumb">
			
				<a class="crumb" href="home.cfm"
					 title="Go to the home page">HOME </a><span class="style1">&gt;</span>
					  <cfoutput query="bread_Range">
				  <a class="crumb" href="range.cfm?theRange=#Range_id#" title="#Range_Title#">#bread_Range.Range_Title#</a><span class="style1">&gt;</span></cfoutput>
				   <cfoutput query="bread_Model">
				 <a class="crumb" href="model.cfm?theModel=#Model_id#&amp;theRange=#bread_Range.Range_id#">#bread_Model.Model_Title#</a><span class="style1">&gt;</span></cfoutput>
			
				  
				 <cfoutput query="bread_Location">
				 <a class="crumb" href="locationprop.cfm?theLocation=#bread_Location.Location_id#&amp;theModel=#Model_id#">#bread_Location.Location_Title#</a><span class="style1">&gt;</span>
				  <a class="crumb" href="">#GetPropertyInfo.Prop_Id#</a>
				  <h6 style="padding-left:5%;">Welcome to the #GetPropertyInfo.Prop_Id# Property page</h6></cfoutput>
				  
				 
							
			

		<!--main-->	
				
					
			
			<section >
			
				<div class="inner">
				<cfoutput query="GetPropertyInfo">
				<section id="two">
			<div class="inner style2">
				<article style="padding:0% 5% 5% 2%;">
				
					<div class="content" style="width:100%;">
							
						<h1 >#GetPropertyInfo.Property_Name#</h1>
							
					
					<div class="image fit">
								<img src="#GetPropertyInfo.Property_img#" alt="" width="200" height="275" />																		                   </div>
							</cfoutput>
							<!-- Trigger the Modal -->
							<div class="row" style="width: 30%;">
							 <cfoutput query="GetThumbnails">
								<img id="myImg" src="#URL#" style="width:100%;max-width:300px">
									</cfoutput>
								
								<!-- The Modal -->
								<div id="myModal" class="modal">
								
								  <!-- The Close Button -->
								  <span class="close">&times;</span>
								
								  <!-- Modal Content (The Image) -->
								  <cfoutput query="GetThumbnails">
								  <img class="modal-content" id="img01">
								</cfoutput>
								  <!-- Modal Caption (Image Text) -->
								  <div id="caption"></div>
								</div>
								</div>
								</div>
							
				</article>
				<article style="padding:5% 0% 2% 0%;">
					<div class="content">
					
							
						<header>
						<cfoutput query="GetPropertyInfo">
				      <b>Property Name:</b> #GetPropertyInfo.Property_Name#<br>
						<b> Property Buildup Area(sq.ft):</b> #GetPropertyInfo.BuildupArea#<br>
						  <b> Property Facing :</b> #GetPropertyInfo.Facing#<br>
						  <b> Property Colour :</b> #GetPropertyInfo.Colour#<br>						 
						  <b> Property Location :</b> #GetPropertyInfo.Location#<br>
						    <b> Property Price(OMR):</b> #GetPropertyInfo.Price#<br>
							 <b>Additional Amenities:</b> #GetPropertyInfo.AdditionalAmenities#<br>
								<b> Additional Amenities:</b> #GetPropertyInfo.Prop_Info#<br>
								<center><a href="Login.cfm?theProperty=#GetPropertyInfo.Prop_ID#"class="button alt">BUY NOW</a></center>
							</cfoutput>
						</header>
						
					</div>
				</article>
				
		    </div>
			</cfif>
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
			<script src="../assets/js/Slideshow.js"></script>
			
	</body>
</html>