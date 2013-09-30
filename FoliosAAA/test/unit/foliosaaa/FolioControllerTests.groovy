package foliosaaa



import mx.com.amiba.controller.foliosaaa.FolioController;
import mx.com.amiba.foliosaaa.Folio;

import org.junit.*

import grails.test.mixin.*

@TestFor(FolioController)
@Mock(Folio)
class FolioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/folio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.folioInstanceList.size() == 0
        assert model.folioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.folioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.folioInstance != null
        assert view == '/folio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/folio/show/1'
        assert controller.flash.message != null
        assert Folio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/folio/list'

        populateValidParams(params)
        def folio = new Folio(params)

        assert folio.save() != null

        params.id = folio.id

        def model = controller.show()

        assert model.folioInstance == folio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/folio/list'

        populateValidParams(params)
        def folio = new Folio(params)

        assert folio.save() != null

        params.id = folio.id

        def model = controller.edit()

        assert model.folioInstance == folio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/folio/list'

        response.reset()

        populateValidParams(params)
        def folio = new Folio(params)

        assert folio.save() != null

        // test invalid parameters in update
        params.id = folio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/folio/edit"
        assert model.folioInstance != null

        folio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/folio/show/$folio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        folio.clearErrors()

        populateValidParams(params)
        params.id = folio.id
        params.version = -1
        controller.update()

        assert view == "/folio/edit"
        assert model.folioInstance != null
        assert model.folioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/folio/list'

        response.reset()

        populateValidParams(params)
        def folio = new Folio(params)

        assert folio.save() != null
        assert Folio.count() == 1

        params.id = folio.id

        controller.delete()

        assert Folio.count() == 0
        assert Folio.get(folio.id) == null
        assert response.redirectedUrl == '/folio/list'
    }
}
