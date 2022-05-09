package clouddrive

class Archivo {

    int file_id
    Usuario uid_usr
    int size
    String file_path

    static constraints = {
        file_id(unique:true)
    }

    static mapping = {
        table 'archivos'
        file_id column : 'file_id'
        uid_usr column : 'uid_usr'
        size column : 'size'
        file_path column : 'file_path'
    }
}
