
			function validate()
			{
				var CARD=document.forms[0].CARD.value;
				var CVV=document.forms[0].CVV.value;
				
				
				if (isNaN(CARD) ||CARD.value.length < 17)
				{
					alert("only digits are allowed and should enter 16 digit Credit Card Number");
					document.forms[0].CARD.focus();
					document.forms[0].CARD.value="";
					
					return false;
				}
				 if (isNaN(CVV) || CVV.value.length < 5 )
				{
					alert("only digits are allowed and should enter 4 digit CVV number");
					document.forms[0].CVV.focus();
					document.forms[0].CVV.value="";
					
					return false;
				}
				
				
			
				
				
			
			}
			
			
			
    function showPayment(){
        getSelectValue = document.getElementById("payment").value;
        if(getSelectValue == "Creditcard"){
            document.getElementById("hidden_div").style.display="block";
        }else{
            document.getElementById("hidden_div").style.display="none";
        }
    }
	function showMethod(){
        getSelectValue = document.getElementById("method").value;
        if(getSelectValue == "Installments"){
            document.getElementById("hidden_div_method").style.display="block";
        }else{
            document.getElementById("hidden_div_method").style.display="none";
        }
    }


				function rangeSlide(value) {
					document.getElementById('rangeValue').innerHTML = value;
					
					
					
													}
													
				function Price(value){
       			 
				var year=parseInt(value);
				var int=0;
				var ttl=0;
				var price=parseInt(document.forms[0].price.value);
				
				if (year<=12){
					
					int= price*0.025*year;
					ttl= price + int;
						
					   document.getElementById("finalp").value = ttl.toFixed(3);
				}
				else{
				int= price*0.039*year;
					ttl= price + int;
						
					 document.getElementById("finalp").value = ttl.toFixed(3);
				
				}
				
    }
		function chkdiscount(value){
		var disc=value;
	
		var price=parseInt(document.forms[0].price.value);
		 getSelectValue = document.getElementById("method").value;
		 
		 var ttl=0;
			if (getSelectValue!= "Installments" && disc=="SUMMER10"){
			   ttl=price-(price*0.1);
			   document.getElementById("finalp").value = ttl.toFixed(3);
			}
		else if  (getSelectValue == "Installments"){
		alert("Sorry,the discount cannot be availed if payment method is installments");
		}
		else if  (value!="SUMMER10"){
			alert("Sorry the discount code is wrong");
		}
		else if  (value==" "){
			
		}
		}
