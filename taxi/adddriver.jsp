<%@ page import="java.sql.*"%>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
   
   String name=request.getParameter("name");
   String member=request.getParameter("member");
   String cartype=request.getParameter("cartype");
   String driverlocation=request.getParameter("driverlocation");
   String phone=request.getParameter("phone");
   String password=request.getParameter("password");
   
   
   if(("".equals(name))||("".equals(member))||("".equals(phone))||("".equals(password))||("".equals(driverlocation))||("".equals(cartype)))
   {
   %>
    Enter all data
    <%}else{
             Connection conn = null;
                Statement stmt = null;
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(DB_URL, USER, PASS);
                   stmt = conn.createStatement();
             String sql = "INSERT INTO driver VALUES ('"+name+"','"+phone+"','"+password+"','"+driverlocation+"','"+cartype+"','"+member+"','1')";
      stmt.executeUpdate(sql);
             out.println("Registered successfully!!!");
             }
        
    %>
        