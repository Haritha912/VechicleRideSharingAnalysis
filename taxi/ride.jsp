<%@ page import="java.sql.*"%>

<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <%
  String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";

Connection conn = null;
 Statement stmt = null;
  Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
 stmt = conn.createStatement();

  String source=request.getParameter("source");
String phone=request.getParameter("phone");
  String destination=request.getParameter("destination");
  String own=request.getParameter("own");
  String age=request.getParameter("age");
  String buy = request.getParameter("buy");
   String sql = "update driver set location='"+destination+"' where phone='"+phone+"'";
 stmt.executeUpdate(sql);
  String link="https://www.google.com/maps/embed/v1/directions?origin="+source+"&destination="+destination+"&key=AIzaSyCZlPOKqfRDdP2VCz7yX-LUYnHKZ2fI0_c";
  %>

  <script type="text/javascript">
    $(document).ready(function(){
    	$("#stop").click(function(){
    		  window.open("deleteDB.jsp?&phone="+<%=phone%>,"_self");
    	});
    	$("#ownstop").click(function(){
    		  window.open("ownride.jsp?vehicleid="+<%=phone%>+"&age="+<%=age%>+"&buy="+<%=buy%>,"_self");
    	});
});

  	
  </script>
</head>

<iframe style="width:100%;height:75vh;" src=<%=link%>>
  </iframe><br><br><center>
  <%
  if("true".equals(own))
  {
  	%>
  	<button id="ownstop" class="btn btn-danger">stop ride</button>
  	<%}
  	else
  		{%>
  <button id="stop" class="btn btn-danger">stop ride</button>
  <%}%>
	</center>

</html>