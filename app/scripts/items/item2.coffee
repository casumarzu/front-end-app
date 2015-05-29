$ = require 'jquery'
_ = require 'lodash'
class Item2
  constructor:->
    @name = "item 2"
    console.log "Hello this is a #{@name} class!"

module.exports = new Item2

