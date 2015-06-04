HomeCtrl = ($scope)->
  $scope.title = "Home"
  $scope.num = 1
  $scope.incr = ->
    $scope.num++
    getOdd()
  $scope.incrRandom = ->
    $scope.num = $scope.num + _.random 1, 99
    getOdd()
  $scope.decr = ->
    if $scope.num > 0
      $scope.num--
      getOdd()
  $scope.toZero = ->
    $scope.num = 1
    getOdd()
  $scope.alert = ->
    alert $scope.title

  getOdd = ->
    if $scope.num % 2
      $scope.odd = true
    else
      $scope.odd = false

  $scope.listExp = []

  _.each [1..99], (e)->
    $scope.listExp.push {
      name: "Item number #{e}"
    }

  $scope.odd = true

module.exports = HomeCtrl

# для добавления отдельных модулей
# exports.AlertCtrl = -> alert 'hello'
# exports.Alert@Ctrl = -> alert 'hello2'
