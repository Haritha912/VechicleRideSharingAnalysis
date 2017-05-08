<%@ page import="java.sql.*"%>
<%
 String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
String vehicleid=request.getParameter("vehicleid");
String date=request.getParameter("date");
Connection conn = null;
 Statement stmt = null;
  Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
 stmt = conn.createStatement();
 String sql = "update RTO set lastservice='"+date+"' where vehicleid='"+vehicleid+"'";
 stmt.executeUpdate(sql);
 out.println("your data updated");
%>