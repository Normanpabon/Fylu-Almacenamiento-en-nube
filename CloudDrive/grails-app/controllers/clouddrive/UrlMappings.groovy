package clouddrive

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        // para documentacion de problemas

        //"/"(view:"/usuario/loginTest") //Vista renderizada por defecto
        //"/"(view:"/usuario/dirigirLogin")

        // quickFix
        "/"(controller:"Usuario", action:"dirigirLogin")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
