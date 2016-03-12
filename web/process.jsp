<%-- 
    Document   : process
    Created on : Mar 5, 2016, 12:26:10 PM
    Author     : nagashayanaramamurthy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import = "java.util.Enumeration;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${pageContext.request.method=='POST'}">
<p/>Congrats, you managed to POST!
</c:if>
        <h1>Hello World! value is  <b><%= request.getParameter("val") %></b>!</h1>
        
        <% 
            out.println("To out-put All the request parameters received from request - ");
            int correctanscount = 0;
            String number = "",level = "";
            Enumeration enParams = request.getParameterNames(); 
            while(enParams.hasMoreElements()){
             if(correctanscount < 10){   
             String paramName = (String)enParams.nextElement();
             
             //out.println("name - "+paramName+", value - "+request.getParameter(paramName));
             
            if(paramName.equals("num")){
                 out.println("in 1");
                number = request.getParameter(paramName).trim();
            }
             else if(paramName.equals("val")){
                 out.println("in 2");
                 //it will be value
                 if(number != ""){
                     String res = Integer.toBinaryString(Integer.parseInt(number));
                     if(res ==  number){
                         correctanscount++;
                     }
                 }  
             }
             else if(paramName.equals("level")){
                 out.println("in level");
                level = request.getParameter(paramName).trim(); 
             }
             
             }
             //else{
                 //user has passed to second round
                 //response.sendRedirect("/Numberconversionpro/index.jsp?result=1&&nextlevel=2");
                 int temp = (Integer.parseInt(level)) + 1;
                
                String site = new String("/Numberconversionpro/index.jsp?result=1&&nextlevel="+temp);
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site); 
                 
            // }
            }
            
         
        %>
    </body>
</html>
