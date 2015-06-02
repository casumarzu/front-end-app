Router = ($routeProvider, $locationProvider)->
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
