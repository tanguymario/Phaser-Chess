assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Piece = require './piece.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Direction = require '../../utils/direction.coffee'
DirectionUtils = require '../../utils/direction-utils.coffee'

class Knight extends Piece
  @R_POSITIONS = [
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

    tempCases = []
    for coords in Knight.R_POSITIONS
      tempCaseCoords = Coordinates.Add @currCase.boardCoords, coords
      tempCases.push @board.getCaseAtBoardCoords tempCaseCoords

    @setPossibleMovesFromArray tempCases


module.exports = Knight
