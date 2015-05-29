
Shit = require './shit.coffee'
require './items/item1.coffee'
require './items/item2.coffee'
require './items/item3.coffee'
require './items/item4.coffee'
require './items/item5.coffee'

$ = require 'jquery'

Common = require './common.coffee'

window.addEventListener 'load', ->
  window.app = new App
  app.request()

  window.common = new Common
  # common.generateRhomb '#image-rhomb', '/images/dogs.gif'
  # common.generateScalableBlock el: '#image-rhomb'

  shitty = new Shit



class App
  constructor:->
    console.log 'app initialize!'

  baseUrl: 'http://localhost:9000/proxy/be-better.snpdev.ru'
  request:->
    $.ajax
      url: "#{@baseUrl}/api/pages"
      data:
        page: 'index'
      dataType: 'json'
      type: "GET"
    .done (data)->
      console.log data
    .fail (data)->
      console.log 'fail', data
