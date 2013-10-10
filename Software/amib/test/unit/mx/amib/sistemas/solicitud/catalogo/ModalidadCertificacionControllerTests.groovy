package mx.amib.sistemas.solicitud.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(ModalidadCertificacionController)
@Mock(ModalidadCertificacion)
class ModalidadCertificacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/modalidadCertificacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.modalidadCertificacionInstanceList.size() == 0
        assert model.modalidadCertificacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.modalidadCertificacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.modalidadCertificacionInstance != null
        assert view == '/modalidadCertificacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/modalidadCertificacion/show/1'
        assert controller.flash.message != null
        assert ModalidadCertificacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCertificacion/list'

        populateValidParams(params)
        def modalidadCertificacion = new ModalidadCertificacion(params)

        assert modalidadCertificacion.save() != null

        params.id = modalidadCertificacion.id

        def model = controller.show()

        assert model.modalidadCertificacionInstance == modalidadCertificacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCertificacion/list'

        populateValidParams(params)
        def modalidadCertificacion = new ModalidadCertificacion(params)

        assert modalidadCertificacion.save() != null

        params.id = modalidadCertificacion.id

        def model = controller.edit()

        assert model.modalidadCertificacionInstance == modalidadCertificacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCertificacion/list'

        response.reset()

        populateValidParams(params)
        def modalidadCertificacion = new ModalidadCertificacion(params)

        assert modalidadCertificacion.save() != null

        // test invalid parameters in update
        params.id = modalidadCertificacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/modalidadCertificacion/edit"
        assert model.modalidadCertificacionInstance != null

        modalidadCertificacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/modalidadCertificacion/show/$modalidadCertificacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        modalidadCertificacion.clearErrors()

        populateValidParams(params)
        params.id = modalidadCertificacion.id
        params.version = -1
        controller.update()

        assert view == "/modalidadCertificacion/edit"
        assert model.modalidadCertificacionInstance != null
        assert model.modalidadCertificacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/modalidadCertificacion/list'

        response.reset()

        populateValidParams(params)
        def modalidadCertificacion = new ModalidadCertificacion(params)

        assert modalidadCertificacion.save() != null
        assert ModalidadCertificacion.count() == 1

        params.id = modalidadCertificacion.id

        controller.delete()

        assert ModalidadCertificacion.count() == 0
        assert ModalidadCertificacion.get(modalidadCertificacion.id) == null
        assert response.redirectedUrl == '/modalidadCertificacion/list'
    }
}
