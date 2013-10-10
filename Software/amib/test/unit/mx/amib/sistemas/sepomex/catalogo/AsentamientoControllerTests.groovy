package mx.amib.sistemas.sepomex.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(AsentamientoController)
@Mock(Asentamiento)
class AsentamientoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/asentamiento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.asentamientoInstanceList.size() == 0
        assert model.asentamientoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.asentamientoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.asentamientoInstance != null
        assert view == '/asentamiento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/asentamiento/show/1'
        assert controller.flash.message != null
        assert Asentamiento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/asentamiento/list'

        populateValidParams(params)
        def asentamiento = new Asentamiento(params)

        assert asentamiento.save() != null

        params.id = asentamiento.id

        def model = controller.show()

        assert model.asentamientoInstance == asentamiento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/asentamiento/list'

        populateValidParams(params)
        def asentamiento = new Asentamiento(params)

        assert asentamiento.save() != null

        params.id = asentamiento.id

        def model = controller.edit()

        assert model.asentamientoInstance == asentamiento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/asentamiento/list'

        response.reset()

        populateValidParams(params)
        def asentamiento = new Asentamiento(params)

        assert asentamiento.save() != null

        // test invalid parameters in update
        params.id = asentamiento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/asentamiento/edit"
        assert model.asentamientoInstance != null

        asentamiento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/asentamiento/show/$asentamiento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        asentamiento.clearErrors()

        populateValidParams(params)
        params.id = asentamiento.id
        params.version = -1
        controller.update()

        assert view == "/asentamiento/edit"
        assert model.asentamientoInstance != null
        assert model.asentamientoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/asentamiento/list'

        response.reset()

        populateValidParams(params)
        def asentamiento = new Asentamiento(params)

        assert asentamiento.save() != null
        assert Asentamiento.count() == 1

        params.id = asentamiento.id

        controller.delete()

        assert Asentamiento.count() == 0
        assert Asentamiento.get(asentamiento.id) == null
        assert response.redirectedUrl == '/asentamiento/list'
    }
}
