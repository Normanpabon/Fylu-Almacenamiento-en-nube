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
            <h1>Archivos compartidos conmigo</h1>
            

            <!--- ciclo para mostrar los archivos -->
            <!-- Nota editar el borrar para que permita es eliminar el permiso, no el archivo-->
            <h3>BORRAR /// Falta implementar permisos backend</h3>
            <g:each in="${params.mySharedFiles}" var="file">
             <li>${file.nombre}   ${file.size}MB <g:link class="create" controller="archivo" action="descargarArchivo" params="[fileToDownloadId: file.id]" ><g:message code="Descargar" /></g:link>&nbsp;&nbsp;<g:link class="create" controller="archivo" action="eliminarPermiso" params="[fileToDelete: file.id]" ><g:message code="Eliminar" /></g:link></</li>
            </g:each>

           
        </main>
        <!--=============== HOME JS ===============-->
        <asset:javascript src="home.js"/>
    </body>
</html>