<!doctype html>
<html>
<head>
  	<center><h1>Mi perfil</h1>
   	
    <div class = "l-form" id="login">
    <div class="shape1"></div>
           
           
           <div>
           <li><g:link class="create" controller="Archivo" action="calcularEspacioUsado"><g:message code="boton prueba espacio usado" args="[entityName]" /></g:link></li>
           	<h3>Mis datos actuales</h3>
           	<h4>Aca mostrar los datos del usuario actual</h4>
           	<h4>Nombre Usuario</h4>
           	<h4>Cuota</h4>
           	<h4>Correo registrado</h4>
           	<h5>------------------</h5>
           	
           </div>
            <div class="shape2"></div>

            <div class="form">
               <asset:image src="perfil.svg" alt="Mi perfil" class="formimg"/>

                <form class="formcontent" action="modificarContra" method="POST" id="edPassForm" autocomplete="off">
					<h3 class="formtitle">Modifica tu clave</h3>
                    
                    <div class="formdiv formdiv-one">
                        <div class="formicon">
                            <i class='bx bx-user-circle'></i>
                        </div>
                        
                    </div>

                    <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Clave actual</label>
                            <input type="password" name="viejaContra" class="forminput" id="viejaContra" required>
                        </div>
                    </div>
                     <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
							<label for="" class="formlabel">Nueva clave</label>
                            <input type="password" name="nuevaContra" class="forminput" id="nuevaContra" required>
                        </div>
                    </div>
                    

                    <input type="submit" id="submit1" class="form__button" value="Cambiar clave" />
                </form>
            </div>
            
            <h2>/...../</h2>
            <div class="form">
               <asset:image src="perfil.svg" alt="Mi perfil" class="formimg"/>

                <form class="formcontent" action="modCorreo" method="POST" id="edMailForm" autocomplete="off">
					<h3 class="formtitle">Modifica tu correo</h3>
                    
                    <div class="formdiv formdiv-one">
                        <div class="formicon">
                            <i class='bx bx-user-circle'></i>
                        </div>

                   
                    </div>

                    <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Nuevo correo</label>
                            <input type="email" name="correoNuevo" class="forminput" id="correoNuevo" required>
                        </div>
                    </div>
                     <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                       
                    </div>
                    

                    <input type="submit" id="submit" class="form__button" value="Cambiar correo" />
                </form>
            </div>
            
            <h2>/...../</h2>
            <div class="form">

                <form class="formcontent" action="deshabilitarCuenta" method="POST" id="edMailForm" autocomplete="off">
					<h3 class="formtitle">Desactiva tu cuenta</h3>
                    
                    <div class="formdiv formdiv-one">
                        <div class="formicon">
                            <i class='bx bx-user-circle'></i>
                        </div>

                   
                    </div>

                    <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                        <div class="formdiv-input">
                            <label for="" class="formlabel">Ingrese su clave</label>
                            <input type="password" name="claveOld" class="forminput" id="claveOld" required>
                        </div>
                    </div>
                     <div class="formdiv">
                        <div class="formicon">
                            <i class='bx bx-lock' ></i>
                        </div>

                       
                    </div>
                    

                    <input type="submit" id="submit2" class="form__button" value="Darse de baja" />
                </form>
            </div>
            </center>
</body>
</html>
