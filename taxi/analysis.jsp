<%@ page import="java.sql.*"%>
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
    String sql = "select * from feedback";
    ResultSet rs=stmt.executeQuery(sql);
    int[] q1=new int[5];
    int[] q2=new int[5];
    int[] q3=new int[5];
    int[] q4=new int[5];
    while(rs.next())
    {
	switch(rs.getInt("q1"))
	{
	case 1:q1[0]++;
	       break;
	case 2:q1[1]++;
	       break;
	case 3:q1[2]++;
	       break;
	case 4:q1[3]++;
	       break;
	case 5:q1[4]++;
	       break;
	}
	switch(rs.getInt("q2"))
	{
	case 1:q2[0]++;
	       break;
	case 2:q2[1]++;
	       break;
	case 3:q2[2]++;
	       break;
	case 4:q2[3]++;
	       break;
	case 5:q2[4]++;
	       break;
	}
	switch(rs.getInt("q2"))
	{
	case 1:q3[0]++;
	       break;
	case 2:q3[1]++;
	       break;
	case 3:q3[2]++;
	       break;
	case 4:q3[3]++;
	       break;
	case 5:q3[4]++;
	       break;
	}
	switch(rs.getInt("q4"))
	{
	case 1:q4[0]++;
	       break;
	case 2:q4[1]++;
	       break;
	case 3:q4[2]++;
	       break;
	case 4:q4[3]++;
	       break;
	case 5:q4[4]++;
	       break;
	}
	
}

%>

<html>
<head>
	<script type="text/javascript">
window.onload = function () {
	var chart = new CanvasJS.Chart("chartContainer1",
	{
		theme: "theme1",
		title:{
			text: "question 1"
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{y} - #percent %",
			legendText: "{indexLabel}",
			dataPoints: [
				{  y: <%=q1[0]%>, indexLabel: "1" },
				{  y: <%=q1[1]%>, indexLabel: "2" },
				{  y: <%=q1[2]%>, indexLabel: "3" },
				{  y: <%=q1[3]%>, indexLabel: "4"},
				{  y: <%=q1[4]%>, indexLabel: "5"},
				
			]
		}
		]
	});
	

	var chart1 = new CanvasJS.Chart("chartContainer2",
	{
		theme: "theme1",
		title:{
			text: "question 2"
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{y} - #percent %",
			legendText: "{indexLabel}",
			dataPoints: [
				{  y: <%=q2[0]%>, indexLabel: "1" },
				{  y: <%=q2[1]%>, indexLabel: "2" },
				{  y: <%=q2[2]%>, indexLabel: "3" },
				{  y: <%=q2[3]%>, indexLabel: "4"},
				{  y: <%=q2[4]%>, indexLabel: "5"},
				
			]
		}
		]
	});
	var chart2 = new CanvasJS.Chart("chartContainer3",
	{
		theme: "theme1",
		title:{
			text: "question 3"
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{y} - #percent %",
			legendText: "{indexLabel}",
			dataPoints: [
				{  y: <%=q3[0]%>, indexLabel: "1" },
				{  y: <%=q3[1]%>, indexLabel: "2" },
				{  y: <%=q3[2]%>, indexLabel: "3" },
				{  y: <%=q3[3]%>, indexLabel: "4"},
				{  y: <%=q3[4]%>, indexLabel: "5"},
				
			]
		}
		]
	});
var chart3 = new CanvasJS.Chart("chartContainer4",
	{
		theme: "theme1",
		title:{
			text: "question 4"
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{y} - #percent %",
			legendText: "{indexLabel}",
			dataPoints: [
				{  y: <%=q4[0]%>, indexLabel: "1" },
				{  y: <%=q4[1]%>, indexLabel: "2" },
				{  y: <%=q4[2]%>, indexLabel: "3" },
				{  y: <%=q4[3]%>, indexLabel: "4"},
				{  y: <%=q4[4]%>, indexLabel: "5"},
				
			]
		}
		]
	});
	
	chart1.render();
    chart2.render();
    chart3.render();
	chart.render();
	


	
}
	</script>
	<script src="/taxi/js/canvasjs.min.js"></script>
	<title>Analysis</title>
</head>
<body>
	<div id="chartContainer1" style="height: 400px; width: 50%; float:left;"></div>
	<div id="chartContainer2" style="height: 400px; width: 50%; float:left;"></div><br><br>
	<div id="chartContainer3" style="height: 400px; width: 50%; float:left; margin-top: 20px;"></div>
	<div id="chartContainer4" style="height: 400px; width: 50%; float:left;  margin-top: 20px;"></div>
</body>
</html>