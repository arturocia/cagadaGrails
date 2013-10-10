package mx.amib.sistemas.solicitante



import org.junit.*
import grails.test.mixin.*

@TestFor(TelefonoSolicitanteController)
@Mock(TelefonoSolicitante)
class TelefonoSolicitanteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/telefonoSolicitante/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.telefonoSolicitanteInstanceList.size() == 0
        assert model.telefonoSolicitanteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.telefonoSolicitanteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.telefonoSolicitanteInstance != null
        assert view == '/telefonoSolicitante/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/telefonoSolicitante/show/1'
        assert controller.flash.message != null
        assert TelefonoSolicitante.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoSolicitante/list'

        populateValidParams(params)
        def telefonoSolicitante = new TelefonoSolicitante(params)

        assert telefonoSolicitante.save() != null

        params.id = telefonoSolicitante.id

        def model = controller.show()

        assert model.telefonoSolicitanteInstance == telefonoSolicitante
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoSolicitante/list'

        populateValidParams(params)
        def telefonoSolicitante = new TelefonoSolicitante(params)

        assert telefonoSolicitante.save() != null

        params.id = telefonoSolicitante.id

        def model = controller.edit()

        assert model.telefonoSolicitanteInstance == telefonoSolicitante
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoSolicitante/list'

        response.reset()

        populateValidParams(params)
        def telefonoSolicitante = new TelefonoSolicitante(params)

        assert telefonoSolicitante.save() != null

        // test invalid parameters in update
        params.id = telefonoSolicitante.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/telefonoSolicitante/edit"
        assert model.telefonoSolicitanteInstance != null

        telefonoSolicitante.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/telefonoSolicitante/show/$telefonoSolicitante.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        telefonoSolicitante.clearErrors()

        populateValidParams(params)
        params.id = telefonoSolicitante.id
        params.version = -1
        controller.update()

        assert view == "/telefonoSolicitante/edit"
        assert model.telefonoSolicitanteInstance != null
        assert model.telefonoSolicitanteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/telefonoSolicitante/list'

        response.reset()

        populateValidParams(params)
        def telefonoSolicitante = new TelefonoSolicitante(params)

        assert telefonoSolicitante.save() != null
        assert TelefonoSolicitante.count() == 1

        params.id = telefonoSolicitante.id

        controller.delete()

        assert TelefonoSolicitante.count() == 0
        assert TelefonoSolicitante.get(telefonoSolicitante.id) == null
        assert response.redirectedUrl == '/telefonoSolicitante/list'
    }
}
