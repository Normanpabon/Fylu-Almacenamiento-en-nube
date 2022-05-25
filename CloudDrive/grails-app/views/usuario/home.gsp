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
        <asset:stylesheet href="home.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/scroller/1.4.4/css/scroller.dataTables.min.css">
        
        <%-- ======= JS PLUGINS ======= --%>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/scroller/1.4.4/js/dataTables.scroller.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
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
        <!--=============== MAIN ===============-->
        <main class="container section">
            <h1>Mis archivos</h1>
            
        <!-- Boton ventana modal para subir archivos   -->
        <button type="button" class="btn btn-primary modalTrigger" data-toggle="modal">
            <i class='bx bx-cloud-upload'></i>
            <span>Subir archivo</span>
        </button>
        <!-- Boton ventana modal para crear carpeta   -->
        <button type="button" class="btn btn-light modalTrigger" data-bs-toggle="dropdown">
            <i class='bx bx-plus' ></i>
            <span>Crear</span>
        </button>
            <!--=============== MODAL ===============-->
            <!-- subida de archivos  -->
            <div class="modal-container">
                <div class="modal modal-close">
                    <p class="close">X</p>
                    <div class="mb-3">
                        <div class="drag-area">
                            <h2>Arrastra y suelta imagenes<h2>
                            <span>proximamente..<span>
                            <g:uploadForm controller="Archivo" action="subirArchivo">
                                <input type="file" name="myFile" class="form-control-file" id="input-file"/>
                                <input type="submit" value="Añadir archivos" class="btn btn-primary" id="subir-archivo"/>
                            </g:uploadForm>
                        </div>
                    </div>
                </div>
            </div>
            <!--=============== LISTADO DE ARCHIVOS  ===============-->
            <!--- ciclo para mostrar los archivos -->
            <table id="archivos__dt" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Tamaño</th>
                        <th>Acciones</th>
                    </tr>
                </thead>                
                
                    <g:each var="file" in="${params.myFileList}">
                    <tr>
                        <td>${file.nombre}</td> 
                        <td>${file.size}MB</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-light">
                                    <g:link class="create" controller="archivo" action="descargarArchivo" params="[fileToDownloadId: file.id]" >
                                        <i class='bx bx-cloud-download' ></i>
                                    </g:link>&nbsp;&nbsp;
                                </button>                            
                                <button type="button" class="btn btn-light modalEliminar" data-toggle="modal" id="btnEliminar" fileId = ${file.id}>
                                    <i class='bx bx-trash' ></i>
                                </button>
                                <button type="button" class="btn btn-light modalCompartir" data-toggle="modal" id="btnCompartir" fileId = ${file.id}>
                                    <i class='bx bx-share-alt' ></i>
                                </button>                               
                            </div>

                        </td>
                    </tr>
                    </g:each>                   
            </table>      
        </main>
        <!--=============== HOME JS ===============-->
        <asset:javascript src="home.js"/>
    </body>
</html>