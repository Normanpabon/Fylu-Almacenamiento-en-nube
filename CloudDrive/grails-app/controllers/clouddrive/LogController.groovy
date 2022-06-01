package clouddrive

import grails.validation.ValidationException
import java.time.LocalDateTime

class LogController{

    LogService logService
    def enable = true

    public LogController(def enableLog){
        enable = enableLog
    }



    def loguearError(String tmpEvento, String tmpUsuario, String tmpMotivo){
        if(enable){
            def tmpLog = new Log(fecha_evento: LocalDateTime.now().toString(), tipo_log: "Error", evento: tmpEvento, usuario: tmpUsuario, motivo: tmpMotivo)
            //print("\nLogueando error" +tmpLog+ "Error en evento :"+tmpLog.errors)
            try {
                tmpLog.save()
            }catch(Exception e){

            }
        }

    }

    def loguearAdvertencia(String tmpEvento, String tmpUsuario, String tmpMotivo){
        if(enable){
            def tmpLog = new Log(fecha_evento: LocalDateTime.now().toString(), tipo_log: "Advertencia", evento: tmpEvento, usuario: tmpUsuario, motivo: tmpMotivo)
            //print("\nLogueando advertencia"+tmpLog+ "Error en evento :"+tmpLog.errors)
            try {
                tmpLog.save()
            }catch(Exception e){

            }
        }

    }

    def loguearInformacion(String tmpEvento, String tmpUsuario, String tmpMotivo){
        if(enable){
            def tmpLog = new Log(fecha_evento: (LocalDateTime.now().toString()), tipo_log: "Info", evento: tmpEvento, usuario: tmpUsuario, motivo: tmpMotivo)
            //print("\nLogueando info" +tmpLog+ "\tTipo archivo"+ tmpLog.getClass()+"Error en evento :"+tmpLog.errors)
            try {
                tmpLog.save()
            }catch(Exception e){

            }

            //guardarLog(tmpLog)
        }

    }


    // TODO: borrar o usar para mejorar formato de fecha
    String fechaActual(){
        def now = LocalDateTime.now()
    }



}