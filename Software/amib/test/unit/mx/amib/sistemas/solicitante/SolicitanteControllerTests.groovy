package mx.amib.sistemas.solicitante



import org.junit.*
import grails.test.mixin.*

@TestFor(SolicitanteController)
@Mock(Solicitante)
class SolicitanteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/solicitante/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.solicitanteInstanceList.size() == 0
        assert model.solicitanteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.solicitanteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.solicitanteInstance != null
        assert view == '/solicitante/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/solicitante/show/1'
        assert controller.flash.message != null
        assert Solicitante.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/solicitante/list'

        populateValidParams(params)
        def solicitante = new Solicitante(params)

        assert solicitante.save() != null

        params.id = solicitante.id

        def model = controller.show()

        assert model.solicitanteInstance == solicitante
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/solicitante/list'

        populateValidParams(params)
        def solicitante = new Solicitante(params)

        assert solicitante.save() != null

        params.id = solicitante.id

        def model = controller.edit()

        assert model.solicitanteInstance == solicitante
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/solicitante/list'

        response.reset()

        populateValidParams(params)
        def solicitante = new Solicitante(params)

        assert solicitante.save() != null

        // test invalid parameters in update
        params.id = solicitante.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/solicitante/edit"
        assert model.solicitanteInstance != null

        solicitante.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/solicitante/show/$solicitante.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        solicitante.clearErrors()

        populateValidParams(params)
        params.id = solicitante.id
        params.version = -1
        controller.update()

        assert view == "/solicitante/edit"
        assert model.solicitanteInstance != null
        assert model.solicitanteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/solicitante/list'

        response.reset()

        populateValidParams(params)
        def solicitante = new Solicitante(params)

        assert solicitante.save() != null
        assert Solicitante.count() == 1

        params.id = solicitante.id

        controller.delete()

        assert Solicitante.count() == 0
        assert Solicitante.get(solicitante.id) == null
        assert response.redirectedUrl == '/solicitante/list'
    }
}
