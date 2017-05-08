<%@ page import="java.sql.*"%>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
   
   String name=request.getParameter("name");
   String phone=request.getParameter("contact");
   String q1=request.getParameter("q1");
      String q2=request.getParameter("q2");
   String q3=request.getParameter("q3");
   String q4=request.getParameter("q4");

  
   
   
   if(("".equals(name))||("".equals(phone)))
   {
   %>
    1
    <%}else{
             Connection conn = null;
                Statement stmt = null;
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(DB_URL, USER, PASS);
                   stmt = conn.createStatement();
             String sql = "insert into feedback values(\'"+phone+"\',\'"+name+"\',\'"+q1+"\',\'"+q2+"\',\'"+q3+"\',\'"+q4+"\')";
      stmt.executeUpdate(sql);
             out.println("updated successfully!!!");
             }
        
    %>
        