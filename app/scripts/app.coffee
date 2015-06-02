window.$ = 'jquery'
window._ = require 'underscore'
window.angular = require 'angular'
window.ngRoute = require 'angular-route'

app = angular.module "app", ['ngRoute']

app.controller 'MainController', ($scope, $route, $routeParams, $location)->
  $scope.$route = $route
  $scope.$location = $location
  $scope.$routeParams = $routeParams

HomeCtrl = require './controllers/home.coffee'

app.controller('HomeCtrl', ['$scope', HomeCtrl.HomeCtrl])

app.controller 'AboutCtrl', ($scope, $routeParams)->
  $scope.title = "About page"
  $scope.alert = ->
    alert $scope.title

app.controller 'ContactCtrl', ($scope, $routeParams)->
  $scope.title = "Cont page"
  $scope.alert = ->
    alert $scope.title

app.config ($routeProvider, $locationProvider) ->
  $routeProvider
  .when("/", {
      templateUrl: "../templates/home.html"
      controller: "HomeCtrl"
    }
  )
  .when("/about", {
      templateUrl: "../templates/about.html"
      controller: "AboutCtrl"
    }
  )
  .when("/contact", {
      templateUrl: "../templates/contact.html"
      controller: "ContactCtrl"
      # resolve:
      #   delay: ($q, $timeout) ->
      #     delay = $q.defer()
      #     $timeout delay.resolve, 1000
      #     delay.promise
    }
  )

  # $locationProvider.html5Mode true


# class App
#   constructor:->
#     console.log 'app initialize!'

#   # baseUrl: 'http://localhost:9000/proxy/be-better.snpdev.ru'
#   request:->
#     $.ajax
#       url: "/api/pages"
#       data:
#         page: 'index'
#       dataType: 'json'
#       type: "GET"
#     .done (data)->
#       console.log data
#     .fail (data)->
#       console.log 'fail', data
