AboutCtrl = ($scope)->
  $scope.title = "About"
  $scope.alert = ->
    alert $scope.title

  $scope.func = ->
    console.log angular.uppercase 'Hello Man'
module.exports = AboutCtrl

# для добавления отдельных модулей
# exports.AlertCtrl = -> alert 'hello'
# exports.Alert@Ctrl = -> alert 'hello2'
