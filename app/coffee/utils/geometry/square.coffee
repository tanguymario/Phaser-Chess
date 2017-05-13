Polygon = require './polygon.coffee'

Coordinates = require '../coordinates.coffee'

assert = require '../assert.coffee'

class Square extends Polygon
  constructor: (topLeft, size) ->
    assert topLeft instanceof Coordinates, "Top Left is not of type Coordinates"

    @size = size

    bottomLeft = new Coordinates topLeft.x, topLeft.y + @size
    topRight = new Coordinates topLeft.x + @size, topLeft.y
    bottomRight = new Coordinates topRight.x, bottomLeft.y

    super topLeft, bottomLeft, bottomRight, topRight


  getSize: ->
    return @size


  getCenter: ->
    center = @getTopLeft().clone()
    halfSize = @size / 2
    
    center.x += halfSize
    center.y += halfSize
    return center


  getDiagonalLength: ->
    return @size * Math.sqrt 2


  getTopLeft: ->
    return @points[0]


  getBottomLeft: ->
    return @points[1]


  getTopRight: ->
    return @points[3]


  getBottomRight: ->
    return @points[2]


  toString: ->
    return """
    Square :
      - Top Right :
        #{@getTopLeft().toString()}
      - Bottom Left :
        #{@getBottomLeft().toString()}
      - Top Left :
        #{@getTopLeft().toString()}
      - Bottom Right :
        #{@getBottomRight().toString()}
    """


module.exports = Square
