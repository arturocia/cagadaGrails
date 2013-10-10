package mx.amib.sistemas.solicitud.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(HorarioExamenController)
@Mock(HorarioExamen)
class HorarioExamenControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/horarioExamen/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.horarioExamenInstanceList.size() == 0
        assert model.horarioExamenInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.horarioExamenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.horarioExamenInstance != null
        assert view == '/horarioExamen/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/horarioExamen/show/1'
        assert controller.flash.message != null
        assert HorarioExamen.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/horarioExamen/list'

        populateValidParams(params)
        def horarioExamen = new HorarioExamen(params)

        assert horarioExamen.save() != null

        params.id = horarioExamen.id

        def model = controller.show()

        assert model.horarioExamenInstance == horarioExamen
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/horarioExamen/list'

        populateValidParams(params)
        def horarioExamen = new HorarioExamen(params)

        assert horarioExamen.save() != null

        params.id = horarioExamen.id

        def model = controller.edit()

        assert model.horarioExamenInstance == horarioExamen
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/horarioExamen/list'

        response.reset()

        populateValidParams(params)
        def horarioExamen = new HorarioExamen(params)

        assert horarioExamen.save() != null

        // test invalid parameters in update
        params.id = horarioExamen.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/horarioExamen/edit"
        assert model.horarioExamenInstance != null

        horarioExamen.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/horarioExamen/show/$horarioExamen.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        horarioExamen.clearErrors()

        populateValidParams(params)
        params.id = horarioExamen.id
        params.version = -1
        controller.update()

        assert view == "/horarioExamen/edit"
        assert model.horarioExamenInstance != null
        assert model.horarioExamenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/horarioExamen/list'

        response.reset()

        populateValidParams(params)
        def horarioExamen = new HorarioExamen(params)

        assert horarioExamen.save() != null
        assert HorarioExamen.count() == 1

        params.id = horarioExamen.id

        controller.delete()

        assert HorarioExamen.count() == 0
        assert HorarioExamen.get(horarioExamen.id) == null
        assert response.redirectedUrl == '/horarioExamen/list'
    }
}
