$ = require 'jquery'
_ = require 'lodash'
class Item4
  constructor:->
    @name = "item 4"
    console.log "Hello this is a #{@name} class!"

module.exports = new Item4

