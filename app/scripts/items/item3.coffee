$ = require 'jquery'
_ = require 'lodash'
class Item3
  constructor:->
    @name = "item 3"
    console.log "Hello this is a #{@name} class!"

module.exports = new Item3

