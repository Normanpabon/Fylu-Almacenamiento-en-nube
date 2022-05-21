package clouddrive

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UsuarioController {

    UsuarioService usuarioService
    

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def registrarUsuario(){

        //verificar cuando se implemente la vista, que si este hasheando el parametro correcto
        params.hashed_pass = params.hashed_pass.digest('SHA-256') 
        def tmpUser = new Usuario(params)
        if(tmpUser != null){
            try{
                usuarioService.save(tmpUser)
                //notificar al usuario creacion exitosa ¿Redirigir al perfil ? 
            }catch(ValidationException e){
                //notificar al usuario
                return
            }
        }
    }

    def dirigirLogin(){
        
        render(view: "loginTest")
    }

    def dirigirRegistro(){
        render(view:"registroTest") // esta bugueada esa madre
    }

    def dirigirPerfil(){
        respond usuarioService.get()
    }

    def loguearUsuario(){
        
        //GORM querie

        def tmpUser = Usuario.findByNombre_usuario(params.usuario)
       
        if(tmpUser != null){

            render "Usuario encontrado, logueado correctamente. DEBUG params: " + params
            
            if(tmpUser.getHashed_pass() == params.hashed_pass.digest('SHA-256')){
                //logueo exitoso
                setUsuarioActual(tmpUser.getId())

                //redirigir a perfil

            }else{
                // mostrar usuario o contraseña incorrectos
            }
        }else{
            // mostrar usuario o contraseña incorrectos
        }
        

        //llamar a setUsuarioActual si este se autentica correctamente
    }

    def setUsuarioActual(int id){
        // colocar id del usuario o nombre de usuario en la cookie para autenticarlo
        def tmpUser = [uid: id]
        session["user"] = tmpUser
        //verificar funcionamiento
        render "Añadido usuario $tmpUser a la session" // borrar

    }

    def cerrarSesion(){
        
        // revocar cookie

        session.invalidate()
        //redirect(action: "login")  //quitar comentario cuando se tenga la pagina del login

    }

    def modContra(){
        //logic
        // encontrar usuario con id del cookie  ? si no esta logueado, la cookie con id de usuario no estaria inicializada
        def tmpUser = usuarioService.get(session.user)
        
        // se espera params.viejaContra y params.nuevaContra
        if(tmpUser != null){
            if(tmpUser.getHashed_pass == params.viejaContra.digest('SHA-256')){
                tmpUser.hashed_pass = params.viejaContra.digest('SHA-256')
                tmpUser.save()
            }else{
                //todo notificar al usuario de error en la contraseña anterior
            }
        }else{
            //redirect(action: "login")  //quitar comentario cuando se tenga la pagina del login
        }
        
    }

    def modCorreo(){
        //logic
        def tmpUser = usuarioService.get(session.user)
        
        // se espera params.correoNuevo 
        
        if(tmpUser != null){
            tmpUser.correo = params.correoNuevo
            tmpUser.save()
        
        }else{
            //redirect(action: "login")  //quitar comentario cuando se tenga la pagina del login
        }

    }

    def verPerfilUsuario(){
        //logic
        def tmpUser = usuarioService.get(session.user)

        // aca seria tener una vista de perfil y pasarle de parametro el id del usuario a renderizar los datos o el obj temporal "tmpUser"
    }


    // metodos generados por grails (una vez finalizado lo demas, debemos limpiar)

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond usuarioService.list(params), model:[usuarioCount: usuarioService.count()]
        
    }

    def show(Long id) {
        respond usuarioService.get(id)
    }

    def create() {
        respond new Usuario(params)
    }

    def save(Usuario usuario) {
        if (usuario == null) {
            notFound()
            return
        }

        try {
            usuarioService.save(usuario)
        } catch (ValidationException e) {
            respond usuario.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*' { respond usuario, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond usuarioService.get(id)
    }

    def update(Usuario usuario) {
        if (usuario == null) {
            notFound()
            return
        }

        try {
            usuarioService.save(usuario)
        } catch (ValidationException e) {
            respond usuario.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*'{ respond usuario, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        usuarioService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
