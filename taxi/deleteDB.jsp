<%@ page import="java.sql.*"%>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
    ResultSet rs=null;
    int carMember=1;
   
   String phone=request.getParameter("phone");
   
   
   
  
             Connection conn = null;
                Statement stmt = null;
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(DB_URL, USER, PASS);
                   stmt = conn.createStatement();
                   String  sql="select * from shareride where contact='"+phone+"' ";
            
               rs=stmt.executeQuery(sql);
                if(rs.next())
                {
                 carMember=rs.getInt("member");
                out.println(carMember);
                rs.close();

                }
               sql = "DELETE FROM shareride where contact=\'"+phone+"\'";
              stmt.executeUpdate(sql);
            
             
        
    %>
        <script type="text/javascript">
    window.onload = function () {
      var chart = new CanvasJS.Chart("chartContainer", {
        title: {
          text: "Sharing Analysis"
        },
        data: [{
          type: "column",
          dataPoints: [
            { y: <%=30%>, label: "sharing" },
            { y: <%=30*carMember%>, label: "without sharing" },
            
          ]
        }]
      });
      chart.render();
    }
  </script>
  <script src="/taxi/js/canvasjs.min.js"></script>
  <title>CanvasJS Example</title>
</head>

<body>
  <center><div id="chartContainer" style="height: 400px; width: 60%;"></center></div>
</body>