<!doctype html>


<html>
   <body>
   
    <%="Pantalla login usuario" %>
   
    <div class = "l-form" id="login">
    <div class="shape1"></div>
            <div class="shape2"></div>

            <div class="form">
               <asset:image src="authentication.svg" alt="Inicia sesion" class="formimg"/>

                <form class="formcontent" action="loguearUsuario" method="POST" id="loginForm" autocomplete="off">
                    <h1 class="formtitle">Inicia sesión</h1>
                    <div class= "formdescription">
                        <p>No tienes una cuenta? <a href="#">Registrate</a></p>
                     </div>
                    <div class="formdiv formdiv-one">
                        <div class="formicon">
                            <i class='bx bx-user-circle'></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Usuario</label>
                            <input type="text" name="usuario" class="forminput" id="usuario" required>
                        </div>
                    </div>

                    <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Contraseña</label>
                            <input type="password" name="hashed_pass" class="forminput" id="hashed_pass" required>
                        </div>
                    </div>
                    <a href="#" class="formforgot">¿Olvidó su contraseña?</a>

                    <input type="submit" id="submit" class="form__button" value="Iniciar sesión" />
                </form>
            </div>
</div>

     
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

