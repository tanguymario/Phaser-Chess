assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Piece = require './piece.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Direction = require '../../utils/direction.coffee'
DirectionUtils = require '../../utils/direction-utils.coffee'

class King extends Piece
  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme


  calculatePossibleMoves: ->
    super

    tempCases = []
    Direction.enums.forEach (direction) =>
      directionCoords = DirectionUtils.toCanvasDirection direction.value.clone()
      tempCaseCoords = Coordinates.Add @currCase.boardCoords, directionCoords
      tempCases.push @board.getCaseAtBoardCoords tempCaseCoords

    @setPossibleMovesFromArray tempCases


module.exports = King
