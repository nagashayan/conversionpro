<%-- 
    Document   : process
    Created on : Mar 5, 2016, 12:26:10 PM
    
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
            int correctanscount = 0, points = 0;
            String number = "",level = "",value = "",type="",res="";
            Enumeration enParams = request.getParameterNames(); 
            while(enParams.hasMoreElements()){
             if(correctanscount < 10){   
             String paramName = (String)enParams.nextElement();
             
             out.println("name - "+paramName+", value - "+request.getParameter(paramName));
             
            if(paramName.indexOf("num") != -1){
                 out.println("in 1");
                
                 number = request.getParameter(paramName).trim();
            }
             else if(paramName.indexOf("val") != -1){
                 
                 //it will be value
                 value = request.getParameter(paramName).trim();
                out.println("in 2 type ="+type+"number ="+number);
                 if(number.length() > 0){
                     if(type.equals("binary")){
                        res = Integer.toBinaryString(Integer.parseInt(number));
                        out.println("in binary");
                     }
                     else if(type.equals("hexa")){
                        res = Integer.toHexString(Integer.parseInt(number));
                     }
                     else if(type.equals("octal")){
                        res = Integer.toOctalString(Integer.parseInt(number));
                     }
                     out.println("checking val="+value+"res ="+res.trim().toUpperCase());
                     if(res.trim().toUpperCase().equals(value.trim())){
                         out.println("its correct");
                         correctanscount++;
                         points = points + 10;
                     } 
                 }
             }
             else if(paramName.equals("level")){
                 out.println("in level");
                level = request.getParameter(paramName).trim(); 
             }
             else if(paramName.equals("selectmenu")){
                 out.println("in type");
                type = request.getParameter(paramName).trim(); 
             }
             else if(paramName.equals("points")){
                 out.println("in points");
                points = Integer.parseInt(request.getParameter(paramName).trim()); 
             }
             }
             
            }
         //for each level different answer count
         int anscount = 2,temp = (Integer.parseInt(level));
         if(temp == 2){
             anscount = 2;
         }
         else if(temp == 3){
             anscount = 2;
         }
         
         if(correctanscount >= anscount){
            //user has passed to second round

         String site = new String("/Numberconversionpro/index.jsp?result=1&&nextlevel="+(temp+1)+"&&correctanswerscount="+correctanscount+"&&points="+points);
         out.println(site);
           response.setStatus(response.SC_MOVED_TEMPORARILY);
           response.setHeader("Location", site); 

                 
                 
             }
         else{
             points = points - ( correctanscount * 10);
            //level failed
            String site = new String("/Numberconversionpro/index.jsp?result=0&&nextlevel="+temp+"&&correctanswerscount="+correctanscount+"&&points="+points);
            out.println(site);
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);   

         }
        %>
    </body>
</html>
