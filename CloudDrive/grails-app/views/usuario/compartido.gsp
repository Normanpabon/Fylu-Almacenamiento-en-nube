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
        <asset:stylesheet href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css"/>
        <asset:stylesheet href="home.css"/>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        
        <%-- ======= JS PLUGINS ======= --%>
        <%-- Jquery --%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <%-- SweetAlert2 --%>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <%-- DataTables --%>
        <script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
        
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
                    
                    <g:link class="nav__link active-link" action="dirigirHome"><g:message args="[entityName]" />
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

        <!--=============== NAVBAR2 ===============-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#">Usuario</a>
            </div>
        </nav>

        <!--=============== MAIN ===============-->
        <div class="main__ui">
            <main class="container section ">
                <h1>Archivos compartidos conmigo</h1>
        
                <!--=============== LISTADO DE ARCHIVOS  ===============-->
                <!--- ciclo para mostrar los archivos -->
                <table id="archivos__dt" class="table table-striped table-bordered responsive nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Tamaño</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>                
                    
                        <g:each var="file" in="${params.mySharedFiles}">
                        <tr>
                            <td>
                                <div class="flex mr1">
                                    <span class="file">
                                        <div title="${file.nombre}">
                                            ${file.nombre}
                                        </div>
                                    </span>
                                </div>
                            </td> 
                            <td>${file.size}MB</td>
                            <td>
                                <div class="btn-group">
                                    %{--btn descargar archivo--}%
                                    <button type="button" class="btn btn-light">
                                        <g:link class="create" controller="archivo" action="descargarArchivo" params="[fileToDownloadId: file.id]" >
                                            <i class='bx bx-cloud-download' ></i>
                                        </g:link>
                                    </button>
                                    %{--btn Eliminar archivo--}%
                                    <button type="button" class="btn btn-light modalEliminar" data-toggle="modal" id="btnEliminar" fileId = ${file.id}>
                                        <i class='bx bx-trash' ></i>
                                    </button>
                                    %{-- btn Compartir archivo--}%
                                    <button type="button" class="btn btn-light modalCompartir" data-toggle="modal" id="btnCompartir" fileId = ${file.id}>
                                        <i class='bx bx-share-alt' ></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </g:each>                   
                </table>      
            </main>
        </div>
        <!--=============== HOME JS ===============-->
        <asset:javascript src="home.js"/>
    </body>
</html>