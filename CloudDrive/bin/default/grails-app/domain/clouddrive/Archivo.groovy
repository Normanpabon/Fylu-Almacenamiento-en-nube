package clouddrive

class Archivo {

    int id
    Usuario uid_usr
    String nombre
    int size
    String file_path
    

    static constraints = {
        id(unique:true)
    }

    static mapping = {
        table 'archivos'
        id column : 'id'
        uid_usr column : 'uid_usr'
        nombre column : 'nombre'
        size column : 'size', defaultValue: 0
        file_path column : 'file_path'
    }
}
