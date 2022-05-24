package clouddrive

class Permiso {

    int id
    Archivo file_id
    String tipo
    Usuario uid_permitido

    static constraints = {
        id(unique:true)
        tipo inList:["R", "RW"]
    }

    static mapping = {
        table 'permisos'
        id column : 'id'
        file_id column : 'file_id'
        tipo column : 'tipo'
        uid_permitido column : 'uid_permitido'
    }
}
