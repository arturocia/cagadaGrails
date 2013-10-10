package mx.amib.sistemas.solicitud.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(InstitutoCapacitadorController)
@Mock(InstitutoCapacitador)
class InstitutoCapacitadorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/institutoCapacitador/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.institutoCapacitadorInstanceList.size() == 0
        assert model.institutoCapacitadorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.institutoCapacitadorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.institutoCapacitadorInstance != null
        assert view == '/institutoCapacitador/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/institutoCapacitador/show/1'
        assert controller.flash.message != null
        assert InstitutoCapacitador.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/institutoCapacitador/list'

        populateValidParams(params)
        def institutoCapacitador = new InstitutoCapacitador(params)

        assert institutoCapacitador.save() != null

        params.id = institutoCapacitador.id

        def model = controller.show()

        assert model.institutoCapacitadorInstance == institutoCapacitador
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/institutoCapacitador/list'

        populateValidParams(params)
        def institutoCapacitador = new InstitutoCapacitador(params)

        assert institutoCapacitador.save() != null

        params.id = institutoCapacitador.id

        def model = controller.edit()

        assert model.institutoCapacitadorInstance == institutoCapacitador
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/institutoCapacitador/list'

        response.reset()

        populateValidParams(params)
        def institutoCapacitador = new InstitutoCapacitador(params)

        assert institutoCapacitador.save() != null

        // test invalid parameters in update
        params.id = institutoCapacitador.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/institutoCapacitador/edit"
        assert model.institutoCapacitadorInstance != null

        institutoCapacitador.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/institutoCapacitador/show/$institutoCapacitador.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        institutoCapacitador.clearErrors()

        populateValidParams(params)
        params.id = institutoCapacitador.id
        params.version = -1
        controller.update()

        assert view == "/institutoCapacitador/edit"
        assert model.institutoCapacitadorInstance != null
        assert model.institutoCapacitadorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/institutoCapacitador/list'

        response.reset()

        populateValidParams(params)
        def institutoCapacitador = new InstitutoCapacitador(params)

        assert institutoCapacitador.save() != null
        assert InstitutoCapacitador.count() == 1

        params.id = institutoCapacitador.id

        controller.delete()

        assert InstitutoCapacitador.count() == 0
        assert InstitutoCapacitador.get(institutoCapacitador.id) == null
        assert response.redirectedUrl == '/institutoCapacitador/list'
    }
}
