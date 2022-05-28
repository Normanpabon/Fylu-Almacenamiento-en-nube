package clouddrive

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import java.io.File

class ArchivoController {

    static String pathToData = new File(".").getCanonicalPath()

    ArchivoService archivoService
    UsuarioService usuarioService
    PermisoService permisoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    // Manejo de permisos (de archivos)

    def otorgarPermiso(){
        // espera params con key archivoACompartir
        // nota se deberia validar que el usuario sea el propietario
        def tmpSharedUser = Usuario.findByNombre_usuario(params.usuarioACompartir)

        if(tmpSharedUser == null){
            flash.message = "El usuario no existe"
            redirect(controller: "usuario", action: "dirigirHome")

        }

        // todo : el tipo es provicional, se espera implementar permisos de lectura y lectura/escritura (R, RW)
        //print("\n\nDebug info : Archivo a compartir " + params.archivoACompartir + " usuario :" + tmpSharedUser)
        def tmpPermiso = new Permiso(file_id: Archivo.get(params.archivoACompartir), tipo:"RW", uid_permitido: tmpSharedUser)


        // verifica si el permiso existe
        if(!existePermiso(params.archivoACompartir, tmpSharedUser)){
            try{
                permisoService.save(tmpPermiso)
                redirect(controller: "usuario", action: "dirigirHome")
            }catch (ValidationException e){
                redirect(controller: "usuario", action: "dirigirHome")
            }
        }else{
            flash.message = "El permiso ya existe"
            redirect(controller: "usuario", action: "dirigirHome")
        }


        
        // logic usuario A da permiso a usuario B sobre archivo C

    }

    def listarArchivosCompartidosMe(){
        existeDataFolder()
        // logic buscar todos los archivos compartidos con este usuario

        // devuelve lista con todos los permisos para el usuario actual
        def accessList = Permiso.findAllByUid_permitido(Usuario.get(session.user))
        ArrayList<Archivo> sharedFiles = new ArrayList()
        // recorrer la lista anterior buscando uno a uno los archivos
        print("\n\nDEBUG: accessList size : " + accessList.size()+"   OBJ = "+ accessList.getClass() +"\n\n")
        
        if(accessList.size()>0 && accessList != null){
            for(int i=0; i < accessList.size(); i++){
                def tmpPerm = accessList.get(i)
                print("\n\nDEBUG= file id = "+ tmpPerm.file_id+"   OBJ class = "+ tmpPerm.getClass() +"\n\n")
                print("tmpPerm file-uid id : " + tmpPerm.file_id.id)
                
                // accessList.get(i) --> permiso
                sharedFiles.add(Archivo.get(tmpPerm.file_id.id))

            }
            // asigna a params con key mySharedFiles la lista creada
            params.mySharedFiles = sharedFiles

            print("\nDEBUG: mySharedFiles size:" + sharedFiles.size()+ "  content : " + sharedFiles+"\n")


        }

    }

    def listarArchivosCompartidos(){
        // logic buscar todos los archivos compartidos por este usuario

    }

    def existePermiso(fileId, sharedUser){

        def accessList = Permiso.findAllByFile_id(Archivo.get(fileId))
        def tmpUser = sharedUser

        // recorremos todos los permisos de ese archivo (es feo pero funciona)
        for(int i = 0; i < accessList.size(); i++){
                if(accessList[i].uid_permitido == tmpUser ){
                    return true
                }else{
                    return false
                }
        }
        return false

    }

    def eliminarPermiso(){
        // TODO: Implementar logica
        redirect(controller: "usuario", action: "dirigirArchivosCompartidos")

        
    }


    def existeDataFolder(){
        if(!existeArchivo(pathToData+"\\data\\")){
            crearDirectorioUsuario(pathToData+"\\data\\")
        }
    }


    // Manejo de archivos

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
        existeDataFolder()
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
            render "Error al descargar el archivo" + " \n DEBUG INFO : fileId= " + fileId + "\nPath : " + pathToData+(archivoService.get(fileId)).file_path
        }
    }
        
    // anadir logica de sobrecarga para descargar multiples archivos
    /*
    def descargarArchivo(){

    }
    */

    def eliminarArchivo(){
        def fileId = params.fileToDelete
        def tmpArchivo = archivoService.get(fileId)

        try{
            archivoService.delete(fileId)

            new File(pathToData+tmpArchivo.file_path).delete()
            redirect(controller: "usuario", action: "dirigirHome")

        }catch(org.springframework.dao.DataIntegrityViolationException e){
            flash.message ="Error al borrar el archivo"
            redirect(controller: "usuario", action: "dirigirHome")

        }
    }



    def subirArchivo(){
        def archivo = request.getFile('myFile')

        String tmpUser = (Usuario.get(session.user)).nombre_usuario + "\\"

        String tmpFileName = archivo.getOriginalFilename()
        String tmpPath = pathToData+"\\data\\"+tmpUser

        // condicional para creacion de directorio
        if(!existeArchivo(tmpPath)){
            crearDirectorioUsuario(tmpPath)   
        }

        tmpPath += tmpFileName

        if(archivo.empty){
            redirect(controller: "usuario", action: "dirigirHome")
            //render "Error el archivo esta vacio \nDEBUG params : "+ params + " \n DEBUG request: " + request + " \n DEBUG session: " + session



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

            //render " se ha creado y transferido correctamente \nDEBUG params : "+ params + " \n DEBUG request: " + request + " \n DEBUG session: " + session
            //redirect(controller: "usuario", action: "dirigirHome")
            // todo : solucionar el error, cuando se intenta subir un archivo duplicado
            render "has encontrado tu primer bug we, el error es de grails "
            //render(view:"Usuario/home")

            
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


        def tmpArchivo = new Archivo(uid_usr:Usuario.get(session.user), size:fSize, file_path:tPath, nombre:nombre)
        // todo: quitar condicional, la verificacion de que el archivo existe se hace antes de este llamado
        if(true){
            try{
                archivoService.save(tmpArchivo)

                flash.message = 'Archivo creado correctamente '
                redirect(controller: "usuario", action: "dirigirHome")
            }catch(ValidationException e){
                render "Error al subir el archivo \nDEBUG params : "+ params + " \n DEBUG request: " + request + " \n DEBUG session: " + session + " \n DEBUG path: " + tPath + "\n\n TmpArchivoData: " +tmpArchivo
            }
        
        }else{
            // todo: notificar que el archivo ya existe (puede llegar aca sin que exista en la bd)
            redirect(controller: "usuario", action: "dirigirHome")
        }

    }

   
}
