assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Square = require '../../utils/geometry/square.coffee'

Matrix = require '../../utils/math/matrix.coffee'

Case = require './case.coffee'

class Board
  constructor: (game, boardConfig, boardTheme, piecesTheme, squareView) ->
    assert boardConfig?, "Board Config missing"
    assert boardTheme?, "Board Theme missing"
    assert squareView instanceof Square, "Rectangle view missing"

    @game = game
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

    @tab = new Array @config.length
    for i in [0...@config.length] by 1
      @tab[i] = new Array @config[i].length
      for j in [0...@config[i].length] by 1
        boardCoords = new Coordinates j, i

        gameCoords = topLeftBoard.clone()
        gameCoords.x += boardCoords.x * @caseSize
        gameCoords.y += boardCoords.y * @caseSize

        @tab[i][j] = new Case @game, @, boardCoords, gameCoords
        if @config[i][j]?
          currCase = @tab[i][j]
          currCase.piece = new @config[i][j].instance @game, currCase, @config[i][j], piecesTheme



  # Return the case at game coords
  getCaseAtGameCoords: (coords) ->
    debug 'getCaseAtGameCoords...', @, 'info', 100, debugThemes.Grid
    if @layout.view.isInside coords, false
      topLeft = @layout.view.getTopLeft()
      coords = Coordinates.Sub coords, topLeft
      column = Math.floor coords.x / @layout.caseSize
      line = Math.floor coords.y / @layout.caseSize

      gridCoords = new Coordinates column, line
      return @getCaseAtGridCoords gridCoords
    return null


  # Return a case in at grid coords
  getCaseAtBoardCoords: (coords) ->
    assert coords instanceof Coordinates, "Coords missing"

    if coords.x >= 0 and coords.x < @matrix.width
      if coords.y >= 0 and coords.y < @matrix.height
        return @tab.getAt coords.x, coords.y

    debug 'getCaseAtGridCoords: coords out of bounds', @, 'warning', 250, debugThemes.Grid, coords
    return null


module.exports = Board
