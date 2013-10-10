package mx.amib.sistemas.solicitante.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(NivelEstudiosController)
@Mock(NivelEstudios)
class NivelEstudiosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/nivelEstudios/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.nivelEstudiosInstanceList.size() == 0
        assert model.nivelEstudiosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.nivelEstudiosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.nivelEstudiosInstance != null
        assert view == '/nivelEstudios/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/nivelEstudios/show/1'
        assert controller.flash.message != null
        assert NivelEstudios.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/nivelEstudios/list'

        populateValidParams(params)
        def nivelEstudios = new NivelEstudios(params)

        assert nivelEstudios.save() != null

        params.id = nivelEstudios.id

        def model = controller.show()

        assert model.nivelEstudiosInstance == nivelEstudios
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/nivelEstudios/list'

        populateValidParams(params)
        def nivelEstudios = new NivelEstudios(params)

        assert nivelEstudios.save() != null

        params.id = nivelEstudios.id

        def model = controller.edit()

        assert model.nivelEstudiosInstance == nivelEstudios
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/nivelEstudios/list'

        response.reset()

        populateValidParams(params)
        def nivelEstudios = new NivelEstudios(params)

        assert nivelEstudios.save() != null

        // test invalid parameters in update
        params.id = nivelEstudios.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/nivelEstudios/edit"
        assert model.nivelEstudiosInstance != null

        nivelEstudios.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/nivelEstudios/show/$nivelEstudios.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        nivelEstudios.clearErrors()

        populateValidParams(params)
        params.id = nivelEstudios.id
        params.version = -1
        controller.update()

        assert view == "/nivelEstudios/edit"
        assert model.nivelEstudiosInstance != null
        assert model.nivelEstudiosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/nivelEstudios/list'

        response.reset()

        populateValidParams(params)
        def nivelEstudios = new NivelEstudios(params)

        assert nivelEstudios.save() != null
        assert NivelEstudios.count() == 1

        params.id = nivelEstudios.id

        controller.delete()

        assert NivelEstudios.count() == 0
        assert NivelEstudios.get(nivelEstudios.id) == null
        assert response.redirectedUrl == '/nivelEstudios/list'
    }
}
