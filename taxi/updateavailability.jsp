<%@ page import="java.sql.*"%>
<%
 String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
String phone=request.getParameter("phone");
String availability=request.getParameter("availability");
Connection conn = null;
 Statement stmt = null;
  Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
 stmt = conn.createStatement();
 String sql = "update driver set availability="+availability+" where phone='"+phone+"'";
 stmt.executeUpdate(sql);
%>