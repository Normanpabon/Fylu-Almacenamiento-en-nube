package clouddrive

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import java.io.File

class ArchivoController {

    static String pathToData = new File(".").getCanonicalPath()

    ArchivoService archivoService
    UsuarioService usuarioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    // se puede usar tambien para verificar si existe el directorio
    boolean existeArchivo(String path){

        def file = new File(path)

        if(file.exists()){
            return true
        }else{
            return false
        }

    }

     def listarArchivos(){

        def fileList = Archivo.findAllByUid_usr(Usuario.get(session.user))

        if(fileList != null){
            params.myFileList = fileList
        }
        
        
       
    }

    def calcularEspacioUsado(){

        def fileList = Archivo.findAllByUid_usr(Usuario.get(session.user))
        def acum = 0

        for(int i =0; i < fileList.size(); i++){
            acum += fileList[i].size
        }
        
        return acum
        
    }


    def calcularEspacioDisponible(){

        def espacioUsado = calcularEspacioUsado()
        
        return espacioUsado - (Usuario.get(session.user)).cuota

        //render ("espacio usado= " calcularEspacioUsado().toString() + "MB\t" + "espacio disponible = " + (espacioUsado - (Usuario.get(session.user)).cuota).toString() + "MB")
    }

    def crearDirectorioUsuario(String path){

        def file = new File(path)
        file.mkdir()

    }

    def descargarArchivo(){
        // espera params.fileToDownloadId
        def fileId = params.fileToDownloadId
        def tmpFile = new File(pathToData+(archivoService.get(fileId)).file_path)
        if(tmpFile.exists()){
            //falta probar, en espera de la vista
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "attachment;filename=\"${tmpFile.name}\"")
            response.outputStream << tmpFile.bytes
                
        }else{
            render "Error al descargar el archivo"
        }
    }
        
    // anadir logica de sobrecarga para descargar multiples archivos
    /*
    def descargarArchivo(){

    }
    */

    def eliminarArchivo(){
        def tmpArchivo = archivoService.get(session.idDelArchivo)

        try{
            tmpArchivo.delete(flush:true)
            // todo probar borrar archivo del disco tambien
            new File(pathToData+tmpArchivo.file_path).delete()

        }catch(org.springframework.dao.DataIntegrityViolationException e){

        }
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

            //verificar si el archivo ya existe, si existe sobrescribir y editar registro en la bd
            if(existeArchivo(tmpPath)){
                print("terminar")
                modArchivo(tmpFileName, ((archivo.getSize()*0.000001).round(3)))
            }else{
                crearArchivo("\\data\\"+tmpUser+tmpFileName, tmpFileName, ((archivo.getSize()*0.000001).round(3)))
            }
            
            
            // transfiere el archivo a la ubicacion dada
            archivo.transferTo(new File(tmpPath))

            render " se ha creado y transferido correctamente \nDEBUG params : "+ params + " \n DEBUG request: " + request + " \n DEBUG session: " + session

            // todo : una vez finalizada la subida, recargar la vista
            
        }

        
    }

    def modArchivo(nombre, fSize){
        def tmpArchivo = Archivo.findByNombre(nombre)

        if(tmpArchivo != null){
            // actualiza el tamaño del archivo
            tmpArchivo.size = fSize

            try {
                archivoService.save(tmpArchivo)
                flash.message = "Archivo modificado correctamente"
            } catch (ValidationException e) {
                
            }
            
        }
    }

    def crearArchivo(tPath, nombre, fSize){
        // todo calcular tamaño de archivo o ver como pasarlo por parametro

        def tmpArchivo = new Archivo(uid_usr:Usuario.get(session.user), size:fSize, file_path:tPath, nombre:nombre)
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

   
}
