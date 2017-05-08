<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <style>
  	.text {
	border:1px solid grey;
	border-radius:26px;
	height: 6%;
	width: 17%;
	padding: 15px 20px;
	
}

.button{
	background-color: #900EEB;
	color: white;
}
.mybtn{
	float: right;
	width: 10%;
	height: 100%;
	color: white;
	background-color: #6D91A6;
    
}
.mybtn : focus {
	width: 20%;
	color: white;
}


#wrapper{
	width: 100%;
	height: 100vh;
	background-image:linear-gradient(
      rgba(0, 0, 0, .4), 
      rgba(0, 0, 0, .4)
    ), url("/taxi/images/admin.jpg");

}


  </style>
 <script>
$(document).ready(function(){

	$("#title").fadeIn(3000);
	
	$("#feedback").hide();
	$("#driver").hide();
	
    $("#driverbtn").click(function(){
        $("#driver").fadeIn(800);
        $("#feedback").hide();
        
    });
    $("#feedbackbtn").click(function(){
        $("#feedback").show();
        $("#driver").hide();
        
    });
    $("#driverloginbtn").click(function(){

      	var member=document.getElementById("member");
      	var password=document.getElementById("driverpassword")
      	var name=document.getElementById("drivername")
      	var phone=document.getElementById("driverphone")
      	var cartype=document.getElementById("cartype")
      	var driverlocation=document.getElementById("driverlocation")
         var xhttp = new XMLHttpRequest();
  		 xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
         	$("#driver").hide();
         	$("#index").show();

         	console.log(this.responseText.trim())
         	document.getElementById("response").innerHTML ="<br><h2>"+this.responseText+"</h2>";
         	
         }
         };
         console.log("adddriver.jsp?member="+member.value+"&password="+password.value+"&name="+name.value+"&phone="+phone.value);
       xhttp.open("GET", "adddriver.jsp?member="+member.value+"&password="+password.value+"&name="+name.value+"&phone="+phone.value+"&cartype="+cartype.value+"&driverlocation="+driverlocation.value, true);
        xhttp.send();
        });
    $("#feedbackbtn").click(function(){
    	window.open("analysis.jsp","_self");

    });

	});
	</script>
  <body>
  <center>
<div id="wrapper" >


<div id="index" style="display:inline-block; margin-top:3%; width: 100%">
<div id="title" style="display:inline-block; margin-top:3%; width: 100%;color: white;display: none;">
  <h1>Admin Console !!!</h1>
</div><br><br>
<button id="driverbtn" class="text button">Driver Register</button>
<button id="feedbackbtn" class="text button">Feedback</button>
</div>
<div id="driver" style="display:inline-block;margin-top:3%;width:100%;">
   <input type=number id="driverphone" class="text"  placeholder="phone"/><br><br>
   <input type=text id="drivername" class="text"  placeholder="name"/><br><br>
   <input type=text id="driverlocation" class="text"  placeholder="location"/><br><br>
   <input type=text id="cartype" class="text"  placeholder="cartype"/><br><br>
   <input type=text id="member" class="text"  placeholder="member"/><br><br>
   <input type=password id="driverpassword" class="text" placeholder="password"/><br><br>
   <button id="driverloginbtn" class="text button">submit</button>
</div>
<div id="response" style="color: white;">
</div>
</div>
</body>
</center>