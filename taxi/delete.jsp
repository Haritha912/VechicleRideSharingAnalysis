 <%@ page import="java.io.*,java.util.*" %>
<%
String fileName=request.getParameter("val");
   	
   try{
    File filewriter = new File("/var/lib/tomcat7/webapps/taxi/"+fileName+".txt");
    filewriter.delete();

    }catch(Exception e)
   {
   out.println(e);
   }
   %>