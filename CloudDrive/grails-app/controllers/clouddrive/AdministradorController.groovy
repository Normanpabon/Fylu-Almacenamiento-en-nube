package clouddrive

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.apache.commons.lang.RandomStringUtils

class AdministradorController {

    AdministradorService administradorService
    LogController logController = new LogController(true)
    
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static defaultAction = "dirigirLoginAdmin"

    def generarClave(int caracteres){
        String charset = (('A'..'Z') + ('0'..'9') + ('a'..'z')).join()
        return RandomStringUtils.random(caracteres, charset)
    }

    def dirigirUsuarios(){
        verificarAdminLogueado()
        render(view: "administracionUsuarios")
    }

    def dirigirAdministradores(){
        verificarAdminLogueado()
        remder(view: "administracionAdmins")
    }

    def dirigirLoginAdmin(){
        defaultAdmin()
        render(view: "login")
    }

    def dirigirPanel(){
        listarLogs()
        render(controller:"Administrador", view: "adminPanel")
    }

    def listarLogs(){
        verificarAdminLogueado()
        def logList = Log.findAll()

        if(logList != null){
            params.logList = logList
        }

    }


    def loguearAdmin(){
               

        def tmpAdmin = Administrador.findByNombre_admin(params.adminUser)


        params.adminPass = params.adminPass+params.adminUser
        params.adminPass = params.adminPass.digest('SHA-256')


        if(tmpAdmin != null){

            if(tmpAdmin.hashed_pass == params.adminPass && tmpAdmin.activo == 1){
                setAdmin(tmpAdmin.getId())

                logController.loguearAdvertencia("LoginAdmin", params.adminUser, "Administrador logueado correctamente")

                redirect(action: "dirigirPanel")
            }else{

                //reportar en el log
                logController.loguearAdvertencia("LoginAdmin", params.adminUser, "Intento fallido acceso, clave incorrecta")
                redirect(action: "dirigirLoginAdmin")
            }


        }else{
            logController.loguearAdvertencia("LoginAdmin", params.adminUser, "Intento fallido acceso, usuario incorrecto")
            redirect(action: "dirigirLoginAdmin")
        }

    }

    def setAdmin(int id){
        session["admin"] = id
    }

    // crea un admin en caso de que no exista ninguno registrado
    def defaultAdmin(){
        // todo : terminar logica para que no se cree si hay otro usuario tambien
        if(administradorService.get(0) == null){
            String tmpAdName = "cloudAdmin"
            String tmpPass = generarClave(8)
            print("\nAdministrador no encontrado, creando uno nuevo.\n Usuario: cloudAdmin\n clave acceso: "+tmpPass)
            tmpPass = (tmpPass+tmpAdName)
            def defaultAdmin = new Administrador(nombre_admin: tmpAdName, correo: null, hashed_pass:tmpPass.digest('SHA-256'), activo:1)
            try{
                administradorService.save(defaultAdmin)
                
            }catch(Exception e){
                print(e)
                logController.loguearError("Creacion admin default", "null", "Error al crear cuenta default de administracion " + e)
            }
            
            logController.loguearAdvertencia("AdminDefault", tmpAdName, "Se crea administrador default")
        }
        

        // todo, generar clave random y notificar al usuario
    }

    def verificarAdminLogueado(){

        def tmpAdmin = Administrador.get(session.admin)
        if(tmpAdmin == null){
            redirect(action: "dirigirLoginAdmin")
        }else{
            if(tmpAdmin.activo == 0){
                redirect(action: "dirigirLoginAdmin")
            }
        }
    }


}