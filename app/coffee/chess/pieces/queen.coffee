assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

PieceMultipleMoves = require './piece-multiple-moves.coffee'

Coordinates = require '../../utils/coordinates.coffee'

class Queen extends PieceMultipleMoves
  @R_MOVES = [
    new Coordinates -1, 0 # West
    new Coordinates -1, -1 # North West
    new Coordinates 0, -1 # North
    new Coordinates 1, -1 # North East
    new Coordinates 1, 0 # East
    new Coordinates 1, 1 # South East
    new Coordinates 0, 1 # South
    new Coordinates -1, 1 # South West
  ]


  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme


  calculatePossibleMoves: ->
    super

    moves = @getMovesFromCoords Queen.R_MOVES
    @setPossibleMovesFromArray moves


module.exports = Queen
