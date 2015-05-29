$ = require 'jquery'
_ = require 'lodash'
class Item1
  constructor:->
    @name = "item 1"
    console.log "Hello this is a #{@name} class!"

module.exports = new Item1

