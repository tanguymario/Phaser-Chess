assert = require '../utils/assert.coffee'

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

Board = require './board/board.coffee'
Square = require '../utils/geometry/square.coffee'

Team = require './pieces/team.coffee'

Coordinates = require '../utils/coordinates.coffee'

class Chess
  @V_MIN_PLAYERS = 2
  @V_MAX_PLAYERS = 2

  constructor: (game, chessConfig, boardConfig, boardTheme, piecesTheme, players...) ->
    assert game?, "Game missing"
    assert chessConfig?, "Chess config missing"
    assert boardConfig?, "Board Config missing"
    assert piecesTheme?, "Pieces Theme missing"
    assert players.length >= Chess.V_MIN_PLAYERS, "Not enough players"
    assert players.length <= Chess.V_MAX_PLAYERS, "Too much players"

    @game = game
    @config = chessConfig
    @players = players
    @turn = Team.White

    # For now, we supppose that board gets all game size
    boardSize = Math.min @game.width, @game.height
    halfBoardSize = boardSize / 2

    boardTopLeftX = @game.world.centerX - halfBoardSize
    boardTopLeftY = @game.world.centerY - halfBoardSize
    boardTopLeft = new Coordinates boardTopLeftX, boardTopLeftY

    boardView = new Square boardTopLeft, boardSize
    board = new Board @game, @, boardConfig, boardTheme, piecesTheme, boardView

    @history = []
    @movesCount = 0


module.exports = Chess
