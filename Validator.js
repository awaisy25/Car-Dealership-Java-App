//For car names
function validateCoverPage(e){
	var car = document.forms["NameCheck"]["Car"].value;
	if(car=="" || car==null ){
		e.preventDefault();
		return false;
	}
}
//for number values
function validateCoverPage2(e){
	var n = document.forms["NumCheck"]["Number"].value;
	if(n=="" || n==null){
		e.preventDefault();
		return false;
	}
}
function validateCustomerInfo(e){
	var name = document.forms["Customer"]["name"].value;
	var phone = document.forms["Customer"]["phone"].value;
	var email = document.forms["Customer"]["email"].value;
	if(name=="" || null){
		e.preventDefault();
		document.getElementById("errorMessage").innerHTML = "Enter Name";
		document.getElementById("errorMessage").style.color = "red";
		document.getElementById("errorMessage").style.position = "absolute";
		document.getElementById("errorMessage").style.left="60px";
		return false;
	}if(phone=="" || null){
		e.preventDefault();
		document.getElementById("errorMessage").innerHTML = "Enter Phone Number";
		document.getElementById("errorMessage").style.color = "red";
		document.getElementById("errorMessage").style.position = "absolute";
		document.getElementById("errorMessage").style.left="260px";
		return false;
	}if(email=="" || null){
		e.preventDefault();
		document.getElementById("errorMessage").innerHTML = "Enter Email";
		document.getElementById("errorMessage").style.color = "red";
		document.getElementById("errorMessage").style.position = "absolute";
		document.getElementById("errorMessage").style.left="460px";
		return false;
	}
}


