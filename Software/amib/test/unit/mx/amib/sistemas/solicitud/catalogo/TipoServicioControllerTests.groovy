package mx.amib.sistemas.solicitud.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoServicioController)
@Mock(TipoServicio)
class TipoServicioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoServicio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoServicioInstanceList.size() == 0
        assert model.tipoServicioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoServicioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoServicioInstance != null
        assert view == '/tipoServicio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoServicio/show/1'
        assert controller.flash.message != null
        assert TipoServicio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoServicio/list'

        populateValidParams(params)
        def tipoServicio = new TipoServicio(params)

        assert tipoServicio.save() != null

        params.id = tipoServicio.id

        def model = controller.show()

        assert model.tipoServicioInstance == tipoServicio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoServicio/list'

        populateValidParams(params)
        def tipoServicio = new TipoServicio(params)

        assert tipoServicio.save() != null

        params.id = tipoServicio.id

        def model = controller.edit()

        assert model.tipoServicioInstance == tipoServicio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoServicio/list'

        response.reset()

        populateValidParams(params)
        def tipoServicio = new TipoServicio(params)

        assert tipoServicio.save() != null

        // test invalid parameters in update
        params.id = tipoServicio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoServicio/edit"
        assert model.tipoServicioInstance != null

        tipoServicio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoServicio/show/$tipoServicio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoServicio.clearErrors()

        populateValidParams(params)
        params.id = tipoServicio.id
        params.version = -1
        controller.update()

        assert view == "/tipoServicio/edit"
        assert model.tipoServicioInstance != null
        assert model.tipoServicioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoServicio/list'

        response.reset()

        populateValidParams(params)
        def tipoServicio = new TipoServicio(params)

        assert tipoServicio.save() != null
        assert TipoServicio.count() == 1

        params.id = tipoServicio.id

        controller.delete()

        assert TipoServicio.count() == 0
        assert TipoServicio.get(tipoServicio.id) == null
        assert response.redirectedUrl == '/tipoServicio/list'
    }
}
