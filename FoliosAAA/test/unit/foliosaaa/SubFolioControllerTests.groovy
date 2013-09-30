package foliosaaa



import org.junit.*
import grails.test.mixin.*

@TestFor(SubFolioController)
@Mock(SubFolio)
class SubFolioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subFolio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subFolioInstanceList.size() == 0
        assert model.subFolioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subFolioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subFolioInstance != null
        assert view == '/subFolio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subFolio/show/1'
        assert controller.flash.message != null
        assert SubFolio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subFolio/list'

        populateValidParams(params)
        def subFolio = new SubFolio(params)

        assert subFolio.save() != null

        params.id = subFolio.id

        def model = controller.show()

        assert model.subFolioInstance == subFolio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subFolio/list'

        populateValidParams(params)
        def subFolio = new SubFolio(params)

        assert subFolio.save() != null

        params.id = subFolio.id

        def model = controller.edit()

        assert model.subFolioInstance == subFolio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subFolio/list'

        response.reset()

        populateValidParams(params)
        def subFolio = new SubFolio(params)

        assert subFolio.save() != null

        // test invalid parameters in update
        params.id = subFolio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subFolio/edit"
        assert model.subFolioInstance != null

        subFolio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subFolio/show/$subFolio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subFolio.clearErrors()

        populateValidParams(params)
        params.id = subFolio.id
        params.version = -1
        controller.update()

        assert view == "/subFolio/edit"
        assert model.subFolioInstance != null
        assert model.subFolioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subFolio/list'

        response.reset()

        populateValidParams(params)
        def subFolio = new SubFolio(params)

        assert subFolio.save() != null
        assert SubFolio.count() == 1

        params.id = subFolio.id

        controller.delete()

        assert SubFolio.count() == 0
        assert SubFolio.get(subFolio.id) == null
        assert response.redirectedUrl == '/subFolio/list'
    }
}
