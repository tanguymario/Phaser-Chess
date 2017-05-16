assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

PieceSingleMove = require './piece-single-move.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Direction = require '../../utils/direction.coffee'
DirectionUtils = require '../../utils/direction-utils.coffee'

class Knight extends PieceSingleMove
  @R_MOVES = [
    new Coordinates -1, -2
    new Coordinates 1, -2
    new Coordinates 2, -1
    new Coordinates 2, 1
    new Coordinates -2, -1
    new Coordinates -2, 1
    new Coordinates -1, 2
    new Coordinates 1, 2
  ]


  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme


  calculatePossibleMoves: ->
    super

    moves = @getMovesFromCoords Knight.R_MOVES
    @setPossibleMovesFromArray moves


module.exports = Knight
