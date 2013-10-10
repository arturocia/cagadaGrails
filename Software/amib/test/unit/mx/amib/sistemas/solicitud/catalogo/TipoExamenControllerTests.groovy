package mx.amib.sistemas.solicitud.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoExamenController)
@Mock(TipoExamen)
class TipoExamenControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoExamen/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoExamenInstanceList.size() == 0
        assert model.tipoExamenInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoExamenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoExamenInstance != null
        assert view == '/tipoExamen/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoExamen/show/1'
        assert controller.flash.message != null
        assert TipoExamen.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoExamen/list'

        populateValidParams(params)
        def tipoExamen = new TipoExamen(params)

        assert tipoExamen.save() != null

        params.id = tipoExamen.id

        def model = controller.show()

        assert model.tipoExamenInstance == tipoExamen
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoExamen/list'

        populateValidParams(params)
        def tipoExamen = new TipoExamen(params)

        assert tipoExamen.save() != null

        params.id = tipoExamen.id

        def model = controller.edit()

        assert model.tipoExamenInstance == tipoExamen
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoExamen/list'

        response.reset()

        populateValidParams(params)
        def tipoExamen = new TipoExamen(params)

        assert tipoExamen.save() != null

        // test invalid parameters in update
        params.id = tipoExamen.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoExamen/edit"
        assert model.tipoExamenInstance != null

        tipoExamen.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoExamen/show/$tipoExamen.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoExamen.clearErrors()

        populateValidParams(params)
        params.id = tipoExamen.id
        params.version = -1
        controller.update()

        assert view == "/tipoExamen/edit"
        assert model.tipoExamenInstance != null
        assert model.tipoExamenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoExamen/list'

        response.reset()

        populateValidParams(params)
        def tipoExamen = new TipoExamen(params)

        assert tipoExamen.save() != null
        assert TipoExamen.count() == 1

        params.id = tipoExamen.id

        controller.delete()

        assert TipoExamen.count() == 0
        assert TipoExamen.get(tipoExamen.id) == null
        assert response.redirectedUrl == '/tipoExamen/list'
    }
}
