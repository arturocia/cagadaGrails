package mx.amib.sistemas.solicitud.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(ModalidadCapacitacionController)
@Mock(ModalidadCapacitacion)
class ModalidadCapacitacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/modalidadCapacitacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.modalidadCapacitacionInstanceList.size() == 0
        assert model.modalidadCapacitacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.modalidadCapacitacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.modalidadCapacitacionInstance != null
        assert view == '/modalidadCapacitacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/modalidadCapacitacion/show/1'
        assert controller.flash.message != null
        assert ModalidadCapacitacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCapacitacion/list'

        populateValidParams(params)
        def modalidadCapacitacion = new ModalidadCapacitacion(params)

        assert modalidadCapacitacion.save() != null

        params.id = modalidadCapacitacion.id

        def model = controller.show()

        assert model.modalidadCapacitacionInstance == modalidadCapacitacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCapacitacion/list'

        populateValidParams(params)
        def modalidadCapacitacion = new ModalidadCapacitacion(params)

        assert modalidadCapacitacion.save() != null

        params.id = modalidadCapacitacion.id

        def model = controller.edit()

        assert model.modalidadCapacitacionInstance == modalidadCapacitacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCapacitacion/list'

        response.reset()

        populateValidParams(params)
        def modalidadCapacitacion = new ModalidadCapacitacion(params)

        assert modalidadCapacitacion.save() != null

        // test invalid parameters in update
        params.id = modalidadCapacitacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/modalidadCapacitacion/edit"
        assert model.modalidadCapacitacionInstance != null

        modalidadCapacitacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/modalidadCapacitacion/show/$modalidadCapacitacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        modalidadCapacitacion.clearErrors()

        populateValidParams(params)
        params.id = modalidadCapacitacion.id
        params.version = -1
        controller.update()

        assert view == "/modalidadCapacitacion/edit"
        assert model.modalidadCapacitacionInstance != null
        assert model.modalidadCapacitacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCapacitacion/list'

        response.reset()

        populateValidParams(params)
        def modalidadCapacitacion = new ModalidadCapacitacion(params)

        assert modalidadCapacitacion.save() != null
        assert ModalidadCapacitacion.count() == 1

        params.id = modalidadCapacitacion.id

        controller.delete()

        assert ModalidadCapacitacion.count() == 0
        assert ModalidadCapacitacion.get(modalidadCapacitacion.id) == null
        assert response.redirectedUrl == '/modalidadCapacitacion/list'
    }
}
