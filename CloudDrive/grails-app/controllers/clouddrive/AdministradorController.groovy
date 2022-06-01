package clouddrive

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AdministradorController {

    AdministradorService administradorService
    LogController logController = new LogController(true)
    
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static defaultAction = "dirigirLoginAdmin"



    def dirigirLoginAdmin(){
        render(view: "login")
    }

    def dirigirPanel(){
        render(controller:"Administrador", view: "adminPanel")
    }


    def loguearAdmin(){
        //TODO: Implementar logica
        redirect(action: "dirigirPanel")

    }


}