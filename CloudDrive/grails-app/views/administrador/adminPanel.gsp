<!DOCTYPE html>
<html>
    <head>
        <h1> aca deberia ir panel de control del admin </h1>

        <div>
            <center>

                <h3>Aca se muestran los logs</h3>
                <g:each in="${params.logList}" var="Log">
                    <li>${Log.tipo_log} &nbsp ${Log.fecha_evento} &nbsp ${Log.evento} &nbsp ${Log.usuario} &nbsp ${Log.motivo}</li>
                </g:each>

            </center>

        </div>

        <div>
            <h2>Links otras vistas</h2>
            <p><g:link class="create" controller="administrador" action="dirigirUsuarios"><g:message code="Administracion de usuarios" /></g:link></p>
            <p><g:link class="create" controller="administrador" action="dirigirAdministradores"><g:message code="Administracion de admins" /></g:link></p>
        </div>
    </head>
</html>