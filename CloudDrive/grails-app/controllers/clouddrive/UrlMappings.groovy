package clouddrive

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/usuario/loginTest") //Vista renderizada por defecto
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
