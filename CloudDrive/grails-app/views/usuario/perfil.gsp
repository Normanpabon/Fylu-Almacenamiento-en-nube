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
        <asset:stylesheet href="bootstrap.min.css"/>
        <asset:stylesheet href="profile.css"/>
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
                        <span class="nav__name">Compartidos</span>
                    </g:link>

                    <g:link class="nav__link active-link" action="dirigirPerfil"><g:message args="[entityName]" />
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
            <!--=============== ALMACENAMIENTO USADO  ===============-->
            <%-- <li><g:link class="create" controller="Archivo" action="calcularEspacioDisponible"><g:message code="boton prueba espacio usado" args="[entityName]" /></g:link></li> --%>
            <!--=============== FORMULARIO ===============-->
            <div class="card mb-4">
                <div class="card-header">Editar detalles de la cuenta</div>
                <div class="card-body">
                    <div class="form">
                        <form class="formcontent" action="modificarContra" method="POST" id="edPassForm" autocomplete="off">
                            <h1 class="form__title">Cambiar la contraseña</h1>
                                <div id="msg"></div>
                                <!-- Mensajes de Verificación -->
                                <div id="error" class="alert alert-danger ocultar" role="alert">
                                    Las Contraseñas no coinciden, vuelve a intentar !
                                </div>
                                <div id="ok" class="alert alert-success ocultar" role="alert">
                                    Las Contraseñas coinciden ! (Contraseña cambiada con exito)
                                <!-- Fin Mensajes de Verificación -->
                                </div>
                                <div class="form__div">
                                    <label for="" class="formlabel">Contraseña actual</label>
                                    <input type="password" name="viejaContra" class="form-control" id="viejaContra" required>
                                </div>

                            <div class="form__div">
                                <div class="formicon">
                                </div>
                                <div class="form__div">
                                    <label for="" class="formlabel">Nueva Contraseña</label>
                                    <input type="password" name="nuevaContra" class="form-control" id="nuevaContra" required>
                                </div>

                                <div class="form__div">
                                    <label for="" class="formlabel">Repetir nueva Contraseña</label>
                                    <input type="password" name="nuevaContra2" class="form-control" id="nuevaContra2" required>
                                </div>
                            </div>
                            

                            <input type="submit" id="submit1" class="btn btn-primary" value="Cambiar clave" />
                        </form>
                    </div>
                    <div class="form">
                        <form class="formcontent" action="modCorreo" method="POST" id="edMailForm" autocomplete="off">
                            <h3 class="form__title">Modifica tu correo</h3>
                            
                            <div class="formdiv formdiv-one">
                                <div class="formicon">
                                </div>
                            </div>

                            <div class="formdiv">
                                <div class="formicon">
                                </div>

                                <div class="form__div">
                                    <label for="" class="formlabel">Nuevo correo</label>
                                    <input type="email" name="correoNuevo" class="form-control" id="correoNuevo" required>
                                </div>
                            </div>
                            <div class="formdiv">
                                <div class="formicon">
                                </div>
                            </div>
                            

                            <input type="submit" id="submit" class="btn btn-primary" value="Cambiar correo" />
                        </form>
                    </div>
                    <div class="form">

                        <form class="formcontent" action="deshabilitarCuenta" method="POST" id="edMailForm" autocomplete="off">
                            <h3 class="form__title">Desactiva tu cuenta</h3>
                            
                            <div class="formdiv formdiv-one">
                            </div>

                            <div class="formdiv">
                                </div>

                                <div class="form__div">
                                    <label for="" class="formlabel">Ingrese su clave</label>
                                    <input type="password" name="claveOld" class="form-control" id="claveOld" required>
                                </div>
                            <input type="submit" id="submit2" class="btn btn-danger" value="Darse de baja" />
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>                      
        </main>
        <!--=============== HOME JS ===============-->
        <asset:javascript src="profile.js"/>
    </body>
</html>

