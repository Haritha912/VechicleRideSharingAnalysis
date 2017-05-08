<%@ page import="java.sql.*"%>
  <%@ page import="java.io.*,java.util.*" %>

<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost/taxi";
    String USER = "root";
    String PASS = "aves";
   
   String car_type=request.getParameter("car_type");
   int members=Integer.parseInt(request.getParameter("members"));
   int carMember=0;
   String luggage=request.getParameter("luggage");
   String contact=request.getParameter("contact");
   String source=request.getParameter("source");
   String destination=request.getParameter("destination");
   String sharing=request.getParameter("sharing");
  
  
   if(("".equals(car_type))||("".equals(members))||("".equals(luggage))||("".equals(contact))||("".equals(source))||("".equals(destination)))
   {
 out.println("0");
   }else{
         Connection conn = null;
         Statement stmt = null;
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(DB_URL, USER, PASS);
         stmt = conn.createStatement();
         ResultSet rs=null;
                   
             

             
              String  sql="select * from driver where location='"+source+"' and availability=1";
            
               rs=stmt.executeQuery(sql);
                if(!rs.next())
                {
                out.println("1");


                }
                
                else{
                carMember=rs.getInt("member");
                if(sharing.equals("no")){
               sql = "INSERT INTO ride VALUES ("+car_type+","+members+","+luggage+",'"+contact+"','"+source+"','"+destination+"')";
             stmt.executeUpdate(sql);
             sql="select * from driver where location='"+source+"' and availability=1";
            
               rs=stmt.executeQuery(sql);
                   

              if(rs.next()){
         //Retrieve by column name
        
                
                String first = rs.getString("name");
                String last = rs.getString("phone");

         //Display values
                out.print("Name:"+first+"\nContact:"+last);  
                 try{
                  FileWriter filewriter = new FileWriter("/var/lib/tomcat7/webapps/taxi/"+last+".txt");
  
                  filewriter.write("{ \"contact\":\""+contact+"\", \"source\":\""+source+"\",  \"destination\":\""+destination+"\"}");
                  filewriter.close();

                   }catch(Exception e)
                  {
                  out.println(e);
                  }              
                }
                }
                else{

                    sql="select * from shareride where source='"+source+"'and destination='"+destination+"' and members>="+members;
                  rs=stmt.executeQuery(sql);
                  if(rs.next())
                  {
                  
                  int availableMembers = rs.getInt("members");
                  int count = rs.getInt("member");
                  String driverContact=rs.getString("contact");
                  members=availableMembers-members;
                  sql = "update shareride set members="+members+" , member="+(++count)+" where contact='"+driverContact+"'";
                  
                  stmt.executeUpdate(sql);
                   try{
                  FileWriter filewriter = new FileWriter("/var/lib/tomcat7/webapps/taxi/"+driverContact+".txt");
  
                  filewriter.write("{ \"contact\":\""+contact+"\", \"source\":\""+source+"\",  \"destination\":\""+destination+"\"}");
                  filewriter.close();

                   }catch(Exception e)
                  {
                  out.println(e);
                  }
                  sql = "select * from driver where phone ="+"\'"+driverContact+"\'";
                  rs=stmt.executeQuery(sql);
                  if(rs.next()){
         //Retrieve by column nam
                String first = rs.getString("name");
               out.println("{\"Name\":\""+first+"\",\"Contact\":\""+driverContact+"\"}");
                }
                  
                  }
                  else{
                  
             sql="select * from driver where location='"+source+"' and availability=1";
            
               rs=stmt.executeQuery(sql);
                   

              if(rs.next()){
         //Retrieve by column name
        
                
                String first = rs.getString("name");
                String last = rs.getString("phone");

                sql = "INSERT INTO shareride VALUES ("+car_type+",1,"+luggage+",'"+last+"','"+source+"','"+destination+"','"+(carMember-members)+"')";
             stmt.executeUpdate(sql);

         //Display values
               out.println("{\"Name\":\""+first+"\",\"Contact\":\""+last+"\"}");
                 try{
                  FileWriter filewriter = new FileWriter("/var/lib/tomcat7/webapps/taxi/"+last+".txt");
  
                  filewriter.write("{ \"contact\":\""+contact+"\", \"source\":\""+source+"\",  \"destination\":\""+destination+"\"}");
                  filewriter.close();

                   }catch(Exception e)
                  {
                  out.println(e);
                  }              
                }

                  }
                 

                    }
               }
                if(rs!=null)
                {
                rs.close();
                }             
             }
        
    %>
        