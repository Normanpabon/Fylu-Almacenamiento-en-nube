package clouddrive

class Permiso {

    int p_id
    Archivo file_id
    String tipo
    Usuario uid_permitido

    static constraints = {
        p_id(unique:true)
        tipo inList:["R", "RW"]
    }

    static mapping = {
        table 'permisos'
        p_id column : 'p_id'
        file_id column : 'file_id'
        tipo column : 'tipo'
        uid_permitido column : 'uid_permitido'
    }
}
