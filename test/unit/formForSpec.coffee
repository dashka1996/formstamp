describe 'fsFormFor', ->
  require '../../src/coffee/formFor'
  $scope = null
  $compile = null

  beforeEach angular.mock.module('formstamp')

  beforeEach inject ($rootScope, _$compile_) ->
    $scope = $rootScope.$new()

    $scope.submitCount = 0

    $scope.submit = (event) ->
      $scope.submitCount = $scope.submitCount + 1
      event.preventDefault()
      return false

    $scope.titles = ['developer', 'manager', 'ceo', 'qa']

    $scope.user =
      name: "John Doe"
      email: "johndoe@example.com"
      title: "developer"

    $compile = _$compile_

  compile = (elem) ->
    elem ||= """
<form fs-form-for model="user" ng-submit="submit($event)">
  <fs-input as="text" name="name" required="" label="Name"></fs-input>
  <fs-input as="email" name="email" required="" label="Email"></fs-input>
  <fs-input as="fs-select" name="title" required="" label="Title" items="titles" freetext=""></fs-input>
</form fs-form-for>
    """
    element = $compile(elem)($scope)
    $scope.$apply()
    element

  it 'should expands', ->
    element = compile()
    expect(element.find("fs-input").length).toBe(0)
    expect(element.find("input[type='text']").length).toBe(2)
    expect(element.find("input[type='email']").length).toBe(1)

  it 'should wrap each control with .form-group', ->
    element = compile()
    expect(element.find('.form-group').length).toBe 3

  it 'should create label for each control', ->
    element = compile()
    expect(element.find('.form-group > label.control-label').length).toBe 3

  it 'should bind widgets to attributes of model', ->
    element = compile()
    expect(element.find('input[ng-model="user.name"]').length).toBe 1
    expect(element.find('input[ng-model="user.email"]').length).toBe 1
    expect(element.find('div[ng-model="user.title"]').length).toBe 1

  it 'should register only 3 inputs in FormController', ->
    element = compile()
    formCtrl = element.data('$formController')
    attrs = (name for name, val of formCtrl when '$' not in name)
    expect(attrs).toEqual(['name', 'email', 'title'])

  it 'should perform submit only once', ->
    element = compile()
    element.submit()
    expect($scope.submitCount).toBe 1
