package clouddrive

import grails.gorm.services.Service

@Service(Administrador)
interface AdministradorService {

    Administrador get(Serializable id)

    List<Administrador> list(Map args)

    Long count()

    void delete(Serializable id)

    Administrador save(Administrador administrador)

}


