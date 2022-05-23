package clouddrive

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import java.io.File

class ArchivoController {

    static String pathToData = new File(".").getCanonicalPath()

    ArchivoService archivoService
    UsuarioService usuarioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        // listar los archivos del usuario logueado y meterlos en el params
    }


    // se puede usar tambien para verificar si existe el directorio
    boolean existeArchivo(String path){

        def file = new File(path)

        if(file.exists()){
            return true
        }else{
            return false
        }

    }

    def crearDirectorioUsuario(String path){

        def file = new File(path)
        file.mkdir()

    }

    def descargarArchivo(){
        // logica
    }
        // anadir logica de sobrecarga para descargar multiples archivos
        /*
    def descargarArchivo(){

    }
    */

    def eliminarArchivo(){
        //logica
    }



    def subirArchivo(){
        def archivo = request.getFile('myFile')

        String tmpUser = (Usuario.get(session.user)).nombre_usuario + "\\"
        // todo: corregir por nombre original del archivo
        String tmpFileName = archivo.getOriginalFilename()
        String tmpPath = pathToData+"\\data\\"+tmpUser

        // condicional para creacion de directorio
        if(!existeArchivo(tmpPath)){
            crearDirectorioUsuario(tmpPath)   
        }

        tmpPath += tmpFileName

        if(archivo.empty){
            render "Error el archivo esta vacio \nDEBUG params : "+ params + " \n DEBUG request: " + request + " \n DEBUG session: " + session

            //todo : aca manejar el error mostrando una ventana emergente o algo

        }else{
            
            // llamar a accion de crear archivo (dejar registro en la bd)
            crearArchivo("\\data\\"+tmpUser+tmpFileName, tmpFileName)
            
            // transfiere el archivo a la ubicacion dada
            archivo.transferTo(new File(tmpPath))

            render " se ha creado y transferido correctamente \nDEBUG params : "+ params + " \n DEBUG request: " + request + " \n DEBUG session: " + session

            // todo : una vez finalizada la subida, recargar la vista
            
        }

        
    }

    def crearArchivo(tPath, nombre){
        // todo calcular tamaño de archivo o ver como pasarlo por parametro

        def tmpArchivo = new Archivo(uid_usr:Usuario.get(session.user), size:0, file_path:tPath, nombre:nombre)
        // todo: verificar que el archivo no exista
        if(true){
            try{
                archivoService.save(tmpArchivo)

                flash.message = 'Archivo creado correctamente '
                redirect(controller: "usuario", action: "dirigirHome")
            }catch(ValidationException e){
                render "Error al subir el archivo \nDEBUG params : "+ params + " \n DEBUG request: " + request + " \n DEBUG session: " + session + " \n DEBUG path: " + tPath + "\n\n TmpArchivoData: " +tmpArchivo
            }
        
        }else{
            // todo: notificar que el archivo ya existe
        }

    }

    def listarArchivos(){

        // todo : listar los archivos del usuario actual
        
        
    }
}
