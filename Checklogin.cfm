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
				  <p><a href="home.cfm" title="Go to Homepage">Home</a>
					 
				    	<a href="query.html" title="Go to Queries page">Queries</a>
					</p>
				  </nav>
				</div>
			</header>
<cfquery name="GetPropertyInfo"  datasource="Mohsina180096">
							SELECT *
								 FROM Locality_Prop
								 Where Prop_ID='#Trim(url.theProperty)#' AND ACTIVE=YES ;
								 
								
							</cfquery>

 <cfquery name="checklogin" datasource="Mohsina180096">
	
	Select * 
	from CLIENT
	Where Email_Address = '#form.Email#' AND Client_Password= '#form.passwd#'; 
	
</cfquery>
  <cfif checklogin.recordCount >
				<cfoutput query="checklogin">
			
			  <meta http-equiv='refresh' content='0; URL=Purchase.cfm?theProperty=#GetPropertyInfo.Prop_ID#&amp;theClient=#checklogin.Client_ID#'>
			
			</cfoutput>
				<cfelse>
			<cfoutput query="GetPropertyInfo">
				<h3 style="padding:10% 10% 0% 10%;">Error: The username or password you entered is incorrect. Please </h3> <a href="Login.cfm?theProperty=#GetPropertyInfo.Prop_ID#"><h3 style="padding:0% 10% 0% 10%;">try again</h3></a>	
				</cfoutput>
				</cfif>
				 


</html>