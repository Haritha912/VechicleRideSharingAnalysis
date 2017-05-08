 <%@ page import="java.io.*,java.util.*" %>

<html>
<head>
<%
String phone=request.getParameter("phone");
%>
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
	background-color: #E7E025;
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
    ), url("/taxi/images/taxi.jpg");

}


  </style>
  <script type="text/javascript">
  $(document).ready(function(){
  	var source,destination;
 	var xhttp3 = new XMLHttpRequest();
    xhttp3.open("GET", "updateavailability.jsp?phone="+<%=phone%>+"&availability=1", true);
    xhttp3.send(); 
 	$("#index").click(function(){
 		var old;
        $("#loading").show();
        $("#index").hide();
        var xhttp = new XMLHttpRequest();
        var xhttp1 = new XMLHttpRequest();

           xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	var obj = JSON.parse(this.responseText);
    	$.ajax({
   url: 'delete.jsp?val='+<%=phone%>,type: 'GET'
});
    	if(old!=obj.contact)
    	{
        $('#response').append("<BR>Contact: "+obj.contact+"&nbsp; Source:"+obj.source+"&nbsp; Destination: "+obj.destination);
        source=obj.source;
        destination=obj.destination;
        old=obj.contact;
        }
         

    }
        
  };
                setInterval(function() {
                      xhttp.open("GET", <%=phone%>+".txt", true);
                      xhttp.send(); 
                  
                }, 3000);
    });
    
      	$("#stop").click(function(){
      		var xhttp3 = new XMLHttpRequest();
    xhttp3.open("GET", "updateavailability.jsp?phone="+<%=phone%>+"&availability=0", true);
    xhttp3.send(); 
      		window.open("ride.jsp?source="+source+"&destination="+destination+"&phone="+<%=phone%>,"_self");
      	});
});
  	
  </script>
</head>
<body>
<div id="wrapper" >
	

<center>
<div id="index" style="display:inline-block; margin-top: 10%;width: 100%;">
	<button id="start" class="text button">start</button>
</div>
<div id="loading" style="display:inline-block; display: none;">
	<h2 style="color: white;">loading...</h2>	<button id="stop" class="text button">start ride</button>
	<br><br><h2 style="color: white;">Customer details!!</h2>
</div>
<div id="response" style="color: white;"></div></div>
</center>
</html>