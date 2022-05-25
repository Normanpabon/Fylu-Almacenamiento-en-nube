package clouddrive

import grails.gorm.services.Service

@Service(Permiso)
interface PermisoService {
    Permiso get(Serializable id)

    List<Permiso> list(Map args)

    Long count()

    void delete(Serializable id)
    
    Permiso save(Permiso permiso)

}
