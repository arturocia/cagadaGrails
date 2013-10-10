package mx.amib.sistemas.solicitante



import org.junit.*
import grails.test.mixin.*

@TestFor(ArchivoFotoController)
@Mock(ArchivoFoto)
class ArchivoFotoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/archivoFoto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.archivoFotoInstanceList.size() == 0
        assert model.archivoFotoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.archivoFotoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.archivoFotoInstance != null
        assert view == '/archivoFoto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/archivoFoto/show/1'
        assert controller.flash.message != null
        assert ArchivoFoto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/archivoFoto/list'

        populateValidParams(params)
        def archivoFoto = new ArchivoFoto(params)

        assert archivoFoto.save() != null

        params.id = archivoFoto.id

        def model = controller.show()

        assert model.archivoFotoInstance == archivoFoto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/archivoFoto/list'

        populateValidParams(params)
        def archivoFoto = new ArchivoFoto(params)

        assert archivoFoto.save() != null

        params.id = archivoFoto.id

        def model = controller.edit()

        assert model.archivoFotoInstance == archivoFoto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/archivoFoto/list'

        response.reset()

        populateValidParams(params)
        def archivoFoto = new ArchivoFoto(params)

        assert archivoFoto.save() != null

        // test invalid parameters in update
        params.id = archivoFoto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/archivoFoto/edit"
        assert model.archivoFotoInstance != null

        archivoFoto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/archivoFoto/show/$archivoFoto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        archivoFoto.clearErrors()

        populateValidParams(params)
        params.id = archivoFoto.id
        params.version = -1
        controller.update()

        assert view == "/archivoFoto/edit"
        assert model.archivoFotoInstance != null
        assert model.archivoFotoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/archivoFoto/list'

        response.reset()

        populateValidParams(params)
        def archivoFoto = new ArchivoFoto(params)

        assert archivoFoto.save() != null
        assert ArchivoFoto.count() == 1

        params.id = archivoFoto.id

        controller.delete()

        assert ArchivoFoto.count() == 0
        assert ArchivoFoto.get(archivoFoto.id) == null
        assert response.redirectedUrl == '/archivoFoto/list'
    }
}
