$ = require 'jquery'
_ = require 'lodash'
class Item5
  constructor:->
    @name = "item 5"
    console.log "Hello this is a #{@name} class!"

module.exports = new Item5

