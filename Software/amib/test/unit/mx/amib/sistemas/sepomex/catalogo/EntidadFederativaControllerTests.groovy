package mx.amib.sistemas.sepomex.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(EntidadFederativaController)
@Mock(EntidadFederativa)
class EntidadFederativaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entidadFederativa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entidadFederativaInstanceList.size() == 0
        assert model.entidadFederativaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.entidadFederativaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.entidadFederativaInstance != null
        assert view == '/entidadFederativa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entidadFederativa/show/1'
        assert controller.flash.message != null
        assert EntidadFederativa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entidadFederativa/list'

        populateValidParams(params)
        def entidadFederativa = new EntidadFederativa(params)

        assert entidadFederativa.save() != null

        params.id = entidadFederativa.id

        def model = controller.show()

        assert model.entidadFederativaInstance == entidadFederativa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entidadFederativa/list'

        populateValidParams(params)
        def entidadFederativa = new EntidadFederativa(params)

        assert entidadFederativa.save() != null

        params.id = entidadFederativa.id

        def model = controller.edit()

        assert model.entidadFederativaInstance == entidadFederativa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entidadFederativa/list'

        response.reset()

        populateValidParams(params)
        def entidadFederativa = new EntidadFederativa(params)

        assert entidadFederativa.save() != null

        // test invalid parameters in update
        params.id = entidadFederativa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entidadFederativa/edit"
        assert model.entidadFederativaInstance != null

        entidadFederativa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entidadFederativa/show/$entidadFederativa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entidadFederativa.clearErrors()

        populateValidParams(params)
        params.id = entidadFederativa.id
        params.version = -1
        controller.update()

        assert view == "/entidadFederativa/edit"
        assert model.entidadFederativaInstance != null
        assert model.entidadFederativaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entidadFederativa/list'

        response.reset()

        populateValidParams(params)
        def entidadFederativa = new EntidadFederativa(params)

        assert entidadFederativa.save() != null
        assert EntidadFederativa.count() == 1

        params.id = entidadFederativa.id

        controller.delete()

        assert EntidadFederativa.count() == 0
        assert EntidadFederativa.get(entidadFederativa.id) == null
        assert response.redirectedUrl == '/entidadFederativa/list'
    }
}
