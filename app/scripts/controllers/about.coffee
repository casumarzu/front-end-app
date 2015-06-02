AboutCtrl = ($scope)->
  $scope.title = "About page"
  $scope.alert = ->
    alert $scope.title
module.exports = AboutCtrl

# для добавления отдельных модулей
# exports.AlertCtrl = -> alert 'hello'
# exports.Alert@Ctrl = -> alert 'hello2'
