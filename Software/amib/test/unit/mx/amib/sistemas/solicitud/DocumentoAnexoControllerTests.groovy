package mx.amib.sistemas.solicitud



import org.junit.*
import grails.test.mixin.*

@TestFor(DocumentoAnexoController)
@Mock(DocumentoAnexo)
class DocumentoAnexoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/documentoAnexo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.documentoAnexoInstanceList.size() == 0
        assert model.documentoAnexoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.documentoAnexoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.documentoAnexoInstance != null
        assert view == '/documentoAnexo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/documentoAnexo/show/1'
        assert controller.flash.message != null
        assert DocumentoAnexo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/documentoAnexo/list'

        populateValidParams(params)
        def documentoAnexo = new DocumentoAnexo(params)

        assert documentoAnexo.save() != null

        params.id = documentoAnexo.id

        def model = controller.show()

        assert model.documentoAnexoInstance == documentoAnexo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/documentoAnexo/list'

        populateValidParams(params)
        def documentoAnexo = new DocumentoAnexo(params)

        assert documentoAnexo.save() != null

        params.id = documentoAnexo.id

        def model = controller.edit()

        assert model.documentoAnexoInstance == documentoAnexo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/documentoAnexo/list'

        response.reset()

        populateValidParams(params)
        def documentoAnexo = new DocumentoAnexo(params)

        assert documentoAnexo.save() != null

        // test invalid parameters in update
        params.id = documentoAnexo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/documentoAnexo/edit"
        assert model.documentoAnexoInstance != null

        documentoAnexo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/documentoAnexo/show/$documentoAnexo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        documentoAnexo.clearErrors()

        populateValidParams(params)
        params.id = documentoAnexo.id
        params.version = -1
        controller.update()

        assert view == "/documentoAnexo/edit"
        assert model.documentoAnexoInstance != null
        assert model.documentoAnexoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/documentoAnexo/list'

        response.reset()

        populateValidParams(params)
        def documentoAnexo = new DocumentoAnexo(params)

        assert documentoAnexo.save() != null
        assert DocumentoAnexo.count() == 1

        params.id = documentoAnexo.id

        controller.delete()

        assert DocumentoAnexo.count() == 0
        assert DocumentoAnexo.get(documentoAnexo.id) == null
        assert response.redirectedUrl == '/documentoAnexo/list'
    }
}
