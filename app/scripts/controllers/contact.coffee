ContactCtrl = ($scope)->
  $scope.title = "Contact"
  $scope.alert = ->
    alert $scope.title
module.exports = ContactCtrl

# для добавления отдельных модулей
# exports.AlertCtrl = -> alert 'hello'
# exports.Alert@Ctrl = -> alert 'hello2'
