package clouddrive

import grails.gorm.services.Service

@Service(Archivo)
interface ArchivoService {

    Archivo get(Serializable id)

    List<Archivo> list(Map args)

    Long count()

    void delete(Serializable id)

    Archivo save(Archivo archivo)

}