package mx.amib.sistemas.sepomex.catalogo



import org.junit.*
import grails.test.mixin.*

@TestFor(SepomexController)
@Mock(Sepomex)
class SepomexControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sepomex/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sepomexInstanceList.size() == 0
        assert model.sepomexInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sepomexInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sepomexInstance != null
        assert view == '/sepomex/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sepomex/show/1'
        assert controller.flash.message != null
        assert Sepomex.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sepomex/list'

        populateValidParams(params)
        def sepomex = new Sepomex(params)

        assert sepomex.save() != null

        params.id = sepomex.id

        def model = controller.show()

        assert model.sepomexInstance == sepomex
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sepomex/list'

        populateValidParams(params)
        def sepomex = new Sepomex(params)

        assert sepomex.save() != null

        params.id = sepomex.id

        def model = controller.edit()

        assert model.sepomexInstance == sepomex
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sepomex/list'

        response.reset()

        populateValidParams(params)
        def sepomex = new Sepomex(params)

        assert sepomex.save() != null

        // test invalid parameters in update
        params.id = sepomex.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sepomex/edit"
        assert model.sepomexInstance != null

        sepomex.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sepomex/show/$sepomex.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sepomex.clearErrors()

        populateValidParams(params)
        params.id = sepomex.id
        params.version = -1
        controller.update()

        assert view == "/sepomex/edit"
        assert model.sepomexInstance != null
        assert model.sepomexInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sepomex/list'

        response.reset()

        populateValidParams(params)
        def sepomex = new Sepomex(params)

        assert sepomex.save() != null
        assert Sepomex.count() == 1

        params.id = sepomex.id

        controller.delete()

        assert Sepomex.count() == 0
        assert Sepomex.get(sepomex.id) == null
        assert response.redirectedUrl == '/sepomex/list'
    }
}
