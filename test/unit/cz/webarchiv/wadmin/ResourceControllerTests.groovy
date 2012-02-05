package cz.webarchiv.wadmin

import grails.test.mixin.Mock
import grails.test.mixin.TestFor

@TestFor(ResourceController)
@Mock(Resource)
class ResourceControllerTests {


  def populateValidParams(params) {
    assert params != null
    // TODO: Populate valid properties like...
    //params["name"] = 'someValidName'
  }

  void testIndex() {
    controller.index()
    assert "/resource/list" == response.redirectedUrl
  }

  void testList() {

    def model = controller.list()

    assert model.resourceInstanceList.size() == 0
    assert model.resourceInstanceTotal == 0
  }

  void testCreate() {
    def model = controller.create()

    assert model.resourceInstance != null
  }

  void testSave() {
    controller.save()

    assert model.resourceInstance != null
    assert view == '/resource/create'

    response.reset()

    populateValidParams(params)
    controller.save()

    assert response.redirectedUrl == '/resource/show/1'
    assert controller.flash.message != null
    assert Resource.count() == 1
  }

  void testShow() {
    controller.show()

    assert flash.message != null
    assert response.redirectedUrl == '/resource/list'


    populateValidParams(params)
    def resource = new Resource(params)

    assert resource.save() != null

    params.id = resource.id

    def model = controller.show()

    assert model.resourceInstance == resource
  }

  void testEdit() {
    controller.edit()

    assert flash.message != null
    assert response.redirectedUrl == '/resource/list'


    populateValidParams(params)
    def resource = new Resource(params)

    assert resource.save() != null

    params.id = resource.id

    def model = controller.edit()

    assert model.resourceInstance == resource
  }

  void testUpdate() {
    controller.update()

    assert flash.message != null
    assert response.redirectedUrl == '/resource/list'

    response.reset()


    populateValidParams(params)
    def resource = new Resource(params)

    assert resource.save() != null

    // test invalid parameters in update
    params.id = resource.id
    //TODO: add invalid values to params object

    controller.update()

    assert view == "/resource/edit"
    assert model.resourceInstance != null

    resource.clearErrors()

    populateValidParams(params)
    controller.update()

    assert response.redirectedUrl == "/resource/show/$resource.id"
    assert flash.message != null

    //test outdated version number
    response.reset()
    resource.clearErrors()

    populateValidParams(params)
    params.id = resource.id
    params.version = -1
    controller.update()

    assert view == "/resource/edit"
    assert model.resourceInstance != null
    assert model.resourceInstance.errors.getFieldError('version')
    assert flash.message != null
  }

  void testDelete() {
    controller.delete()
    assert flash.message != null
    assert response.redirectedUrl == '/resource/list'

    response.reset()

    populateValidParams(params)
    def resource = new Resource(params)

    assert resource.save() != null
    assert Resource.count() == 1

    params.id = resource.id

    controller.delete()

    assert Resource.count() == 0
    assert Resource.get(resource.id) == null
    assert response.redirectedUrl == '/resource/list'
  }
}
