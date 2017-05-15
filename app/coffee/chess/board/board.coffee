assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Square = require '../../utils/geometry/square.coffee'

Matrix = require '../../utils/math/matrix.coffee'

Case = require './case.coffee'

class Board
  constructor: (game, chess, boardConfig, boardTheme, piecesTheme, squareView) ->
    assert boardConfig?, "Board Config missing"
    assert boardTheme?, "Board Theme missing"
    assert squareView instanceof Square, "Rectangle view missing"

    @game = game
    @chess = chess
    @config = boardConfig
    @theme = boardTheme
    @view = squareView

    viewCenter = @view.getCenter()
    @sprite = @game.add.sprite viewCenter.x, viewCenter.y, @theme.key
    @sprite.anchor.setTo 0.5, 0.5
    assert @sprite.width == @sprite.height, "Board is not a square"

    @scaleFactor = @view.size / @sprite.width
    @sprite.scale.setTo @scaleFactor

    @borderSize = @theme.borderSize * @scaleFactor
    @caseSize = @theme.caseSize * @scaleFactor

    topLeftBoard = new Coordinates @borderSize, @borderSize
    topLeftBoard = Coordinates.Add @view.getTopLeft(), topLeftBoard
    @boardView = new Square topLeftBoard, @caseSize * @config.length

    # Pieces creation
    @tab = new Array @config.length
    for i in [0...@config.length] by 1
      @tab[i] = new Array @config[i].length
      for j in [0...@config[i].length] by 1
        boardCoords = new Coordinates j, i

        gameCoords = @boardView.getTopLeft().clone()
        gameCoords.x += boardCoords.x * @caseSize + @caseSize / 2
        gameCoords.y += boardCoords.y * @caseSize + @caseSize / 2

        @tab[i][j] = new Case @game, @, boardCoords, gameCoords
        if @config[i][j]?
          currCase = @tab[i][j]
          currCase.piece = new @config[i][j].instance @game, @, currCase, @config[i][j], piecesTheme
    @tab = new Matrix @tab

  # Return the case at game coords
  getCaseAtGameCoords: (coords) ->
    debug 'getCaseAtGameCoords...', @, 'info', 100, debugThemes.Grid
    if @boardView.isInside coords, false
      topLeft = @boardView.getTopLeft()
      coords = Coordinates.Sub coords, topLeft
      column = Math.floor coords.x / @caseSize
      line = Math.floor coords.y / @caseSize

      gridCoords = new Coordinates column, line
      return @getCaseAtBoardCoords gridCoords
    return null


  # Return a case in at grid coords
  getCaseAtBoardCoords: (coords) ->
    assert coords instanceof Coordinates, "Coords missing"

    if coords.x >= 0 and coords.x < @tab.width
      if coords.y >= 0 and coords.y < @tab.height
        return @tab.getAt coords.x, coords.y

    debug 'getCaseAtGridCoords: coords out of bounds', @, 'warning', 250, debugThemes.Grid, coords
    return null


module.exports = Board
