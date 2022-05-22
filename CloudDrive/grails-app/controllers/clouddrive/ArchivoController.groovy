package clouddrive

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ArchivoController {

    static String pathToData = new File(".").getCanonicalPath()+"\\data\\"

    ArchivoService archivoService
    UsuarioService usuarioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        // listar los archivos del usuario logueado y meterlos en el params
    }

    def descargarArchivo(){
        // logica
    }

    def eliminarArchivo(){
        //logica
    }

    def subirArchivo(){
        def archivo = request.getFile('myFile')

        String tmpUser = Usuario.get(session.user) + "\\"
        // todo: corregir por nombre original del archivo
        String tmpFileName = "archivo.txt"
        String tmpPath = pathToData+tmpUser+fileName
        if(archivo.empty){
            render "Error el archivo esta vacio"

            //todo : aca manejar el error mostrando una ventana emergente o algo

        }else{
            
            // llamar a accion de crear archivo (dejar registro en la bd)
            crearArchivo(tmpPath, tmpFileName)
            
            // transfiere el archivo a la ubicacion dada
            archivo.transferTo(new File(tmpPath))

            // todo : una vez finalizada la subida, recargar la vista
            
        }

        
    }

    def crearArchivo(tPath, nombre){
        // todo calcular tamaño de archivo o ver como pasarlo por parametro

        def tmpArchivo = new Archivo(uid_usr:session.usuario, size:0, file_path:tPath, nombre:nombre)
        // todo: verificar que el archivo no exista
        if(true){
            try{
                archivoService.save(tmpArchivo)

                flash.message = 'Archivo creado correctamente '
                redirect(controller: "UsuarioController", action: "dirigirPerfil")
            }catch(ValidationException e){
                render "Error al subir el archivo"
            }
        
        }else{
            // todo: notificar que el archivo ya existe
        }

    }

    def listarArchivos(){
        
    }
}
