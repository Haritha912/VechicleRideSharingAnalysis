<%@ page import="java.sql.*"%>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
   
   
   String vehicleid=request.getParameter("vehicleid");
   int age=Integer.parseInt(request.getParameter("age"));
   int buy=Integer.parseInt(request.getParameter("buy"));
   String vehicletype,vehiclecc;
   int co2=30,n=10,co=30,s=5,eff;  
   if("".equals(vehicleid))
   {
   %>
    no data!!!
    <%}else{
             Connection conn = null;
                Statement stmt = null;
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(DB_URL, USER, PASS);
                   stmt = conn.createStatement();
                   if(buy<2)
                   {
                     buy = 0;
                   }
                   else if(buy<5)
                   {
                      buy=4;
                   }
                   else{
                   buy=8;
                   }
             String sql = "select * from RTO where vehicleid="+vehicleid;
      ResultSet rs=stmt.executeQuery(sql);
             
             if(rs.next()){
             vehiclecc=rs.getString("vehiclecc");
             vehicletype=rs.getString("vehicletype");
             if("1".equals(vehicletype))
             {
              co=co*2;
              eff=80;
             }
             else{
             co2=co2*2;
             n=n*3;
             co=co/2;
             s=s*2;
             eff=90;
             }
             rs.close();
             %>
             <script type="text/javascript">
    window.onload = function () {
      var chart = new CanvasJS.Chart("chartContainer", {
        title: {
          text: "Polution analysis"
        },
        axisy: {
          
             maximum: 100,
        },
        data: [{
          type: "column",
          dataPoints: [
            { y: <%=eff-(age*2)-buy%>, label: "efficeincy" },
            { y: <%=co2+(age*4)+buy%>, label: "CO2" },
            { y: <%=co+(age*4)+buy%>, label: "CO" },
            { y: <%=n+(age*4)+buy%>, label: "Nitrogen" },
            { y: <%=s+(age*4)+buy%>, label: "Sulphur" },

            
          ]
        }]
      });
      var chart2 = new CanvasJS.Chart("chartContainer2", {
        title: {
          text: "What if you serviced your vehicle"
        },
        axisy: {
          
             maximum: 100,
        },
        data: [{
          type: "column",
          dataPoints: [
            { y: <%=eff-buy%>, label: "efficeincy" },
            { y: <%=co2+buy%>, label: "CO2" },
            { y: <%=co+buy%>, label: "CO" },
            { y: <%=n+buy%>, label: "Nitrogen" },
            { y: <%=s+buy%>, label: "Sulphur" },

            
          ]
        }]
      });
       var chart3 = new CanvasJS.Chart("chartContainer3", {
        title: {
          text: "What if you get a new vehicle"
        },
        axisy: {
          
             maximum: 100,
        },
        data: [{
          type: "column",
          dataPoints: [
            { y: <%=eff%>, label: "efficeincy" },
            { y: <%=co2%>, label: "CO2" },
            { y: <%=co%>, label: "CO" },
            { y: <%=n%>, label: "Nitrogen" },
            { y: <%=s%>, label: "Sulphur" },

            
          ]
        }]
      });
      chart.render();
      chart2.render();
      chart3.render();
    }
  </script>
  <script src="/taxi/js/canvasjs.min.js"></script>
  <title>Polution analysis</title>
</head>

<body>
<center>
  <div id="chartContainer" style="float:left;height: 400px; width: 45%;"></div>
  <div id="chartContainer2" style="height: 400px; width: 45%;margin-left:50%;"></div>
  <div id="chartContainer3" style="margin-top: 30px;height: 400px; width: 40%;"></div></center>
</body>

             <%
             }
             }
        
        %>
        