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
                    <a href="#" class="nav__link active-link">
                        <i class='bx bx-grid-alt'></i>
                        <span class="nav__name">Inicio</span>
                    </a>
    
                    <a href="#" class="nav__link">
                        <i class='bx bx-file'></i>
                        <span class="nav__name">Archivos</span>
                    </a>
    
                    <a href="#" class="nav__link">
                        <i class='bx bx-share-alt' ></i>
                        <span class="nav__name">Compartidos</span>
                    </a>
    
                    <g:link class="nav__link" action="cerrarSesion"><g:message args="[entityName]" />
                        <i class='bx bx-log-out'></i>
                        <span class="nav__name">Salir</span>
                    </g:link>

                    <g:link class="nav__link" action="dirigirPerfil"><g:message args="[entityName]" />
                        <i class='bx bx-cog' ></i>
                        <span class="nav__name">Ajustes</span>
                    </g:link>

                </div>
            </nav>
        </div>
        <!--=============== MAIN ===============-->
        <main class="container section">
            <h1>Components</h1>
            <h2>Aca deberia ir el menu con los archivos y eso</h2>
            <h3> Prueba subida archivos </h3>
            <br />
            <g:uploadForm controller="Archivo" action="subirArchivo">
                <input type="file" name="myFile" />
                <input type="submit" name="Subir archivo" />
            </g:uploadForm>           
        </main>
        <!--=============== HOME JS ===============-->
        <asset:javascript src="home.js"/>
    </body>
</html>