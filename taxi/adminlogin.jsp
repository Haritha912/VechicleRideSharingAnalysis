<%@ page import="java.sql.*"%>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
   
   
   String mailid=request.getParameter("name");
   
   String password=request.getParameter("password");
   
   
   if("".equals(mailid))
   {
   %>
    no data!!!
    <%}else{
             Connection conn = null;
                Statement stmt = null;
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(DB_URL, USER, PASS);
                   stmt = conn.createStatement();
             String sql = "select * from admin where name='"+mailid+"' and password='"+password+"'";
      ResultSet rs=stmt.executeQuery(sql);
             
             if(rs.next()){
             out.print("true");
             rs.close();
             }else{
             out.print("false");
             }
             }
        
        %>
        