<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bienvenido!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
        <%-- ======= BOX ICONS ======= --%>
        <asset:stylesheet href="boxicons.min.css"/>
        <%-- ======= CSS ======= --%>
        <asset:stylesheet href="home.css"/>
    </head>
    <body>
        <!--=============== NAV ===============-->
        <div class="nav" id="nav">
            <nav class="nav__content">
                <div class="nav__toggle" id="nav-toggle">
                    <i class='bx bx-chevron-right' ></i>
                </div>
    
                <a href="#" class="nav__logo">
                    <i class='bx bx-cloud-drizzle'></i>
                    <span class="nav__logo-name">Fylu</span>
                </a>
    
                <div class="nav__list">
                    <g:link class="nav__link" action="dirigirHome"><g:message args="[entityName]" />
                        <i class='bx bx-grid-alt'></i>
                        <span class="nav__name">Inicio</span>
                    </g:link>
    
                    <g:link class="nav__link" action="dirigirHome"><g:message args="[entityName]" />
                        <i class='bx bx-file'></i>
                        <span class="nav__name">Archivos</span>
                    </g:link>
    
                    <g:link class="nav__link" action="dirigirArchivosCompartidos"><g:message args="[entityName]" />
                        <i class='bx bx-share-alt' ></i>
                        <span class="nav__name">Compartidos conmigo</span>
                    </g:link>

                    <g:link class="nav__link" action="dirigirPerfil"><g:message args="[entityName]" />
                        <i class='bx bx-cog' ></i>
                        <span class="nav__name">Ajustes</span>
                    </g:link>
    
                    <g:link class="nav__link" action="cerrarSesion"><g:message args="[entityName]" />
                        <i class='bx bx-log-out'></i>
                        <span class="nav__name">Salir</span>
                    </g:link>

                    

                </div>
            </nav>
        </div>
        <!--=============== MAIN ===============-->
        <main class="container section">
            <h1>Mi perfil</h1>
            <!--=============== ALMACENAMIENTO USADO  ===============-->
            <li><g:link class="create" controller="Archivo" action="calcularEspacioDisponible"><g:message code="boton prueba espacio usado" args="[entityName]" /></g:link></li>
            <!--=============== FORMULARIO ===============-->
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
        </main>
        <!--=============== HOME JS ===============-->
        <asset:javascript src="home.js"/>
    </body>
</html>

