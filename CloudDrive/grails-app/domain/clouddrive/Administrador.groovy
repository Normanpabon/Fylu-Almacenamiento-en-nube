package clouddrive

class Administrador {

    int id
    String nombre_admin
    String correo
    String hashed_pass
    int activo
    

    // TODO: implementar la logica del UML

    static constraints = {
        id(unique:true)
        nombre_admin(unique:true, nullable:false)
        correo(nullable:true, email: true)
        activo (inList:[0, 1],  blank: true)
        hashed_pass(password: true)
    }

    static mapping = {
        table 'administradores'
        id column : 'id'
        nombre_admin column : 'nombre_admin'
        correo column : 'correo'
        hashed_pass column : 'hashed_pass'
        activo column : 'activo', defaultValue: 1
    }
    
}