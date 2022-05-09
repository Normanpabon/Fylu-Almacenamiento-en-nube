package clouddrive

class Usuario {

    int uid
    String nombre_usuario
    String correo
    String hashed_pass
    int activo
    int cuota
    

    static constraints = {
        uid(unique:true)
        nombre_usuario(unique:true, nullable:false)
        correo(nullable:false, email: true)
        activo inList:[0, 1]
        cuota(min: 5120)
        // Quizas añadir constrainst para tamaños permitidos por la bd
    }


    // mapping : orden de guardado en persistencia ( bd )

    static mapping = {
        table 'usuarios'
        uid column : 'uid', generator: 'identity'
        nombre_usuario column : 'nombre_usuario'
        correo column : 'correo'
        hashed_pass column : 'hashed_pass'
        activo column : 'activo'
        cuota column : 'cuota'
    }


}
