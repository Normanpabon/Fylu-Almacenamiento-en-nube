package clouddrive

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class UsuarioServiceSpec extends Specification {

    UsuarioService usuarioService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Usuario(...).save(flush: true, failOnError: true)
        //new Usuario(...).save(flush: true, failOnError: true)
        //Usuario usuario = new Usuario(...).save(flush: true, failOnError: true)
        //new Usuario(...).save(flush: true, failOnError: true)
        //new Usuario(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //usuario.id
    }

    void "test get"() {
        setupData()

        expect:
        usuarioService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Usuario> usuarioList = usuarioService.list(max: 2, offset: 2)

        then:
        usuarioList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        usuarioService.count() == 5
    }

    void "test delete"() {
        Long usuarioId = setupData()

        expect:
        usuarioService.count() == 5

        when:
        usuarioService.delete(usuarioId)
        sessionFactory.currentSession.flush()

        then:
        usuarioService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Usuario usuario = new Usuario()
        usuarioService.save(usuario)

        then:
        usuario.id != null
    }
}
