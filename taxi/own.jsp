<%@ page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
 String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
String vehicleid=request.getParameter("name");
 String servicedate=new String();  
 String buydate=new String();
 String cc=new String();
 String type=new String();
   String password=request.getParameter("password");
Connection conn = null;
 Statement stmt = null;
  Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
 stmt = conn.createStatement();
 String sql = "select * from RTO where vehicleid="+vehicleid+" and password='"+password+"'";
ResultSet rs=stmt.executeQuery(sql);
             
 if(rs.next()){
 servicedate=rs.getString("lastservice");
 buydate=rs.getString("buydate");
 cc=rs.getString("vehiclecc");
 type=rs.getString("vehicletype");
 rs.close();
 }

 if(type.equals("1"))
  type="Petrol";
 else
  type="Deisel";

 Date date=new Date();

Date serviceday=new Date();
Date buyday=new Date();
DateFormat formatter = new SimpleDateFormat("yyyyMMdd");
serviceday=formatter.parse(servicedate);
buyday=formatter.parse(buydate);
int d1 = Integer.parseInt(formatter.format(serviceday));
int d3 = Integer.parseInt(formatter.format(buyday));
int d2 = Integer.parseInt(formatter.format(date));
int age = (d2-d1)/10000;
int buyage = (d2-d3)/10000;
%>

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
  background-color: #1161ee;
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
    ), url("/taxi/images/bike.jpg");

}


  </style>
  <script>
  $(document).ready(function(){
  	$("#ride").hide();
  	$("#service").hide();
      $("#title").fadeIn(3000);

  	    $("#ridebtn").click(function(){

  	    	$("#ride").show();
          $("#service").hide();

});
  	       $("#servicebtn").click(function(){
          $("#ride").hide();
  	    	$("#service").show();

});
  	     $("#ownridesubmit").click(function(){
  	     	var source=document.getElementById("from");
      	var destination=document.getElementById("to");

  	   window.open("ride.jsp?phone="+<%=vehicleid%>+"&own=true&age="+<%=age%>+"&buy="+<%=buyage%>+"&source="+source.value+"&destination="+destination.value,"_self");

});
  	      $("#servicesubmit").click(function(){
  	     	var date=document.getElementById("servicedate");
  	     	var xhttp = new XMLHttpRequest();
  	     	 xhttp.onreadystatechange = function() {
  	     	if (this.readyState == 4 && this.status == 200) {
         	
         	    console.log(this.responseText);
         		$("#service").hide();
         		document.getElementById("response").innerHTML =this.responseText.trim();
         	
         }};
        
         
        xhttp.open("GET", "updateservice.jsp?vehicleid="+<%=vehicleid%>+"&date="+date.value, true);
        xhttp.send();
});

  });
  </script>
  <center>
  <div id="wrapper" >

	


<div style="color: white;display: inline-block;">
	<%if(age>=10)
	out.println("<h2 style=\"color:red;\">Do consider to serivce your bike. It has been almost 10 years. Once serviced, do update the date.</h3>");
  
	out.println("<h4>your last service date is:<B>"+servicedate+"<B></h4>");
  out.println("<h4>Vehicle bought at:<B>"+buydate+"<B></h4>");
  out.println("<h4>Engine type:<B>"+type+"<B></h4>");
    out.println("<h4>Engine Capacity:<B>"+cc+" cc<B></h4>");

	%>
</div>

<br><br><div id="index" style=" display:inline-block;width: 100%">
	<button id="ridebtn" class="text button">Ride</button>
	<button id="servicebtn" class="text button">Service Date</button>
</div>
<div id="ride" style="margin-top: 10%">
   <input type=text id="from" placeholder="FROM" class="text"/><br><br>
   <input type=text id="to" placeholder="TO" class="text"/><br><br>
   <button id="ownridesubmit" class="text button">RIDE</button>
</div>
<div id="service" style="margin-top: 10%" >
   <input type=text id="servicedate" placeholder="yyyy-mm-dd" class="text"/><br><br>
  
   <button id="servicesubmit" class="text button">Update date</button>
</div>
<br><br><div id="response" style="color: white;"></div></div>
</center>