package clouddrive

class Usuario {

    int id
    String nombre_usuario
    String correo
    String hashed_pass
    int activo
    int cuota
    

    static constraints = {
        id(unique:true)
        nombre_usuario(unique:true, nullable:false)
        correo(nullable:false, email: true)
        activo (inList:[0, 1],  blank: true)
        cuota(min: 5120, blank: true)
        hashed_pass(password: true)
        // Quizas añadir constrainst para tamaños permitidos por la bd
    }


    // mapping : orden de guardado en persistencia ( bd )

    static mapping = {
        table 'usuarios'
        id column : 'id'
        nombre_usuario column : 'nombre_usuario'
        correo column : 'correo'
        hashed_pass column : 'hashed_pass'
        activo column : 'activo', defaultValue: 1
        cuota column : 'cuota', defaultValue: 5120
    }


}
