assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

PieceSingleMove = require './piece-single-move.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Team = require './team.coffee'

White = Team.White
Black = Team.Black

class Pawn extends PieceSingleMove
  @R_MOVES =
    White:
      forward: new Coordinates 0, -1 # North
      forward_left: new Coordinates -1, -1
      forward_right: new Coordinates 1, -1
      double_forward: new Coordinates 0, -2 # North, North
    Black:
      forward: new Coordinates 0, 1 # North
      forward_left: new Coordinates -1, 1
      forward_right: new Coordinates 1, 1
      double_forward: new Coordinates 0, 2


  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme
    @hasDoneFirstMove = false


  calculatePossibleMoves: ->
    super

    moves = []

    tempCoords = Coordinates.Add @currCase.boardCoords, Pawn.R_MOVES[@type.team].forward
    tempCase = @board.getCaseAtBoardCoords tempCoords
    if tempCase? and not tempCase.piece?
      moves.push tempCase
      if not @hasDoneFirstMove and not tempCase.piece
        # Manage first move
        tempCoords = Coordinates.Add @currCase.boardCoords, Pawn.R_MOVES[@type.team].double_forward
        tempCase = @board.getCaseAtBoardCoords tempCoords
        if tempCase? and not tempCase.piece?
          moves.push @board.getCaseAtBoardCoords tempCoords

    tempCoords = Coordinates.Add @currCase.boardCoords, Pawn.R_MOVES[@type.team].forward_left
    tempCase = @board.getCaseAtBoardCoords tempCoords
    if tempCase? and tempCase.piece? and tempCase.piece.type.team != @type.team
      moves.push tempCase

    tempCoords = Coordinates.Add @currCase.boardCoords, Pawn.R_MOVES[@type.team].forward_right
    tempCase = @board.getCaseAtBoardCoords tempCoords
    if tempCase? and tempCase.piece? and tempCase.piece.type.team != @type.team
      moves.push tempCase

    @setPossibleMovesFromArray moves, false


  moveTo: (caseToGo) ->
    if caseToGo != @currCase
      @hasDoneFirstMove = true

    super


module.exports = Pawn
