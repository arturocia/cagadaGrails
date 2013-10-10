package mx.amib.sistemas.solicitante.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoTelefonoController)
@Mock(TipoTelefono)
class TipoTelefonoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoTelefono/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoTelefonoInstanceList.size() == 0
        assert model.tipoTelefonoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoTelefonoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoTelefonoInstance != null
        assert view == '/tipoTelefono/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoTelefono/show/1'
        assert controller.flash.message != null
        assert TipoTelefono.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoTelefono/list'

        populateValidParams(params)
        def tipoTelefono = new TipoTelefono(params)

        assert tipoTelefono.save() != null

        params.id = tipoTelefono.id

        def model = controller.show()

        assert model.tipoTelefonoInstance == tipoTelefono
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoTelefono/list'

        populateValidParams(params)
        def tipoTelefono = new TipoTelefono(params)

        assert tipoTelefono.save() != null

        params.id = tipoTelefono.id

        def model = controller.edit()

        assert model.tipoTelefonoInstance == tipoTelefono
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoTelefono/list'

        response.reset()

        populateValidParams(params)
        def tipoTelefono = new TipoTelefono(params)

        assert tipoTelefono.save() != null

        // test invalid parameters in update
        params.id = tipoTelefono.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoTelefono/edit"
        assert model.tipoTelefonoInstance != null

        tipoTelefono.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoTelefono/show/$tipoTelefono.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoTelefono.clearErrors()

        populateValidParams(params)
        params.id = tipoTelefono.id
        params.version = -1
        controller.update()

        assert view == "/tipoTelefono/edit"
        assert model.tipoTelefonoInstance != null
        assert model.tipoTelefonoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoTelefono/list'

        response.reset()

        populateValidParams(params)
        def tipoTelefono = new TipoTelefono(params)

        assert tipoTelefono.save() != null
        assert TipoTelefono.count() == 1

        params.id = tipoTelefono.id

        controller.delete()

        assert TipoTelefono.count() == 0
        assert TipoTelefono.get(tipoTelefono.id) == null
        assert response.redirectedUrl == '/tipoTelefono/list'
    }
}
