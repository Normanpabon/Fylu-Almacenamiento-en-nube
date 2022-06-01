package clouddrive

import grails.gorm.services.Service


@Service(Log)
interface LogService {

    Log get(Serializable id)

    List<Log> list(Map args)

    Long count()

    void delete(Serializable id)
    
    Log save(Log log)

}