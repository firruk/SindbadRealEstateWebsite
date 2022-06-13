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
<body>

  <cfquery name="CheckEmail" datasource="Mohsina180096">
  Select * from Client 
  Where Email_Address = '#form.Email#';
  </cfquery>
   <cfif CheckEmail.recordCount eq 0>

	<cfquery name="insertclient" datasource="Mohsina180096">
		INSERT INTO Client(Client_Forename, Client_Surname, Client_Address_Line1, Client_Address_Line2, Town, Postcode, Email_Address, Telephone_No, Mobile_No,Client_Password)
		VALUES ('#form.Fname#','#form.Sname#','#form.Addressline1#','#form.Addressline2#','#form.Town#','#form.Postcode#','#form.Email#','#form.Phoneno#','#form.Mobileno#','#form.Passwd#')
		</cfquery>
			<cfoutput>
				<h1>registered successfully!</h1>
			</cfoutput>
				
				   <cflocation url="home.cfm" addtoken="no">
		 <cfelse>
    <h3> <strong>Error: The Email Address is already registered. Please <a href=
		" ClientRegistration.html">try again</a></strong> </h3>
  </cfif>
  
				 

</body>
</html>
