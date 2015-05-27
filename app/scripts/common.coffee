define (require, exports, module)->

  PaintRhomb = require 'utils/generateRhomb'
  ScalableBlock = require 'utils/scalableBlock'

  class Common
    constructor:->
      console.log 'common initialize'

    generateRhomb:->
      id = 'image-rhomb'
      image = '/images/dogs.gif'
      @rhomb = new PaintRhomb id, image

    generateScalableBlock: (data)->
      @scalableBlock = new ScalableBlock data
