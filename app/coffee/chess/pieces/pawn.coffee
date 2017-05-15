assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Piece = require './piece.coffee'

Coordinates = require '../../utils/coordinates.coffee'

class Pawn extends Piece
  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme
    @hasDoneFirstMove = false


  calculatePossibleMoves: ->
    super

    tempCases = []

    tempCaseCoords = @currCase.boardCoords.clone()
    tempCaseCoords.y -= 1

    tempCases.push @board.getCaseAtBoardCoords tempCaseCoords

    if not @hasDoneFirstMove
      tempCaseCoords.y -= 1
      tempCases.push @board.getCaseAtBoardCoords tempCaseCoords

    console.log tempCases
    @setPossibleMovesFromArray tempCases


  moveTo: (caseToGo) ->
    if caseToGo != @currCase
      @hasDoneFirstMove = true

    super


module.exports = Pawn
