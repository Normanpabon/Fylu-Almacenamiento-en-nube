package clouddrive

class Log {

    int id
    String fecha_evento
    String tipo_log
    String evento
    String usuario 
    String motivo 


    static constraints = {
        id(unique:true)
        fecha_evento(nullable:false, blank:false)
        tipo_log(nullable:false, inList:["Error", "Info", "Advertencia"])
        evento(nullable:false)
        usuario(nullable:true, blank:true)
        motivo(nullable:true, blank:true)

    }


    static mapping = {
        table 'logs'
        id column : 'id'
        fecha_evento column : 'fecha_evento'
        tipo_log column : 'tipo_log'
        evento column : 'evento'
        usuario column : 'usuario'
        motivo column : 'motivo'
    }


}
