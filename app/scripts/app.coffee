window.$ = 'jquery'
window._ = require 'underscore'
window.angular = require 'angular'
window.ngRoute = require 'angular-route'

window.app = angular.module "app", ['ngRoute']
HomeCtrl = require './controllers/home.coffee'
AboutCtrl = require './controllers/about.coffee'
ContactCtrl = require './controllers/contact.coffee'

app.controller 'MainController', ($scope, $route, $routeParams, $location)->
  $scope.$route = $route
  $scope.$location = $location
  $scope.$routeParams = $routeParams
app.controller 'HomeCtrl', ['$scope', HomeCtrl]
app.controller 'AboutCtrl', ['$scope', AboutCtrl]
app.controller 'ContactCtrl', ['$scope', ContactCtrl]

app.config ($routeProvider, $locationProvider) ->
  $routeProvider
  .when("/",
    templateUrl: "../templates/home.html"
    controller: "HomeCtrl"
  )
  .when("/about",
    templateUrl: "../templates/about.html"
    controller: "AboutCtrl"
  )
  .when("/contact",
    templateUrl: "../templates/contact.html"
    controller: "ContactCtrl"
  )
  .otherwise
    redirectTo: '/'

  # $locationProvider.html5Mode true


class App
  constructor:->
    console.log 'app initialize!'
