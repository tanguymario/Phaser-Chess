assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

PieceSingleMove = require './piece-single-move.coffee'

Coordinates = require '../../utils/coordinates.coffee'

class Pawn extends PieceSingleMove
  @R_MOVES = [
    new Coordinates 0, -1 # North
  ]

  @R_SPECIAL_MOVES =
    DoubleForward: new Coordinates 0, -2


  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme
    @hasDoneFirstMove = false


  calculatePossibleMoves: ->
    super

    moves = @getMovesFromCoords Pawn.R_MOVES

    # Manage first move
    if not @hasDoneFirstMove
      tempCoords = Coordinates.Add @currCase.boardCoords, Pawn.R_SPECIAL_MOVES.DoubleForward
      moves.push @board.getCaseAtBoardCoords tempCoords

    @setPossibleMovesFromArray moves


  moveTo: (caseToGo) ->
    if caseToGo != @currCase
      @hasDoneFirstMove = true

    super


module.exports = Pawn
