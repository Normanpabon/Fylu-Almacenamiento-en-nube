<!doctype html>


<html>
   <body>
   
    <%="Pantalla login usuario" %>
   
    <%-- la accion dirigirPerfil, lleva a una vista inexistente --%>
    <g:form name="Login" url="[controller:'usuario',action:'loguearUsuario']">
      
      <p>Usuario</p>
      <g:textField name="usuario" value="${myValue}" />
      <p>Contraseña</p>
      <g:passwordField name="pass" value="${myPassword}" />

      
      <p></p>
      <g:actionSubmit value="Iniciar sesion" action="post" />



    
    </g:form>
   

     
     <p>DEBUG INFORMATION</p>   

     <h4>Fecha actual</h4>  
     <g:set var="now" value="${new Date()}" />
     <p><%=now%></p>
     <h4>PATH proyecto </h4>
     <g:set var="path" value="${new File(".").getCanonicalPath()}" />
     <p><%=path%></p>
     <h4>SESSION (COOKIE) actual</h4>

     <%-- prueba condicional--%>
     <%session['user'] = [id: 1] %>
     <%=session%>
    
   </body>
</html>

