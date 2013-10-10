package mx.amib.sistemas.solicitud.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(StatusSolicitudController)
@Mock(StatusSolicitud)
class StatusSolicitudControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/statusSolicitud/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.statusSolicitudInstanceList.size() == 0
        assert model.statusSolicitudInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.statusSolicitudInstance != null
    }

    void testSave() {
        controller.save()

        assert model.statusSolicitudInstance != null
        assert view == '/statusSolicitud/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/statusSolicitud/show/1'
        assert controller.flash.message != null
        assert StatusSolicitud.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/statusSolicitud/list'

        populateValidParams(params)
        def statusSolicitud = new StatusSolicitud(params)

        assert statusSolicitud.save() != null

        params.id = statusSolicitud.id

        def model = controller.show()

        assert model.statusSolicitudInstance == statusSolicitud
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/statusSolicitud/list'

        populateValidParams(params)
        def statusSolicitud = new StatusSolicitud(params)

        assert statusSolicitud.save() != null

        params.id = statusSolicitud.id

        def model = controller.edit()

        assert model.statusSolicitudInstance == statusSolicitud
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/statusSolicitud/list'

        response.reset()

        populateValidParams(params)
        def statusSolicitud = new StatusSolicitud(params)

        assert statusSolicitud.save() != null

        // test invalid parameters in update
        params.id = statusSolicitud.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/statusSolicitud/edit"
        assert model.statusSolicitudInstance != null

        statusSolicitud.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/statusSolicitud/show/$statusSolicitud.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        statusSolicitud.clearErrors()

        populateValidParams(params)
        params.id = statusSolicitud.id
        params.version = -1
        controller.update()

        assert view == "/statusSolicitud/edit"
        assert model.statusSolicitudInstance != null
        assert model.statusSolicitudInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/statusSolicitud/list'

        response.reset()

        populateValidParams(params)
        def statusSolicitud = new StatusSolicitud(params)

        assert statusSolicitud.save() != null
        assert StatusSolicitud.count() == 1

        params.id = statusSolicitud.id

        controller.delete()

        assert StatusSolicitud.count() == 0
        assert StatusSolicitud.get(statusSolicitud.id) == null
        assert response.redirectedUrl == '/statusSolicitud/list'
    }
}
