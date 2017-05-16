assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

CanvasUtils = require '../../utils/canvas-utils.coffee'

class Piece
  @V_TIME_MOVE = 1000

  constructor: (game, board, currCase, type, themes) ->
    assert currCase?, "Current Case missing"
    assert type?, "Type missing"

    @game = game
    @board = board
    @currCase = currCase
    @type = type
    @theme = themes.pieces
    @tweenMove = null
    @possibleMoves = []

    pos = currCase.gameCoords
    @sprite = @game.add.sprite pos.x, pos.y, @theme.key, @type.spriteFrame
    @sprite.anchor.setTo 0.5, 0.5

    @scaleFactor = currCase.board.caseSize / @sprite.width
    @sprite.scale.setTo @scaleFactor

    @sprite.events.onInputDown.add @downHandler, @
    @sprite.events.onInputUp.add @upHandler, @

    if @type.team == @board.chess.turn
      @enableInput()


  getMovesFromCoords: (directions) ->
    undefined # Defined in childrens


  calculatePossibleMoves: ->
    undefined # Defined in childrens


  updateInput: ->
    if @type.team == @board.chess.turn
      @enableInput()
    else
      @disableInput()


  goToCase: (caseToGo) ->
    @tweenMove = @game.add.tween(@sprite)
    @tweenMove.to( { x: caseToGo.gameCoords.x, y: caseToGo.gameCoords.y }, Piece.V_TIME_MOVE, Phaser.Easing.Exponential.Out, true)
    @tweenMove.start()


  moveTo: (caseToGo) ->
    assert caseToGo?, "Case To Go doesn't exist"
    @goToCase caseToGo
    @hidePossibilities()
    if caseToGo != @currCase
      @currCase.piece = null
      @currCase = caseToGo
      @currCase.piece = @
      @possibleMoves = []
      @board.updatePieces()


  enableInput: ->
    @sprite.inputEnabled = true
    @sprite.input.enableDrag false


  disableInput: ->
    @sprite.input.disableDrag false
    @sprite.inputEnabled = false


  setPossibleMovesFromArray: (tempCases) ->
    for tempCase in tempCases
      if @isCasePossible tempCase
        @possibleMoves.push tempCase


  hidePossibilities: ->
    for possibility in @possibleMoves
      possibility.hidePossible()


  showPossibilities: ->
    for possibility in @possibleMoves
      possibility.showPossible()


  downHandler: (sprite, event) ->
    console.log "down"
    @showPossibilities()
    if @tweenMove?
      @tweenMove.stop false


  isCasePossible: (caseToTest) ->
    return caseToTest? and not caseToTest.piece?


  upHandler: (sprite, event) ->
    console.log "up"

    coords = CanvasUtils.GetMouseCoordinatesInCanvas event
    caseToGo = @board.getCaseAtGameCoords coords

    if caseToGo in @possibleMoves
      @moveTo caseToGo
    else
      @moveTo @currCase


module.exports = Piece
