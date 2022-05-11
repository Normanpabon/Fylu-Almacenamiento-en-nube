<!doctype html>


<html>
   <body>
     <%="Aca deberia estar el login!" %>
     <%-- commentario en jsp--%>
     <%-- se pueden declarar variables dentro de <% %>--%>
     <% now = new Date()%>
     <p><%=now%></p>

     <%-- prueba condicional--%>
     <%session['user'] = [id: 1] %>
     <%=session%>
    
   </body>
</html>

