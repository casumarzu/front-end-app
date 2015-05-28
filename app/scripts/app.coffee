
Shit = require './shit.coffee'
require './items/item1.coffee'
require './items/item2.coffee'
require './items/item3.coffee'
require './items/item4.coffee'
require './items/item5.coffee'

window.addEventListener 'load', ->
  window.app = new App
  shitty = new Shit

class App
  constructor:->
    console.log 'app initialize!'
