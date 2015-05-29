$ = require 'jquery'
_ = require 'lodash'
class ShitClass
  constructor:->
    console.log 'Hello this is a shit class!'
    @showBody()
    @logShits()
  showBody:->
    _.each $('*'), (e)->
      console.log e
    console.log $('body')
  logShits:->
    _.each [1..5], (e)->
      string = "Shit number - #{e}"
      console.log string
      $('body').append "<div style='padding: 30px;height: 30px;line-height: 30px;'>#{string}</div>"

class AnotherShitClass extends ShitClass
  constructor:->
    super
    console.log '================='
    console.log 'shit!'
    console.log '================='

module.exports = AnotherShitClass

