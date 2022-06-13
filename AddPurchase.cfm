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
				.invoice{
				padding: 2% 10% 2% 10%;
				border-style:solid;
				border-color:#666666;
				}
				
        </style>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="index.cfm" class="logo">Sindbad</a>
				  <nav id="nav" >
				  <p><a href="home.cfm" title="Go to Homepage">Home</a>
					 
				    	<a href="query.html" title="Go to Queries page">Queries</a>
					</p>
				  </nav>
				</div>
			</header>
<body>
<cfquery name="GetPropertyInfo"  datasource="Mohsina180096">
			SELECT *
				FROM Locality_Prop
				Where Prop_ID='#form.Prop_Id#';						 
								
							</cfquery>
		<cfquery name="GetProperty"  datasource="Mohsina180096">
			SELECT *
				FROM Locality_Prop;						 
								
							</cfquery>

				<cfquery name="GetClientInfo"  datasource="Mohsina180096">
			SELECT *
				FROM Client
				where Client_ID=#form.Client_Id#;				 
								
							</cfquery>
							

  <cfif GetProperty.recordCount gt 0>

	<cfquery name="insertPurchase" datasource="Mohsina180096">
		INSERT INTO Purchase(Prop_ID,Client_ID,Payment_Type,Payment_Mode,No_Installments,Final_Price) VALUES('#form.Prop_Id#',#form.Client_Id#,'#form.payment#','#form.method#',0,#form.finalp#);
		</cfquery>
			<cfoutput >
				<center><h1 style="padding-top:2%;">Payment Successful!</h1></center>
				 <div class="invoice" >
				 	<center><h1>Purchase invoice</h1></center>
					
					<p><b>Invoice no:</b> 001256</p>
					<p><b> Customer Name:</b>#GetClientInfo.Client_Forename#</p>
					<p><b> Property Name:</b> #GetPropertyInfo.Property_Name#</p>
					<p><b> Property_ID:</b>#form.Prop_Id#</p>
					 <p><b>Price:</b>#GetPropertyInfo.Price#</p>
					<p><b> Pyment Type:</b>'#form.payment#'</p>
					<p><b> Total Amount:</b>#form.finalp#</p>
					 
					 <h3>Thank you for purchasing from Sindbad Real Estate. Please take a screenshot of this invoice and please go to your nearest Sindbad store to make the cash payment within 7 days . If failed to make payment before 7 days the purchase will be cancelled.<h3>
					
				 
				 </div>
			</cfoutput>
				
				  
		 <cfelse>
		 <cfoutput>
    <h3> <strong>Error: Payment was unsuccessful <a href=<a href="Purchase.cfm?theProperty=#form.Prop_Id#&amp;theClient=#form.Client_Id#">try again</a></strong> </h3>

  </cfoutput>
				 </cfif>


	
			
			
			
		

	</body>
</html>