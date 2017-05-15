assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Piece = require './piece.coffee'

Coordinates = require '../../utils/coordinates.coffee'

class Rook extends Piece
  @R_COORDS_POSSIBLES = [
    new Coordinates 1, 0 # East
    new Coordinates -1, 0 # West
    new Coordinates 0, 1 # South
    new Coordinates 0, -1 # North
  ]

  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme


  calculatePossibleMoves: ->
    super

    coordsPossibles = Rook.R_COORDS_POSSIBLES.splice 0

    while coordsPossibles.length > 0
      for i in [0...coordsPossibles.length] by 1
        coords = coordsPossibles[i]
        console.log i
        tempCaseCoords = Coordinates.Add @currCase.boardCoords, coords
        caseAtCoords = @board.getCaseAtBoardCoords tempCaseCoords
        if @isCasePossible caseAtCoords
          tempCases.push caseAtCoords
        else
          coordsPossibles.splice i, 1

    @setPossibleMovesFromArray tempCases


module.exports = Rook
