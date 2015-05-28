$ = require 'jquery'
_ = require 'lodash'
class Item2
  constructor:->
    @name = "item 2"
    console.log "Hello this is a #{@name} class!"
    @showBody()
    @logShits @name
  showBody:->
    console.log $('body')
  logShits:(name)->
    _.each [1..10], (e)->
      console.log "#{name} number - #{e}"

module.exports = new Item2

