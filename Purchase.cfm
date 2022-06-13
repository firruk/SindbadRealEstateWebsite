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
						
				
				#rangeValue {
				  position: relative;
				  display: block;
				  text-align: center;
				  font-size: 2em;
				  color: #CC0000;
				  font-weight: 400;
				}
				.range {
				  width: 100%;
				  height: 15px;
				  -webkit-appearance: none;
				  background:#CCCCCC;
				  outline: none;
				  border-radius: 15px;
				  overflow: hidden;
				
				}
				.range::-webkit-slider-thumb {
				  -webkit-appearance: none;
				  width: 15px;
				  height: 15px;
				  border-radius: 50%;
				  background: #CCCCCC;
				  cursor: pointer;
				  border: 4px solid #333333;
				  box-shadow: -407px 0 0 400px ##333333;
				}
				.field{
					height:94.250;
					width:376.203;
				
				}
				
				
				
					
						
        </style>
			

	<script src="assets/js/scripted.js"></script>
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
					
							
							 <cfquery name="GetLocationId"  datasource="Mohsina180096">
							SELECT *
							   FROM Location;
								
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
								 Where Prop_ID='#Trim(url.theProperty)#';
								 
								
							</cfquery>
							<cfquery name="GetClientInfo"  datasource="Mohsina180096">
							SELECT *
								 FROM Client
								 Where Client_ID=#Trim(url.theClient)#;
								 
								
							</cfquery>
							
							<cfif GetPropertyInfo.recordCount eq 0>
					  <cfoutput>
						<h3> No Records Found</h3>
					  </cfoutput>
					  <cfelse>
							
						
					<CFOUTPUT QUERY = "GetPropertyInfo">				
					  <cfset Model_id = #Model_Id#>
					  <cfset Location_id = #Location_ID#>
					   <cfset Range_id = #Range_id#>
					</cfoutput>
					<cfquery name="GetPropertylist"  datasource="Mohsina180096">
							SELECT *
								 FROM Locality_Prop								
								 WHERE Active = Yes AND Model_ID='#Model_Id#' AND Location_ID='#Location_ID#';	 
								
							</cfquery>
							 <cfquery name="GetModelInfo"  datasource="Mohsina180096">
							SELECT *
							   FROM Model
							   Where Range_ID='#Range_id#';
								
							</cfquery>
									
							
							<cfquery name="GetLocationInfo" datasource="Mohsina180096">
							 SELECT * 
									from Location
									WHERE Location_ID='#Location_id#';
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
				<cfoutput query="GetPropertyInfo">
				 <a class="crumb" href="model.cfm?theModel=#GetModelInfo.Model_id#&amp;theRange=#bread_Range.Range_id#">#GetLocationInfo.Location_Title#</a><span class="style1">&gt;</span></cfoutput>
				 <cfoutput query="GetPropertyInfo">
				 <a class="crumb" href="property.cfm?theProperty=#Prop_ID#">#Prop_ID#</a><span class="style1">&gt;</span></cfoutput>
				 <a class="crumb" href="">PAYMENT</a>
				 <h6 style="padding-left:5%;">Welcome to the Payment page</h6>
				 
								

		<!--main-->			
		
		
					<!-- Second nav-->
				<div class="row">
				  <div class="column" style="background-color:#CCCCCC; padding-left:10%;">
					<ul>
					<li><H4>SELECT FROM OUR MODELS</H4></li>
							<cfoutput query="GetModelInfo">
							
							<li><a href="Model.cfm?theModel=#GetModelInfo.Model_ID#" title="Go to the #GetModelInfo.Model_Title# page">#GetModelInfo.Model_Title#</a>	</li>
										      </cfoutput>
											  </ul>
				  </div>
				  
				  <!-- Purchse info Information-->
				  <div class="column" style="background-color:#FFFFFF; padding-bottom:100%;">
					<div class="inner">
					<header class="major special">  
					
						<ul>
						<li>	 
					 
					
						 <article >
						<div class="content" >
						
							<header>
							
							<form id="form" name="form" method="post" action="AddPurchase.cfm" onSubmit="return validate()">
							<cfoutput query="GetPropertyInfo">
						<div class="field half first">
							<label>Property ID</label>
							<input type="text" name="Prop_ID" id="Prop_ID" value=" #Prop_ID#"  readonly/>
						</div>
						<div class="field half first">
							<label>Client ID</label>
								<input type="text" name="Client_Id" id= "Client_Id" value= "#GetClientInfo.Client_Id#"  readonly />
						</div>
							<div class="field ">
							<label>Registration Number</label>
								<input type="text" name="Reg_num" value= " #Registration_Number# " disabled="disabled" />
						</div>
						<div class="field">
							<label>Property Name</label>
								<input type="text" name="Prop_Name" value= " #Property_Name# " disabled="disabled" />
						</div>
						<div class="field half first">
						<label>Location</label>
								<input type="text" value= " #Location# " disabled="disabled" />
						</div>
						<div class="field half first">
							<label >Price</label>
							<input type="text"  name="price" value= " #Price# " disabled="disabled" />
						</div>
						</cfoutput>
						

						
						<div class="12u$">
						
										<div class="select-wrapper">
										<select id="payment" name="payment" onChange="showPayment()" required>
												<option value="">- Select Payment Type -</option>
											   <option value="cash">Cash</option>
											   <option value ="Creditcard">Credit Card</option>
											</select>
												</div>
											
							</div>
																				
											
										<div id="hidden_div" style="display: none;">	
																		
										
														<div class="field">
														
															<label>Enter Credit Card Number (Enter 16 Digit Card Number)</label>
															<input type="text" name="CARD" pattern="[0-9]{16,16}" placeholder="XXXX XXXX XXXX XXXX" id="CARD"  onChange="validate()" required/>
														</div>
														<div class="field">
															<label>Card Verification Value(Enter 4 Digit CVV  Number)</label>
																<input type="text" pattern="[0-9]{4,4}" name="CVV" placeholder="XXXX" id="CVV"  onChange="validate()" required/ >
														</div>
														
										</div>
														
												
											
							 
							 
									
						
						
							<div class="12u$">
										<div class="select-wrapper">
											<select name="method" id="method" onChange="showMethod()" required/>
												<option value="">- Select Payment Method -</option>
												<option value="Singlepayment">Single Payment</option>
												<option value="Installments">Installments</option>
											
											</select>
											
							 
							 
										</div>
											
							</div>
								<div id="hidden_div_method" style="display: none;" >												
										<Input class="range" type="range" name "range" value="0" min="0" max="24" onChange="rangeSlide(this.value)" onMouseMove="rangeSlide(this.value)" onClick="Price(this.value)"></Input>
													<span id="rangeValue" name="rangeValue" value="0" >0</span>
													
													
												
												
														
							<p > <strong>Please Note:</strong>Intrest Rate for first 12 months is 2.5% on total price of Real Estate <br/>
        if it is exceeding more than 12 months then Intrest Rate is 3.9% on total price of Real Estate.<br>
		The discount cannot be availed if payment method is installments </p>												
						</div>
						
						<div class="field half first">
							<label>Discount code</label>
								<input type="text" id="discount" name="discount" value=""  onChange="chkdiscount(this.value)"/>
						</div>
						<cfoutput query="GetPropertyInfo">
						<div class="field half first ">
							<label>Total price</label>
								<input type="text" id="finalp" name="finalp" value="#Price#" readonly="true" />
						</div>
						</cfoutput>
						
						<input type="submit" value="Pay">
						
					</form>
							
							</header>
							
						
							
						</div>
					</article>
				
					</li>
					 </ul>
					 
				
					
				</div>
				  </div>
				 
	<!--Tertiary nav-->
			
				  <div class="column" style="background-color:#CCCCCC; padding-left:2%;">
					<ul>
					<li><H4>AVAILABLE PROPERTIES</H4></li>
							<cfoutput query="GetPropertylist">
							
							<li><a href="property.cfm?theProperty=#Prop_ID#" title="Go to the #GetPropertylist.Property_Name# page">#GetPropertylist.Property_Name#</a>	</li>
										      </cfoutput>
											  </ul>
				  </div>
				</div>					
	
					
					 
					</header>
					
				</div>
			</section>
		
	
			
			
			</cfif>
			
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