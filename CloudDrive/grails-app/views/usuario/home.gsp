<!DOCTYPE html>
<html>
<body>
    <h2>Aca deberia ir el menu con los archivos y eso</h2>

    <body>  
    <h3> Prueba subida archivos </h3>
    <br />
    <g:uploadForm controller="Archivo" action="subirArchivo">
        <input type="file" name="myFile" />
        <input type="submit" name="Subir archivo" />
    </g:uploadForm>

    <div>
        <p>Boton de prueba</p>
        <li><g:link class="create" action="dirigirPerfil"><g:message code="Dirigir a perfil" args="[entityName]" /></g:link></li>
        <p> Boton cerrar session (prueba)
        <li><g:link class="create" action="cerrarSesion"><g:message code="Cerrar session actual" args="[entityName]" /></g:link></li>
    </div>
    </body>


</body>
</html>