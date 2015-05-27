require ["config"], (config) ->
  require ["app", "common"], (App, Common) ->
    window.app = new App
    window.common = new Common
    common.generateRhomb()
    common.generateScalableBlock el: '.dogs'

    common.generateScalableBlock el: '#image-rhomb'
