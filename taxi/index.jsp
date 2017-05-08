<%@ page import="java.sql.*"%>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
   
   String name=request.getParameter("name");
   String mailid=request.getParameter("mailid");
   String phone=request.getParameter("phone");
   String password=request.getParameter("password");
   
   
   if(("".equals(name))||("".equals(mailid))||("".equals(phone))||("".equals(password)))
   {
   %>
    Enter all data
    <%}else{
             Connection conn = null;
                Statement stmt = null;
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(DB_URL, USER, PASS);
                   stmt = conn.createStatement();
             String sql = "INSERT INTO customer VALUES ('"+name+"','"+phone+"','"+mailid+"','"+password+"')";
      stmt.executeUpdate(sql);
             out.println("Registered successfully!!!");
             }
        
    %>
        