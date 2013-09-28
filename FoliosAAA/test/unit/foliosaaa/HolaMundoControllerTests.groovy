package foliosaaa



import org.junit.*
import grails.test.mixin.*

@TestFor(HolaMundoController)
@Mock(HolaMundo)
class HolaMundoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/holaMundo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.holaMundoInstanceList.size() == 0
        assert model.holaMundoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.holaMundoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.holaMundoInstance != null
        assert view == '/holaMundo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/holaMundo/show/1'
        assert controller.flash.message != null
        assert HolaMundo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/holaMundo/list'

        populateValidParams(params)
        def holaMundo = new HolaMundo(params)

        assert holaMundo.save() != null

        params.id = holaMundo.id

        def model = controller.show()

        assert model.holaMundoInstance == holaMundo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/holaMundo/list'

        populateValidParams(params)
        def holaMundo = new HolaMundo(params)

        assert holaMundo.save() != null

        params.id = holaMundo.id

        def model = controller.edit()

        assert model.holaMundoInstance == holaMundo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/holaMundo/list'

        response.reset()

        populateValidParams(params)
        def holaMundo = new HolaMundo(params)

        assert holaMundo.save() != null

        // test invalid parameters in update
        params.id = holaMundo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/holaMundo/edit"
        assert model.holaMundoInstance != null

        holaMundo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/holaMundo/show/$holaMundo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        holaMundo.clearErrors()

        populateValidParams(params)
        params.id = holaMundo.id
        params.version = -1
        controller.update()

        assert view == "/holaMundo/edit"
        assert model.holaMundoInstance != null
        assert model.holaMundoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/holaMundo/list'

        response.reset()

        populateValidParams(params)
        def holaMundo = new HolaMundo(params)

        assert holaMundo.save() != null
        assert HolaMundo.count() == 1

        params.id = holaMundo.id

        controller.delete()

        assert HolaMundo.count() == 0
        assert HolaMundo.get(holaMundo.id) == null
        assert response.redirectedUrl == '/holaMundo/list'
    }
}
