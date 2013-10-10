package mx.amib.sistemas.solicitud



import org.junit.*
import grails.test.mixin.*

@TestFor(ArchivoDocumentoAnexoController)
@Mock(ArchivoDocumentoAnexo)
class ArchivoDocumentoAnexoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/archivoDocumentoAnexo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.archivoDocumentoAnexoInstanceList.size() == 0
        assert model.archivoDocumentoAnexoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.archivoDocumentoAnexoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.archivoDocumentoAnexoInstance != null
        assert view == '/archivoDocumentoAnexo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/archivoDocumentoAnexo/show/1'
        assert controller.flash.message != null
        assert ArchivoDocumentoAnexo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/archivoDocumentoAnexo/list'

        populateValidParams(params)
        def archivoDocumentoAnexo = new ArchivoDocumentoAnexo(params)

        assert archivoDocumentoAnexo.save() != null

        params.id = archivoDocumentoAnexo.id

        def model = controller.show()

        assert model.archivoDocumentoAnexoInstance == archivoDocumentoAnexo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/archivoDocumentoAnexo/list'

        populateValidParams(params)
        def archivoDocumentoAnexo = new ArchivoDocumentoAnexo(params)

        assert archivoDocumentoAnexo.save() != null

        params.id = archivoDocumentoAnexo.id

        def model = controller.edit()

        assert model.archivoDocumentoAnexoInstance == archivoDocumentoAnexo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/archivoDocumentoAnexo/list'

        response.reset()

        populateValidParams(params)
        def archivoDocumentoAnexo = new ArchivoDocumentoAnexo(params)

        assert archivoDocumentoAnexo.save() != null

        // test invalid parameters in update
        params.id = archivoDocumentoAnexo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/archivoDocumentoAnexo/edit"
        assert model.archivoDocumentoAnexoInstance != null

        archivoDocumentoAnexo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/archivoDocumentoAnexo/show/$archivoDocumentoAnexo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        archivoDocumentoAnexo.clearErrors()

        populateValidParams(params)
        params.id = archivoDocumentoAnexo.id
        params.version = -1
        controller.update()

        assert view == "/archivoDocumentoAnexo/edit"
        assert model.archivoDocumentoAnexoInstance != null
        assert model.archivoDocumentoAnexoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/archivoDocumentoAnexo/list'

        response.reset()

        populateValidParams(params)
        def archivoDocumentoAnexo = new ArchivoDocumentoAnexo(params)

        assert archivoDocumentoAnexo.save() != null
        assert ArchivoDocumentoAnexo.count() == 1

        params.id = archivoDocumentoAnexo.id

        controller.delete()

        assert ArchivoDocumentoAnexo.count() == 0
        assert ArchivoDocumentoAnexo.get(archivoDocumentoAnexo.id) == null
        assert response.redirectedUrl == '/archivoDocumentoAnexo/list'
    }
}
